program PZZ1080A;

uses
  Forms,
  PZZ10802 in 'PZZ10802.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
