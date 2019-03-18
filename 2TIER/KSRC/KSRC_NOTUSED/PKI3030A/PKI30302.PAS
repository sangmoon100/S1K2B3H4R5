unit pki30302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, MemDS, DBAccess, Ora;

type
  TS1_KI3030A = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BB_Select: TBitBtn;
    BB_Cancel: TBitBtn;
    Qry1: TOraQuery;
    Qry1DRVKIND: TStringField;
    Qry1PAYCLFR: TStringField;
    Qry1DRVNAME: TStringField;
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BB_SelectClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DrvKind : String;
    PayCl   : String;
    DrvName : String;

    Procedure Open_Grid;
  end;

var
  S1_KI3030A: TS1_KI3030A;

implementation

{$R *.DFM}

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}
Procedure TS1_KI3030A.Open_Grid;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT DRVKIND, PAYCLFR, DRVNAME       ' );
     Qry1.Sql.Add( ' FROM   PKCDRBAS                        ' );
     Qry1.Sql.Add( ' ORDER  BY DRVKIND, PAYCLFR             ' );
     Qry1.Open;

     if Qry1.Eof then
        Qry1.Close;
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }



procedure TS1_KI3030A.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
     if GDSelected in State then
        begin
             if Field.Index = 2 then
                begin
                     DrvKind := Qry1.FieldByName('DrvKind').AsString;
                     PayCl   := Qry1.FieldByName('PayClFr').AsString;
                     DrvName := Qry1.FieldByName('DrvName').AsString;
                end;
        end;
end;

procedure TS1_KI3030A.BB_SelectClick(Sender: TObject);
begin
     Close;
end;

procedure TS1_KI3030A.BB_CancelClick(Sender: TObject);
begin
     DrvKind := '';
     PayCl   := '';
     DrvName := '';
     Close;
end;

procedure TS1_KI3030A.FormActivate(Sender: TObject);
begin
     Open_Grid;
end;

procedure TS1_KI3030A.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Qry1.Close;
end;

procedure TS1_KI3030A.DBGrid1DblClick(Sender: TObject);
begin
     Close;
end;

end.
