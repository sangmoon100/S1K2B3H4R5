unit pic70304;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TSubForm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    frdeptcode: TEdit;
    todeptcode: TEdit;
    Label1: TLabel;
    OrdBy1: TRadioButton;
    OrdBy2: TRadioButton;
    Bcon: TButton;
    Bcan: TButton;
    Bdeptfr: TSpeedButton;
    Bdeptto: TSpeedButton;
    procedure CheckClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BconClick(Sender: TObject);
    procedure BcanClick(Sender: TObject);
    procedure BDeptClick(Sender: TObject);
  private
    { Private declarations }
    Start : Boolean;
  public
    { Public declarations }
    Gubun   : integer;
    Conyn   : Boolean;
    bOrgnum : string;
  end;

var
  SubForm: TSubForm;

implementation

uses pic70303, pic70301;

{$R *.DFM}

// 정렬순서를 선택한다..............................................................................
procedure TSubForm.CheckClick(Sender: TObject);
begin
  TRadioButton(Sender).Checked := True;
  Gubun := TRadioButton(Sender).Tag;
end;

procedure TSubForm.FormCreate(Sender: TObject);
begin
   Start := True;
end;

procedure TSubForm.FormPaint(Sender: TObject);
begin
   if Start = True then begin
      Start := False;
      if Conyn = False then begin
         frdeptcode.ReadOnly   := True;
         todeptcode.ReadOnly   := True;
         bdeptfr.Enabled       := False;
         bdeptto.Enabled       := False;
      end else begin
         frdeptcode.ReadOnly   := False;
         todeptcode.ReadOnly   := False;
         bdeptfr.Enabled       := True;
         bdeptto.Enabled       := True;
      end;
      CheckClick(OrdBy1);
   end;
end;

// 확인 버턴을 누를경우.............................................................................
procedure TSubForm.BconClick(Sender: TObject);
begin
   MainForm.PrnOrderby := Gubun;
   MainForm.frdeptcode := frdeptcode.Text;
   MainForm.todeptcode := todeptcode.text;
   MainForm.Prnyn      := True;
   close;
end;

// 취소 버턴을 누를경우.............................................................................
procedure TSubForm.BcanClick(Sender: TObject);
begin
   MainForm.Prnyn := False;
   close;
end;

// 부서폼을 호출한다................................................................................
procedure TSubForm.BDeptClick(Sender: TObject);
begin
  BonForm := TBonForm.Create(Self);
  Try
    BonForm.deptcode := '';
    BonForm.deptname := '';
    BonForm.boncode  := '';
    BonForm.bonGubun := '';
    BonForm.orgnum   := bOrgnum;
    BonForm.bonGubun := 'No';
    BonForm.ShowModal;
    if BonForm.deptcode <> '' then  begin
       if Tcomponent(Sender).Tag = 1 then begin
          frdeptcode.Text := BonForm.deptcode;
          frDeptcode.SetFocus;
       end;
       if Tcomponent(Sender).Tag = 2 then begin
          todeptcode.Text := BonForm.deptcode;
          toDeptcode.SetFocus;
       end;
    end;
  Finally
    BonForm.Free;
  End;
end;

end.
