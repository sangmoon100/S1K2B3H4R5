unit forgnum;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons,codeText, DB, DBTables, Gauges, Grids,
  DBGrids, jgrid, ComCtrls,pass, MemDS, DBAccess, Ora;

type
  Tforg = class(TForm)
    Panel2: TPanel;
    Bexit: TBitBtn;
    Panel1: TPanel;
    Brun: TBitBtn;
    Panel5: TPanel;
    Panel4: TPanel;
    Gauge1: TGauge;
    Panel3: TPanel;
    Panel6: TPanel;
    FromDept: TComboBox;
    toDept: TComboBox;
    Qtext: TOraQuery;
    Qorg: TOraQuery;
    procedure BexitClick(Sender: TObject);
    procedure BrunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    start   : integer;
    HomeDir : string;
  public
    { Public declarations }
    filename : string;
  end;

var
  forg: Tforg;

implementation

{$R *.DFM}
procedure Tforg.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tforg.FormPaint(Sender: TObject);
begin
 if start = 0 then begin
    HomeDir := HomeDirOpen;
    Application.ProcessMessages;
    start := 1;
    Qorg.close; Qorg.sql.clear;
    Qorg.sql.add('select orgnum from pycdept group by orgnum');
    Qorg.sql.add('order by orgnum');
    Qorg.open;
    while not Qorg.Eof do begin
        FromDept.Items.Add(Qorg.FieldByName('orgnum').AsString+' 차');
        Qorg.Next;
    end;
    Qorg.close; Qorg.sql.clear;
    Qorg.sql.add('select orgnum from pycdept group by orgnum');
    Qorg.sql.add('order by orgnum desc');
    Qorg.open;
    while not Qorg.Eof do begin
        ToDept.Items.Add(Qorg.FieldByName('orgnum').AsString+' 차');
        Qorg.Next;
    end;
    if Qorg.RecordCount > 0 then begin
       FromDept.Itemindex := 0;
       ToDept.Itemindex := 0;
    end;
    Qorg.close;
 end;
end;

procedure Tforg.BexitClick(Sender: TObject);
begin
   Qorg.close;
   close;
end;

procedure Tforg.BrunClick(Sender: TObject);
var
  str : string;
  cnt : integer;
begin
   if copy(FromDept.Text,1,3) > copy(ToDept.Text,1,3) then begin
      MessageBox(handle,'From이 To 보다 큽니다 !!.','확 인',MB_OK or $0030);
      ModalResult := mrNo;
      system.exit;
   end;
   deptToText(HomeDir+'\'+filename,'',0);
   with QText do begin
      close; sql.clear;
      sql.add('select orgnum,deptcode,deptname,deptna1,deptna2,deptna3 from pycdept ');
      sql.add(Format('where (orgnum >= ''%s'' and orgnum <= ''%s'') ',
              [copy(FromDept.Text,1,3),copy(ToDept.Text,1,3)]));
      sql.add('order by orgnum,deptcode ');
      open; cnt := 1;
      while not eof do begin
         if RecordCount <> cnt then
         Gauge1.Progress := (cnt * 100) div RecordCount else Gauge1.Progress := 100;
         SendMessage(panel1.handle,WM_PAINT,0,0);
         str := '';
         str := FieldByName('orgnum').AsString+','+
                FieldByName('deptcode').AsString+','+
                FieldByName('deptname').AsString+','+
                FieldByName('deptna1').AsString+','+
                FieldByName('deptna2').AsString+','+
                FieldByName('deptna3').AsString;
         deptToText('',str,1);
         next; inc(cnt);
      end;
      QText.close;
   end;
   deptToText('','',2);
   Qorg.close;
   close;
end;

end.
