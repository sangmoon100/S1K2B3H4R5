program PKC6050A;

uses
  Forms,
  PKC60501 in 'PKC60501.pas' {Fpkc40401};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '이체자료 생성/전송';
  Application.CreateForm(TFpkc40401, Fpkc40401);
  Application.Run;
end.
