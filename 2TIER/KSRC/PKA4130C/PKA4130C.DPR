program PKA4130C;

uses
  Forms,
  pka41301 in 'pka41301.pas' {fpka4130};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '근태 미등록/미결재 조회';
  Application.CreateForm(Tfpka4130, fpka4130);
  Application.Run;
end.
