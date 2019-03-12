{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사원조회폼
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(상조회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
-------------------------------------------------------------------------------}
unit Iempnod3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBClient,
  MemDS, DBAccess, Ora, Func;

type
  TFIempnod3 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    RBno: TRadioButton;
    RBname: TRadioButton;
    OraQuery1: TOraQuery;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBchkoutClick(Sender: TObject);
    procedure RBnoClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    //Recrive
    GSorgnumR : String;
    GSdeptcodeR : String;
    GIcloseS : Integer;
    GSempnoS : String;
    GSkornameS : String;
    GSorgnumS : String;
    GSdeptcodeS : String;
    GSboncode : String;
  end;

var
  FIempnod3: TFIempnod3;

implementation

{$R *.DFM}

//------------------------------ User Procedure --------------------------------
procedure TFIempnod3.Retrieve;
var Parameter : OleVariant;
begin
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       if GSboncode = '' then
       begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT EMPNO, KORNAME ');
            Sql.Add('FROM PSCMAN           ');

            if      GSempnoS = ''  then  Parameter := Parameter
            else if not(GSempnoS[2] in ['0'..'9']) then Sql.Add('WHERE (KORNAME LIKE '''+GSempnoS+'%'') ')
            else                                        Sql.Add('WHERE (EMPNO LIKE '''+GSempnoS+'%'')   ');

            if   RBno.Checked then Sql.Add(' ORDER BY EMPNO, KORNAME ')
            else                   Sql.Add(' ORDER BY KORNAME, EMPNO ');
            Open;
            Exit;
       end;

       if GSboncode <> '' then
       begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT EMPNO, KORNAME ');
         Sql.Add('FROM PSCMAN           ');
         if      GSempnoS = '' then  Sql.Add('WHERE ')
         else if not(GSempnoS[2] in ['0'..'9']) then Sql.Add('WHERE (KORNAME LIKE '''+GSempnoS+'%'')  AND  ')
         else                                        Sql.Add('WHERE (EMPNO   LIKE '''+GSempnoS+'%'')  AND  ');

         Sql.Add('  ( EMPNO IN ( SELECT A.EMPNO FROM PKMPMAS A                ');
         Sql.Add('                WHERE A.BONCODE LIKE '''+GSboncode+'%'' ))  ');

         If   RBno.Checked then Sql.Add('  ORDER BY EMPNO, KORNAME ')
         else                   Sql.Add('  ORDER BY KORNAME, EMPNO ');

         Open;
       end;
  end;
end;

//-------------------------------- MAIN ----------------------------------------
procedure TFIempnod3.FormActivate(Sender: TObject);
begin
     GIcloseS := 0;
     Retrieve;
end;

procedure TFIempnod3.BBrunClick(Sender: TObject);
begin
     GSempnoS := Trim(Eempno.Text);
     Retrieve;
end;

procedure TFIempnod3.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TFIempnod3.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS   := OraQuery1.FieldByName('EMPNO').AsString;
     GSkornameS := OraQuery1.FieldByName('KORNAME').AsString;
     GIcloseS   := 0;
     Close;
end;

procedure TFIempnod3.BBchkoutClick(Sender: TObject);
begin
     DBGrid1DblClick(FIempnod3);
end;

procedure TFIempnod3.RBnoClick(Sender: TObject);
begin
     Retrieve;
     Eempno.SetFocus;
end;

procedure TFIempnod3.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          GSempnoS := Trim(Eempno.Text);
          Retrieve;
     end;
end;

procedure TFIempnod3.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          DBGrid1DblClick(FIempnod3);
     end;
end;

end.
