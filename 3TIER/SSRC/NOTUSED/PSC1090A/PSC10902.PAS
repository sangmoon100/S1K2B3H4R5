unit PSC10902;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, OraSmart, ExtCtrls, Mask, Func, JPEG,
  OnFocusButton, OnEditBtnCtrl, OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl,
  OnEditNumCtl, ComCtrls;

type
  TFmImageSave = class(TForm)
    Panel1: TPanel;
    FileOpen: TSpeedButton;
    Panel3: TPanel;
    pimg1: TImage;
    Panel6: TPanel;
    pImg2: TImage;
    OraSession1: TOraSession;
    OraTable1: TOraTable;
    OraTable1EMPNO: TStringField;
    OraTable1SEQ: TIntegerField;
    OraTable1GUBUN: TStringField;
    OraTable1PHOTO: TBlobField;
    OraTable1WRITETIME: TStringField;
    OraTable1WRITEEMP: TStringField;
    OraTable1ROWID: TStringField;
    BB_Close: TOnFocusButton;
    BT_Save: TOnFocusButton;
    EdAppdate: TOnMaskEdit;
    EdSeq: TOnEdit;
    EdKorname: TOnEdit;
    EdEmpno: TOnEdit;
    CbGubun: TOnComboEdit;
    Filenm: TOnEdit;
    OraTable1GBPAGE: TIntegerField;
    OpenDialog1: TOpenDialog;
    label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    procedure FileOpenClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure E_GBPageChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImageFind;
  end;

var
  FmImageSave: TFmImageSave;

implementation

uses PSC10901, PSC10903;

{$R *.DFM}

procedure TFmImageSave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Ora_Session.Disconnect;
     Action := caFree;
end;

procedure TFmImageSave.FormActivate(Sender: TObject);
begin
     OraConnect;

     EdEmpno.Text    := FM_Main.TMaxDataSet1.FieldByName('empno'  ).AsString;
     EdKorname.Text  := FM_Main.TMaxDataSet1.FieldByName('korname').AsString;
     EdSeq.Text      := IntToStr(FM_Main.TMaxDataSet1.FieldByName('seq').AsInteger);
     EdAppdate.Text  := FM_Main.TMaxDataSet1.FieldByName('appdate').AsString;

     ImageFind;
     Filenm.SetFocus;
end;

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

procedure TFmImageSave.ImageFind;
var
     Stream    : TMemoryStream;
     JPEGImage : TJPEGImage;
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select photo               ');
               SQL.Add('  from Pstock_image        ');
               SQL.Add(' where empno    = :empno   ');
               SQL.Add('   and seq      = :seq     ');
               SQL.Add('   and gubun    = :gubun   ');
               //SQL.Add('   and gbpage   = :gbpage  ');

               ParamByName('empno'   ).AsString  := FM_Main.TMaxDataSet1.FieldByName('empno'   ).AsString;
               ParamByName('seq'     ).AsInteger := FM_Main.TMaxDataSet1.FieldByName('seq'     ).AsInteger;
               ParamByName('gubun'   ).AsString  := IntToStr(CbGubun.ItemIndex);
               //ParamByName('gbpage'  ).AsInteger := StrToInt(E_GBPage.Text);
               Open;

               try
                    Stream    := TMemoryStream.Create;
                    JPEGImage := TJPEGImage.Create;

                   //pimg2.picture.Graphic := nil;  //이미지파일 업로드시에...

                    TblobField(qq.FieldByName('photo')).SaveToStream(Stream);
                    Stream.Position := 0;

                    //JPEGImage.LoadFromStream(Stream);                         //이미지파일 업로드시에...
                    //if Stream.Size <> 0 then pimg2.picture.Assign(JPEGImage); //이미지파일 업로드시에...
               finally
                    Stream.free;
                    JPEGImage.Free;
               end;
          end;
     finally
          qq.Free;
     end;
end;

procedure TFmImageSave.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFmImageSave.BT_SaveClick(Sender: TObject);
var
     MemoryStream : TMemoryStream;
begin
     StatusBar1.Panels[1].Text := '해당 서류를 저장합니다 !!.';

     OraTable1.Session := Ora_Session;
     OraTable1.Open;
     if FM_Main.iSelect = 0 then
     begin
          OraTable1.Insert;
          OraTable1.FieldByName('empno').AsString  := EdEmpno.Text;
          OraTable1.FieldByName('seq'  ).AsFloat   := StrToFloat(EdSeq.Text);
          OraTable1.FieldByName('gubun').AsString  := IntToStr(CbGubun.ItemIndex);
          //OraTable1.FieldByName('gbpage').AsFloat  := StrToFloat(E_GBPage.Text);
          
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
                   VarArrayOf([EdEmpno.Text,
                               StrToFloat(EdSeq.Text),
                               IntToStr(CbGubun.ItemIndex) ]),
                               ///StrToFloat(E_GBPage.Text)  ]),
                               [loCaseInsensitive]) = True then
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

     FM_Main.iSelect := 1;

     ImageFind;

     OraTable1.Close;
     StatusBar1.Panels[1].Text := '저장 완료.';  
end;

procedure TFmImageSave.E_GBPageChange(Sender: TObject);
begin
//  ImageFind;
end;

end.
