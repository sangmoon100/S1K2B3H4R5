program Pib4100c;

uses
  Forms,
  Pib41001 in 'PIB41001.PAS' {Fpib41001},
  Pib41003 in 'PIB41003.PAS' {Fpib41003},
  Pib41002 in 'Pib41002.pas' {Form1};

{$R *.RES}

begin
  Application.Title := '무보직자 명단';
  Application.CreateForm(TFpib41001, Fpib41001);
  Application.CreateForm(TFpib41003, Fpib41003);
  Application.CreateForm(TFpib41002, Fpib41002);
  Application.Run;
end.
