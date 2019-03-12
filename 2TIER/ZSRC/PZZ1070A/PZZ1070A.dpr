program PZZ1070A;

uses
  Forms,
  PZZ10701 in 'PZZ10701.pas' {Form1},
  PZZ10702 in 'PZZ10702.pas' {Form2},
  PZZ10703 in 'PZZ10703.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
