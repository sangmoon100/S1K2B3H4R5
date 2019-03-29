program pid1150c;

uses
  Forms,
  pid1151c in 'pid1151c.pas' {pid1151cForm},
  pid1152c in 'pid1152c.pas' {pid1152cForm},
  pid1153c in 'pid1153c.pas' {pid1153cForm},
  pid1154c in 'pid1154c.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '수습평가표 작성';
  Application.CreateForm(Tpid1151cForm, pid1151cForm);
  Application.CreateForm(Tpid1152cForm, pid1152cForm);
  Application.Run;
end.
