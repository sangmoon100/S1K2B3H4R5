program PZZ1060A;

uses
  Forms,
  PZZ10601 in 'PZZ10601.pas' {InfoSearch2Main},
  PZZ10602 in 'PZZ10602.pas' {UserAuth};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TInfoSearch2Main, InfoSearch2Main);
  Application.CreateForm(TUserAuth, UserAuth);
  Application.Run;
end.
