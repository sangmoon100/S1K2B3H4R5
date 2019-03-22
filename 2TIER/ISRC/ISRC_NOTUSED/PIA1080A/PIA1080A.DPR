program pia1080a;

uses
  Forms,
  pia10801 in 'pia10801.pas' {pia10801Form},
  pia10804 in 'pia10804.pas' {pia10804Form},
  pia10803 in 'pia10803.pas' {pia10803Form},
  pia10805 in 'pia10805.pas' {UpDeptForm},
  pia10802 in 'pia10802.pas' {pia10802Form};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '실근무부서 지정/해제';
  Application.CreateForm(Tpia10801Form, pia10801Form);
  Application.CreateForm(Tpia10802Form, pia10802Form);
  Application.Run;
end.
