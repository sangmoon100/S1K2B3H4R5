program PKY1010A;

uses
  Forms,
  PKY1010A1 in 'PKY1010A1.pas' {FM_Main};
//  Dept1lib in '..\PIA1010B_��������\dept1lib.pas' {DeptForm},
//  Fempno in 'FEMPNO.PAS' {empForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '��������';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
