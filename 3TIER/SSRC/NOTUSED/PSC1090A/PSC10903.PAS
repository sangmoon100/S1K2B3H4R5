unit PSC10903;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, FileCtrl, JPEG, OnFocusButton, OnShapeLabel;

type
  TFileListForm = class(TForm)
    IDL_Filenames: TFileListBox;
    IDL_Directory: TDirectoryListBox;
    IDC_Drive: TDriveComboBox;
    Panel5: TPanel;
    IDI_Preview: TImage;
    BB_Close: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    procedure IDL_FilenamesClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileListForm: TFileListForm;

implementation

uses PSC10902;

{$R *.DFM}

procedure TFileListForm.IDL_FilenamesClick(Sender: TObject);
begin
     IDI_Preview.Picture.LoadFromFile(IDL_Filenames.FileName);
end;

procedure TFileListForm.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFileListForm.OnFocusButton1Click(Sender: TObject);
begin
     if IDL_Filenames.FileName <> '' then FmImageSave.FileNm.Text := IDL_Filenames.FileName;

     Close;
end;

end.
