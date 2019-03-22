unit empForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, ExtCtrls, StdCtrls, Mask, HanEdit,  ComCtrls, Buttons,
  DB, DBTables,Datelib, jeonPan, ImgList, MemDS, DBAccess, Ora;

type
  TempsForm = class(TForm)
    JeonPanel1: TJeonPanel;
    Bevel2: TBevel;
    Brun: JeonShape;
    Bexit: JeonShape;
    progList: TListView;
    BList1: TSpeedButton;
    BList2: TSpeedButton;
    LargeIcon: TImageList;
    SmallIcon: TImageList;
    pSearch: THanEdit;
    Bsea: TSpeedButton;
    OraQuery1: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BrunClick(Sender: TObject);
    procedure BlistClick(Sender: TObject);
    procedure pSearchKeyPress(Sender: TObject; var Key: Char);
    procedure BseaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  empsForm: TempsForm;

implementation
uses orgmain;
{$R *.DFM}

procedure TempsForm.FormActivate(Sender: TObject);
var
   i : integer;
begin
   for i := 0 to 4 do ProgList.Columns.Add;
   ProgList.Columns[0].Caption := '성 명';
   ProgList.Columns[0].Width   := 110;
   ProgList.Columns[1].Caption := '사 번';
   ProgList.Columns[1].Width   := 50;
//   ProgList.Columns[2].Caption := 'BAND';
//   ProgList.Columns[2].Width   := 50;
   ProgList.Columns[2].Caption := '부 서 명';
   ProgList.Columns[2].Width   := 335;
   ProgList.Columns[3].Caption := '직 책';
   ProgList.Columns[3].Width   := 80;
   ProgList.Columns[4].Caption := '부서코드';
   ProgList.Columns[4].Width   := 70;

   progList.Cursor := crHand1;
   brun.Cursor     := crHand1;
   bsea.Cursor     := crHand1;
   bexit.Cursor    := crHand1;
   BlistClick(Sender);
end;

procedure TempsForm.BexitClick(Sender: TObject);
begin
   progList.Items.Clear;
   close;
end;

procedure TempsForm.BrunClick(Sender: TObject);
var
  SelItem : TListItem;
begin
   // 프로그램을 검색하여서 있으면 액티브 없으면 실행한다.
   if ProgList.Selected = nil then begin
      MessageBox(Handle,'성명을 선택하신 다음 조직열람을 하십시오 !!.','알  림',MB_OK or $0030);
      system.exit;
   end;
   SelItem := ProgList.Selected;
   MainForm.SelDept := SelItem.SubItems.Strings[3];
   if trim(MainForm.SelDept) = '' then begin
      MessageBox(Handle,'열람할수 없는 조직입니다 !!.','알  림',MB_OK or $0030);
      system.exit;
   end;
   MainForm.CreateMDIChild(PasString(SelItem.SubItems[2],' ',PasCount(SelItem.SubItems[2],' ')));
   progList.Items.Clear;
   Close;
end;

procedure TempsForm.BlistClick(Sender: TObject);
begin
   if TComponent(Sender).Tag = 1 then ProgList.ViewStyle := vsReport;
   if TComponent(Sender).Tag = 2 then ProgList.ViewStyle := vsIcon;
end;

procedure TempsForm.pSearchKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = chr(13) then begin
      Key := chr(0);
      BseaClick(Sender);
   end;
end;


procedure TempsForm.BseaClick(Sender: TObject);
var
  pstr : string;
  NewItem : TListItem;
  i    : integer;
begin
  OraQuery1.sql.clear;
  OraQuery1.close;
  if trim(pSearch.Text) = '' then system.exit;
  OraQuery1.sql.add(Format('select empno,korname,payclnm,payranm,deptcode,deptname '+
                     'from pihorga where (gubun = ''1''     and orgym = ''%s'') '+
                     '               and (empno like ''%s'' or  korname like ''%s'') '+
                     'order by empno,paycl,korname ',
                     [MainForm.Selym,pSearch.Text+'%',pSearch.Text+'%']) );
  OraQuery1.Open;
  if OraQuery1.RecordCount = 0 then begin
     progList.Items.Clear;
     OraQuery1.close;
     MessageBox(0,'찾고자하는 사원이 존재하지 않습니다 !.','알 림',MB_OK or $0030);
     system.exit;
  end;
  progList.Items.Clear;
  while not OraQuery1.Eof do begin
    NewItem            := ProgList.Items.Add;
    NewItem.ImageIndex := 0;
    NewItem.Caption    := OraQuery1.FieldByName('korname').AsString;
    NewItem.SubItems.Add(OraQuery1.FieldByName('empno').AsString);
//    NewItem.SubItems.Add(OraQuery1.FieldByName('payclnm').AsString);
    NewItem.SubItems.Add(OraQuery1.FieldByName('deptname').AsString);
    NewItem.SubItems.Add(OraQuery1.FieldByName('payranm').AsString);
    NewItem.SubItems.Add(OraQuery1.FieldByName('deptcode').AsString);
    SendMessage(ProgList.Handle,WM_PAINT,0,0);
    OraQuery1.Next;
  end;
  OraQuery1.close;
end;

end.
