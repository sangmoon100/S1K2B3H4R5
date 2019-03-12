program PZNewEmpno;

uses
  Forms,
  NewEmpno in 'NewEmpno.pas' {FNewEmp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사번 변경자 조회/등록';
  Application.CreateForm(TFNewEmp, FNewEmp);
  Application.Run;
end.
