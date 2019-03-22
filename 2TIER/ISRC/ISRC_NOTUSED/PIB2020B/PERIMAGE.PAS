unit perImage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables,iniFiles,JPEG, MemDS, DBAccess,
  Ora;

type
  TPerimageForm = class(TForm)
    Panel1: TPanel;
    BcloseSel: TBitBtn;
    deptname: TPanel;
    scBox: TScrollBox;
    Qper: TOraQuery;
    Qphoto: TOraQuery;
    procedure BcloseSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    start  : Boolean;
    MaxRec : integer;
    function search_person : Boolean;
    procedure create_person;
    procedure locate_person;
    procedure perempClick(Sender : TObject);
    // procedure view_person;
  public
    { Public declarations }
  end;

type
  pimage = record
     perpanel : Tpanel;
     perimage : Timage;
     peremp   : TButton;
     empno    : string[4];
     paycl    : string[2];
     orgnum   : string[3];
     boncode  : string[5];
     extcode  : string[5];
     deptcode : string[5];
     deptlevel: string[1];
     korname  : string[10];
     payclnm  : string[10];
     payranm  : string[20];
  end;

const
  pMax = 500;
var
  PerimageForm: TPerimageForm;
  perRec      : array[1..pMax] of pimage;
  JPEGImage   : TJPEGImage;
implementation
uses orgmain;
{$R *.DFM}
// 사원의 갱인열람을 실행한다..-------------------------------------------------
procedure TPerimageForm.perempClick(Sender: TObject);
var
  str : string;
  iniFile : TiniFile;
begin
  str := perRec[Tbutton(Sender).Tag].empno+','+
         perRec[Tbutton(Sender).Tag].paycl+','+
         perRec[Tbutton(Sender).Tag].boncode+','+
         perRec[Tbutton(Sender).Tag].extcode+','+
         perRec[Tbutton(Sender).Tag].deptcode+','+
         perRec[Tbutton(Sender).Tag].deptlevel+','+
         perRec[Tbutton(Sender).Tag].orgnum;

  iniFile := TiniFile.Create('c:\insa.ini');
  iniFile.WriteString('insa','사원번호',perRec[Tbutton(Sender).Tag].empno);
  iniFile.Destroy;
  if MainForm.empnoCheck(str) = False then
     MessageBox(handle,'당신은 개인열람을 볼권한이 없습니다 !!.','확 인',MB_OK or $0030);
end;
// 종료버턴을 누를경우..--------------------------------------------------------
procedure TPerimageForm.BcloseSelClick(Sender: TObject);
begin
  close;
end;

// 폼에관련된 사항들..----------------------------------------------------------
procedure TPerimageForm.FormCreate(Sender: TObject);
begin
  start := True;
end;

procedure TPerimageForm.FormPaint(Sender: TObject);
begin
  if start = True then begin
     Application.ProcessMessages;
     start := False;
     search_person;
     create_person;
     locate_person;
  end;
end;

// 부서별로 사원을 찾는다.......................................................
function TPerimageForm.search_person : Boolean;
var
  i : integer;
begin
  search_person := True;
  Qper.close;
  Qper.ParamByName('ldeptcode').AsString := MainForm.SelDept;
  Qper.ParamByName('lorgym').AsString    := MainForm.Selym;
  Qper.Open;
  maxRec := Qper.RecordCount;
  if maxRec = 0 then begin search_person := False; Qper.close; system.Exit; end;
  for i := 1 to maxRec do begin
     perRec[i].empno    := Qper.FieldByName('empno').AsString;
     perRec[i].paycl    := Qper.FieldByName('paycl').AsString;
     perRec[i].boncode  := Qper.FieldByName('boncode').AsString;
     perRec[i].extcode  := Qper.FieldByName('extcode').AsString;
     perRec[i].deptcode := Qper.FieldByName('deptcode').AsString;
     perRec[i].orgnum   := Qper.FieldByName('orgnum').AsString;
     perRec[i].deptlevel:= copy(Qper.FieldByName('deptlevel').AsString,1,1);
     perRec[i].korname  := Qper.FieldByName('korname').AsString;
     perRec[i].payclnm  := Qper.FieldByName('payclnm').AsString;
     perRec[i].payranm  := Qper.FieldByName('payranm').AsString;
     Qper.Next;
  end;
  Qper.close;
end;
// 이미지를 알아내어 위치시킨다.------------------------------------------------
procedure TPerimageForm.create_person;
var
  stream  :  TMemoryStream;
  JPEGImage : TjpegImage;
  i : integer;
begin
  for i := 1 to maxRec do begin
      // 이미지 생성
      perRec[i].perpanel := Tpanel.Create(scbox);
      perRec[i].perpanel.width   := 104;
      perRec[i].perpanel.Height  := 135;
      perRec[i].perpanel.bevelinner := bvRaised;
      perRec[i].perpanel.bevelouter := bvRaised;
      perRec[i].perpanel.color   := $00E5E5E5;

      perRec[i].perimage := TImage.Create(perRec[i].perpanel);
      perRec[i].perimage.top     := 5;
      perRec[i].perimage.left    := 5;
      perRec[i].perimage.width   := 94;
      perRec[i].perimage.Height  := 125;
      perRec[i].perimage.cursor  := crHand1;
      perRec[i].perimage.stretch := true;
      perRec[i].perimage.Hint    := ' ☞ '+perRec[i].empno+'/'+perRec[i].korname+'/'+
                                           perRec[i].payclnm+'/'+perRec[i].payranm;
      // 이미지 찾기
      Qphoto.close;
      Qphoto.ParamByName('lempno').AsString := perRec[i].empno;
      Qphoto.Open;

   try
     stream    := TMemoryStream.Create;
     JPEGImage := TJPEGImage.Create;

     perRec[i].perimage.picture.Graphic := nil;

     TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
     stream.Position := 0;

     JPEGImage.LoadFromStream(stream);
     if stream.Size <> 0 then
       perRec[i].perimage.picture.Assign(JPEGImage)
     else begin
      if FileExists(HomeDir+'\pic\사람1.bmp') = True then
         perRec[i].perimage.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
     end;
     Qphoto.Close;
   finally
     stream.free;
     JPEGImage.Free;
   end;

{
      if trim(Qphoto.FieldByName('empno').AsString) <> '' then begin
         perRec[i].perimage.picture.Assign(Qphoto.FieldByName('photo'));
      end else begin
         if FileExists(HomeDir+'\pic\사람1.bmp') = True then
            perRec[i].perimage.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
      end;
 }
      // 버턴 생성
      perRec[i].peremp := TButton.Create(scBox);
      perRec[i].peremp.width   := 104;
      perRec[i].peremp.Height  := 25;
      perRec[i].peremp.Caption := trim(perRec[i].payclnm)+' : '+perRec[i].korname;
      perRec[i].peremp.tag     := i;
      perRec[i].peremp.cursor  := crHand1;
      perRec[i].peremp.Hint    := ' ☞ '+perRec[i].empno+'/'+perRec[i].korname+'/'+
                                         perRec[i].payclnm+'/'+perRec[i].payranm+
                                         ' → 버턴을 클릭하면 개인열람이 실행됩니다 !!';
      perRec[i].peremp.OnClick := perempClick;
  end;
  Qphoto.close;
end;
// 사진의 위치를 파악하여 배치시킨다.-------------------------------------------
procedure TPerimageForm.locate_person;
var
  i,ntop,nleft  : integer;
  ntgap,nlgap   : integer;
  imod,t,l      : integer;
begin
  ntop := 17; nleft := 14; ntgap := 0; nlgap := 0; t := 1; l := 1;
  for i := 1 to maxRec do begin
      perRec[i].perpanel.top  := (ntop+ntgap)+(135*(t-1));
      perRec[i].peremp.top    := (ntop+ntgap+135)+(135*(t-1));
      perRec[i].perpanel.left := (nleft+nlgap)+((l-1)*104);
      perRec[i].peremp.left   := (nleft+nlgap)+((l-1)*104);
      inc(l); nlgap := 18*(l-1);
      imod := (i mod 3);
      if imod = 0 then begin
         inc(t); l := 1; ntgap := 50*(t-1); nlgap := 0;
      end;
  end;
  imod := maxRec mod 3;
  if imod <> 0 then begin
     scBox.VertScrollBar.Range := ((maxRec div 3)*185)+235;
  end else begin
     scBox.VertScrollBar.Range := ((maxRec div 3)*185)+50;
  end;

  for i := 1 to maxRec do begin
      perRec[i].perpanel.parent := scBox;
      perRec[i].perimage.parent := perRec[i].perpanel;
      perRec[i].peremp.parent   := scBox;
  end;
end;

end.
