program Pie1030a;

uses
  Forms,
  E1030a in 'E1030A.PAS' {Fpie2030a};

{$R *.RES}

begin
  Application.Title := '��ȹ�ο� ����';
  Application.CreateForm(TFpie2030a, Fpie2030a);
  Application.Run;
end.
