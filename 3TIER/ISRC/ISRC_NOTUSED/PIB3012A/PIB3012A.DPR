program pib3012a;

uses
  Forms,
  PIB30121 in 'PIB30121.pas' {Fpib3012a},
  PIB3012A_emp in 'PIB3012A_emp.pas' {FM_empno};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '제증명발급신청 - 종합인사';
  Application.CreateForm(TFpib3012a, Fpib3012a);
  Application.Run;
end.
