program PKG4010G;

uses
  Forms,
  PKG40101 in 'PKG40101.pas' {fpkG4010};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '근태 미등록/미결재 조회';
  Application.CreateForm(TfpkG4010, fpkG4010);
  Application.Run;
end.
