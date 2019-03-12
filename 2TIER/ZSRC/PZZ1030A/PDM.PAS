unit PDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemDS, DBAccess, Ora;

type
  TDM = class(TDataModule)
    ds_Mas: TDataSource;
    ds_Det: TDataSource;
    DataSource1: TDataSource;
    qry_Mas: TOraQuery;
    qry_Det: TOraQuery;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    OraQuery3: TOraQuery;
    Ora_Session: TOraSession;
    procedure ds_MasDataChange(Sender: TObject; Field: TField);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses PZZ1030A1;

{$R *.DFM}

procedure TDM.ds_MasDataChange(Sender: TObject; Field: TField);
begin
  if qry_Mas.Active then
  begin
       with qry_Det do
       begin
            Close;
            SQL.Clear;
            SQL.Add('Select empno 사번, korname 성명, annono 발령번호,                              ');
            SQL.Add('       anfrdate "발령일(Fr)",  antodate "발령일(To)",                          ');
            SQL.Add('      (Select Empno||korname From Pimpmas Where Empno=A.writeemp) "작업자",    ');
            SQL.Add('       Substr(Anupdtime,1,8)||''-''||Substr(Anupdtime,9,6) "경신일시"          ');
            SQL.Add('  From pihanno A                                                               ');
            SQL.Add(' Where Substr(Anupdtime,1,8) between '''+ FM_InsaMan.E_Date1.NoFormatDate +''' ');
            SQL.Add('                                 And '''+ FM_InsaMan.E_Date2.NoFormatDate +''' ');
            SQL.Add('   And ancode = '''+ Copy(qry_Mas.FieldByName('발령코드').AsString,1,3) +'''   ');

            if qry_Mas.FieldByName('발령세부코드').AsString <> '---' then
            SQL.Add('   And andetcode='''+Copy(qry_Mas.FieldByName('발령세부코드').AsString,1,2)+'''');
            
            SQL.Add('   And anupdyn in (''Y'', ''y'')                                               ');
            SQL.Add(' Order by 1                                                                    ');
            Open;
       end;
       FM_InsaMan.dbg_Det.Columns[0].Width := 35;
       FM_InsaMan.dbg_Det.Columns[1].Width := 50;
       FM_InsaMan.dbg_Det.Columns[2].Width := 65;
       FM_InsaMan.dbg_Det.Columns[5].Width := 70;
       FM_InsaMan.dbg_Det.Columns[6].Width := 99;
  end
  else System.Exit;
end;




end.
