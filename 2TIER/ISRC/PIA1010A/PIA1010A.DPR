program PIA1010A;

uses
  Forms,
  PIA1010P in 'PIA1010P.PAS' {pia1010aForm},
  CODELIB in 'CODELIB.PAS' {codeForm},
  DEPT1LIB in 'DEPT1LIB.PAS' {DeptForm},
  FEMPNO in 'FEMPNO.PAS' {empForm},
  PIA10101 in 'PIA10101.PAS' {ZipForm},
  PIA10102 in 'PIA10102.PAS' {PIA10102Form};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '기본인사등록';
  Application.CreateForm(Tpia1010aForm, pia1010aForm);
  Application.CreateForm(TcodeForm, codeForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TempForm, empForm);
  Application.CreateForm(TZipForm, ZipForm);
  Application.CreateForm(TPIA10102Form, PIA10102Form);
  Application.Run;
end.
