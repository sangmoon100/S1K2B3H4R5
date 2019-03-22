program PIC4110A;

uses
  Forms,
  PIC4110A1 in 'PIC4110A1.pas' {MainForm},
  PIC4110A2 in 'PIC4110A2.pas' {FM_Print1},
  PIC4110A3 in 'PIC4110A3.pas' {FM_Print2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Leader Pool 대상자 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFM_Print1, FM_Print1);
  Application.CreateForm(TFM_Print2, FM_Print2);
  try
    Application.Run;
  except
  end;  
end.
