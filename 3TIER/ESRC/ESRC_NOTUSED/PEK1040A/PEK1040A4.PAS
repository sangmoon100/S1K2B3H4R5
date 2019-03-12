unit PEK1040A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, FileCtrl, JPEG;

type
  TFileListForm = class(TForm)
    IDL_Filenames: TFileListBox;
    IDL_Directory: TDirectoryListBox;
    IDC_Drive: TDriveComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Bexit: TBitBtn;
    Bsel: TBitBtn;
    Label1: TLabel;
    procedure BexitClick(Sender: TObject);
    procedure IDL_FilenamesClick(Sender: TObject);
    procedure BselClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileListForm: TFileListForm;

implementation
uses PIA1070B_1;
{$R *.DFM}

procedure TFileListForm.BexitClick(Sender: TObject);
begin
  close;
end;

procedure TFileListForm.IDL_FilenamesClick(Sender: TObject);
begin
  IDI_Preview.Picture.LoadFromFile(IDL_Filenames.FileName);
end;

procedure TFileListForm.BselClick(Sender: TObject);
begin
     if  MessageBox(handle,'선택한 사진으로 UpLoad하시겠습니까?','확 인',MB_YESNO or $0020) = ID_NO then
     begin
         system.Exit;
     end;

     if IDL_Filenames.FileName<>'' then
         FM_Main.PicPath.Caption := IDL_Filenames.FileName;

     close;
end;

end.
