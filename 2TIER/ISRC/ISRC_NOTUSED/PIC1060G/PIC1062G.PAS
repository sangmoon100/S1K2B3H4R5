unit PIC1062G;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, OnScheme;

type
  TsubForm = class(TForm)
    E_Workym: TMaskEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel16: TPanel;
    lastDate: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    B_OK: TBitBtn;
    B_Cancel: TBitBtn;
    Label1: TLabel;
    SF_Main: TOnSchemeForm;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_CancelClick(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
    bFirst : Boolean;
  public
    { Public declarations }
    // in
    s_hisfryymm, s_histoyymm: String;
    // out
    returnOK : Integer;
    returnYM : String;
  end;

var
  subForm: TsubForm;

implementation

{$R *.DFM}

procedure TsubForm.FormCreate(Sender: TObject);
begin
  bFirst := True;
end;

procedure TsubForm.FormPaint(Sender: TObject);
begin
  if bFirst then
  begin
    bFirst := False;

    returnOK := 0;
    lastDate.Caption := ' '+copy(s_histoyymm,1,4) +'년 ' + copy(s_histoyymm,5,2) +'월';
    E_Workym.Text := s_histoyymm;
    E_Workym.SetFocus;
  end;
end;

procedure TsubForm.B_OKClick(Sender: TObject);
begin
  if (E_Workym.Text < s_hisfryymm) or (E_Workym.Text > s_histoyymm) then
  begin
    MessageBox(subForm.handle,'선택한 작업월에는 인사이력자료가 없습니다. - 작업 할 수 없습니다.',
               '확 인',MB_OK or $0010);
    System.Exit;
  end;

  returnOK := 1;
  returnYM := E_Workym.Text;

  Close;
end;

procedure TsubForm.B_CancelClick(Sender: TObject);
begin
  returnOK := 0;
  returnYM := '';

  Close;
end;

end.
