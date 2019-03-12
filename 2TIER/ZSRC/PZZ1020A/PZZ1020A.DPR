program PZZ1020A;

uses
  Forms,
  PZZ1020A1 in 'PZZ1020A1.pas' {FM_CodeGen};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Code Generator';
  Application.CreateForm(TFM_CodeGen, FM_CodeGen);
  Application.Run;
end.
