unit PIB20206;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls,iniFiles,OnGraphicLib,
  OnGrDBGrid, OnFocusButton;

  //사진을 불러오기 위한 부분....
{
const
  EMPNO_ID        =     4;
  IMG_SIZE        =     10;
  IMAGE           =     1;
  // 여기까지....
}
type
  TPersonForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    deptname: TPanel;
    Panel2: TPanel;
    photo: TImage;
    Pnm: TPanel;
    Jdbgrid1: TOnGrDbGrid;
    Panel3: TPanel;
    BcloseSel: TOnFocusButton;
    Bper: TOnFocusButton;
    BT_pic: TOnFocusButton;
    procedure BcloseSelClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BperClick(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure BT_picClick(Sender: TObject);
  private
    { Private declarations }
    start : Boolean;
  public
    { Public declarations }
  end;

  //사진을 불러오기 위한 부분....
{  TImageData = array[0..0] of Char;
  PImageData = ^TImageData;

  TSSMTEM090N_IN = record
    c_headerinfo : array[0..123] of char;
    c_empno_id  : array[0..EMPNO_ID-1] of Char; //홍기영이 추가한 부분이다(4글자)
    c_img_size  : array[0..IMG_SIZE-1] of Char;
  end;

  PSSMTEM090N_IN = ^TSSMTEM090N_IN;

  TSSMTEM090N_OUT = record
    c_headerinfo : array[0..123] of char;
    c_empno_id  : array[0..EMPNO_ID-1] of Char;
    c_img_size  : array[0..IMG_SIZE-1] of Char;
  end;

  PSSMTEM090N_OUT = ^TSSMTEM090N_OUT;
  // 여기까지....
}
var
  PersonForm: TPersonForm;

implementation
uses PIB20201, PIB20205;
{$R *.DFM}

{코드명을 불러온다..}
procedure TPersonForm.FormPaint(Sender: TObject);
begin
if start = True then begin
  Application.ProcessMessages;
  start := False;
  DataSource1.DataSet := CData.CDept;
  Jdbgrid1.visible := True;
  CData.Cdept.Close;
  CData.RunOrgSql(5,VarArrayof([MainForm.SelDept,MainForm.Selym]));
//  CData.Cdept.Open;
  Jdbgrid1.SetFocus;
end;
end;

procedure TPersonForm.FormCreate(Sender: TObject);
begin
  start := True;
end;

procedure TPersonForm.BcloseSelClick(Sender: TObject);
begin
  CData.Cdept.close;
  Close;
end;

procedure TPersonForm.BperClick(Sender: TObject);
var
  str     : string;
  iniFile : TiniFile;
begin
  str := CData.Cdept.FieldByName('empno').AsString+','+
         CData.Cdept.FieldByName('paycl').AsString+','+
         CData.Cdept.FieldByName('boncode').AsString+','+
         CData.Cdept.FieldByName('extcode').AsString+','+
         CData.Cdept.FieldByName('deptcode').AsString+','+
         copy(CData.Cdept.FieldByName('deptlevel').AsString,1,1)+','+
         CData.Cdept.FieldByName('orgnum').AsString;
  iniFile := TiniFile.Create('c:\insa.ini');
  iniFile.WriteString('insa','사원번호',CData.Cdept.FieldByName('empno').AsString);
  iniFile.Destroy;
  if MainForm.empnoCheck(str) = False then
     MessageBox(handle,'당신은 개인열람을 볼권한이 없습니다 !!.','확 인',MB_OK or $0030);
  Jdbgrid1.SetFocus
end;

procedure TPersonForm.Panel2Exit(Sender: TObject);
begin
  Panel2.Visible := False;
end;

procedure TPersonForm.BT_picClick(Sender: TObject);
var
  FL_Image   : TStream;
  GifHeader  : TOnGifHeader;
  JpegHeader : TOnJpegHeader;
begin
  photo.picture.Graphic := nil;

  with CData.Cphoto do
    begin
      ServiceName := 'PIB2020B_pic';
      Close;
      ClearParamInfo;
      AddParam('empno', 4 , CData.Cdept.FieldByName('empno').AsString);

      ClearFieldInfo;
      AddField('EMPNO', ftString,  4);
      AddField('PHOTO', ftBlob,    0);

      Open;

      if CData.Cphoto.RecordCount = 0 then
        begin
          Close;
          System.Exit;
        end;

      try
        FL_Image := nil;
        FL_Image := TDataSet(CData.Cphoto).CreateBlobStream(TBlobField(FieldByName('photo')),bmRead);
        FL_Image.Seek(0,soFromBeginning);
        ReadPicCheck(FL_Image, GifHeader, Sizeof(GifHeader));
        if (UpperCase(GifHeader.Signature) = 'GIF') then
          ReadGifBlob(FL_Image, photo)
        else
          begin
            FL_Image.Seek(0,soFromBeginning);
            ReadPicCheck(FL_Image, JpegHeader, Sizeof(JpegHeader));
            if (JpegHeader.StartImage <> $d8ff) and (JpegHeader.Reserved <> $e0ff) then
              photo.Picture.Assign(TBlobField(FieldByName('photo')))
            else
              ReadJpegBlob(FL_Image, photo);
          end;

        panel1.visible := true;       // 사진 열람
        pnm.visible    := true;
        photo.visible  := true;
        pnm.caption    := CData.Cdept.FieldByName('korname').AsString;
      finally
      end;
    end;
  CData.Cphoto.Close;
  Panel2.Visible := true;
  Panel2.SetFocus;

end;

end.
