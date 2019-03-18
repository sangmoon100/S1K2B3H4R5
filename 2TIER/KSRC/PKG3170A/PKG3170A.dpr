program PKG3170A;

uses
  Forms,
  PKG31701 in 'PKG31701.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
