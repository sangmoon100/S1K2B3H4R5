program Pic1060g;

uses
  Forms,
  Pic1061g in 'PIC1061G.PAS' {pic1061gForm},
  PIC1062G in 'pic1062g.pas' {subForm};

{$E EXE}

{$R *.RES}
begin
  Application.Title := '인사발령사항 경신';
  Application.Title := '인사발령사항경신(PIC1060G)';
  Application.CreateForm(Tpic1061gForm, pic1061gForm);
  Application.CreateForm(TsubForm, subForm);
  Application.Run;
end.
