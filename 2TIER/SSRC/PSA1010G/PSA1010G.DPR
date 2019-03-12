program PSA1010G;

uses
  Forms,
  Psa10101 in 'Psa10101.pas' {Fpsa10101},
  Psa10102 in 'Psa10102.pas' {Fpsa10102};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 신규사우회원 추출/갱신';
  Application.CreateForm(TFpsa10101, Fpsa10101);
  Application.CreateForm(TFpsa10102, Fpsa10102);
  Application.Run;
end.
