unit PIB20204;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, ExtCtrls, StdCtrls, Mask, ComCtrls, Buttons,
  DB, DBTables, ImgList, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnFocusButton, OnSkinBtn;

type
  TempsForm = class(TForm)
    progList: TListView;
    LargeIcon: TImageList;
    SmallIcon: TImageList;
    pSearch: TOnButtonEdit;
    Brun: TOnFocusButton;
    Bexit: TOnFocusButton;
    BList1: TOnSkinButton;
    BList2: TOnSkinButton;
    procedure BexitClick(Sender: TObject);
    procedure BrunClick(Sender: TObject);
    procedure BlistClick(Sender: TObject);
    procedure pSearchKeyPress(Sender: TObject; var Key: Char);
    procedure BseaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pSearchButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  empsForm: TempsForm;

implementation
uses PIB20201, PIB20205;
{$R *.DFM}

procedure TempsForm.FormActivate(Sender: TObject);
var
   i : integer;
begin
  for i := 0 to 5 do
    ProgList.Columns.Add;

  ProgList.Columns[0].Caption := '[성 명]';
  ProgList.Columns[0].Width   := 100;
  ProgList.Columns[1].Caption := '[사 번]';
  ProgList.Columns[1].Width   := 60;
  ProgList.Columns[2].Caption := '[BAND ]';
  ProgList.Columns[2].Width   := 0;
  ProgList.Columns[3].Caption := '[부 서 명]';
  ProgList.Columns[3].Width   := 280;
  ProgList.Columns[4].Caption := '[직 책]';
  ProgList.Columns[4].Width   := 80;
  ProgList.Columns[5].Caption := '[부서코드]';
  ProgList.Columns[5].Width   := 80;
end;

procedure TempsForm.BseaClick(Sender: TObject);
var
  pstr : string;
  NewItem : TListItem;
  i    : integer;
begin
  CData.CDept.close;
  CData.RunOrgSql(4,VarArrayof([MainForm.Selym,pSearch.Text+'%',pSearch.Text+'%']));
//  CData.CDept.Open;
  if trim(pSearch.Text) = '' then system.exit;
  if CData.CDept.RecordCount = 0 then
    begin
      progList.Items.Clear;
      CData.CDept.close;
      MessageBox(0,'찾고자하는 사원이 존재하지 않습니다 !.','알 림',MB_OK or $0030);
      system.exit;
    end;
  progList.Items.Clear;
  while not CData.CDept.Eof do
    begin
      NewItem            := ProgList.Items.Add;
      NewItem.ImageIndex := 0;
      NewItem.Caption    := CData.CDept.FieldByName('korname').AsString;
      NewItem.SubItems.Add(CData.CDept.FieldByName('empno').AsString);
      NewItem.SubItems.Add(CData.CDept.FieldByName('payclnm').AsString);
      NewItem.SubItems.Add(CData.CDept.FieldByName('deptname').AsString);
      NewItem.SubItems.Add(CData.CDept.FieldByName('payranm').AsString);
      NewItem.SubItems.Add(CData.CDept.FieldByName('deptcode').AsString);
      SendMessage(ProgList.Handle,WM_PAINT,0,0);
      CData.CDept.Next;
    end;
  CData.CDept.close;
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
  if ProgList.Selected = nil then
    begin
      MessageBox(Handle,'성명을 선택하신 다음 조직열람을 하십시오 !!.','알  림',MB_OK or $0030);
      system.exit;
    end;
   SelItem := ProgList.Selected;
   MainForm.SelDept := SelItem.SubItems[4];
   if trim(MainForm.SelDept) = '' then
     begin
       MessageBox(Handle,'열람할수 없는 조직입니다 !!.','알  림',MB_OK or $0030);
       system.exit;
     end;
  MainForm.CreateMDIChild(CData.PasString(SelItem.SubItems[2],' ', CData.PasCount(SelItem.SubItems[2],' ')));
  progList.Items.Clear;
  Close;
end;

procedure TempsForm.BlistClick(Sender: TObject);
begin
  if TComponent(Sender).Tag = 1 then ProgList.ViewStyle := vsReport;
  if TComponent(Sender).Tag = 2 then ProgList.ViewStyle := vsIcon;

  BList1.BtnDown  := False;
  BList2.BtnDown  := False;

  if Sender is TOnSkinButton then
    begin
      TOnSkinButton(Sender).BtnDown := True;
    end;
end;

procedure TempsForm.pSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
    begin
      Key := chr(0);
      BseaClick(Sender);
    end;
end;

procedure TempsForm.pSearchButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  BseaClick(Sender);
end;

end.
