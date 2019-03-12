program PZZ1040A;

uses
  Forms,
  PZZ1040A1 in 'PZZ1040A1.pas' {F_DBCheck};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'DB Check';
  Application.CreateForm(TF_DBCheck, F_DBCheck);
  Application.Run;
end.
