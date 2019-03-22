program Pic1050c;

uses
  Forms,
  pic10501 in 'pic10501.pas' {MainForm},
  pic10503 in 'pic10503.pas' {PreViewForm},
  pic10505 in 'pic10505.pas',
  pic10502 in 'pic10502.pas' {PrintForm_1};

{$R *.RES}

begin
  Application.Title := '인사발령통보작성(PIC1050C)';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreViewForm, PreViewForm);
  Application.CreateForm(TPrintForm_1, PrintForm_1);
  Application.Run;
end.
