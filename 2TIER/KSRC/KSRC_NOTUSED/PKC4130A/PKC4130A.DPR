program PKC4130A;

uses
  Forms,
  PKC41301 in 'PKC41301.pas' {fpkC4130A};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '근태 미등록/미결재 조회';
  Application.CreateForm(TfpkC4130A, fpkC4130A);
  Application.Run;
end.
