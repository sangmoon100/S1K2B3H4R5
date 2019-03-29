program Pie2080c;

uses
  Forms,
  E2080c in 'E2080C.PAS' {Fpie2080c},
  pie20807 in 'pie20807.pas' {Fpie20807},
  Pie20802 in 'PIE20802.PAS' {Fpie20802},
  pie20806 in 'pie20806.pas' {Fpie20806},
  pie20809 in 'pie20809.pas' {Fpie20809},
  pie20808 in 'pie20808.pas' {Fpie20808},
  Pie20801 in 'Pie20801.pas' {Fpie20801},
  Pie20803 in 'Pie20803.pas' {Fpie20803},
  Pie20804 in 'Pie20804.pas' {Fpie20804},
  Pie20805 in 'Pie20805.pas' {Fpie20805},
  pie208010 in 'pie208010.pas' {Fpie208010},
  pie208011 in 'pie208011.pas' {Fpie208011},
  pie208012 in 'pie208012.pas' {Fpie208012},
  pie208013 in 'pie208013.pas' {Fpie208013};

{$R *.RES}

begin
  Application.Title := 'ÅðÁ÷ÇöÈ²';
  Application.CreateForm(TFpie2080c, Fpie2080c);
  Application.CreateForm(TFpie20807, Fpie20807);
  Application.CreateForm(TFpie20802, Fpie20802);
  Application.CreateForm(TFpie20806, Fpie20806);
  Application.CreateForm(TFpie20809, Fpie20809);
  Application.CreateForm(TFpie20808, Fpie20808);
  Application.CreateForm(TFpie20801, Fpie20801);
  Application.CreateForm(TFpie20803, Fpie20803);
  Application.CreateForm(TFpie20804, Fpie20804);
  Application.CreateForm(TFpie20805, Fpie20805);
  Application.CreateForm(TFpie208010, Fpie208010);
  Application.CreateForm(TFpie208011, Fpie208011);
  Application.CreateForm(TFpie208012, Fpie208012);
  Application.CreateForm(TFpie208013, Fpie208013);
  Application.Run;
end.
