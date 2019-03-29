program pic7070g;

uses
  Forms,
  pic70701 in 'pic70701.pas' {pic7070gForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '조직개편 인사발령안등록';
  Application.CreateForm(Tpic7070gForm, pic7070gForm);
  Application.Run;
end.
