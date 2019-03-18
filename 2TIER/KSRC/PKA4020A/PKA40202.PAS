unit pka40202;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Mask, Ora;

type
  TFpka40202 = class(TForm)
    Ptotdays: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Pdudays: TPanel;
    Psundays: TPanel;
    Prohudays: TPanel;
    Pcohudays: TPanel;
    Petchudays: TPanel;
    Phutot: TPanel;
    Pweekcnt: TPanel;
    BBclose: TBitBtn;
    BBrun: TBitBtn;
    MEyymm: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    Procedure Retrieve;
    procedure MEyymmKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpka40202: TFpka40202;

implementation

uses pka40201, Func;

{$R *.DFM}

procedure TFpka40202.Retrieve;
var
     qq : TOraQuery;
begin

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               Sql.Clear;
               Sql.Add('select *             '+#13
                      +'  from pkmduday      '+#13
                      +' where yymm = :yymm  ');
               ParamByName('yymm').AsString := MEyymm.Text;
               Open;

               If RecordCount < 1 then
               begin
                  Fpka40201.Caption  := '자료가존재하지않습니다.';
                  Ptotdays.Caption   := '';
                  Pdudays.Caption    := '';
                  Psundays.Caption   := '';
                  Prohudays.Caption  := '';
                  Pcohudays.Caption  := '';
                  Petchudays.Caption := '';
                  Phutot.Caption     := '';
                  Pweekcnt.Caption   := '';
                  Exit;
               end;

               Ptotdays.Caption   := FormatFloat('0'  , FieldByName('totdays').AsFloat);
               Pdudays.Caption    := FormatFloat('0.0', FieldByName('dudays').AsFloat);
               Psundays.Caption   := FormatFloat('0'  , FieldByName('sundays').AsFloat);
               Prohudays.Caption  := FormatFloat('0.0', FieldByName('rohudays').AsFloat);
               Pcohudays.Caption  := FormatFloat('0.0', FieldByName('cohudays').AsFloat);
               Petchudays.Caption := FormatFloat('0.0', FieldByName('etchudays').AsFloat);
               Phutot.Caption     := FormatFloat('0.0', FieldByName('hutot').AsFloat);
               Pweekcnt.Caption   := FormatFloat('0'  , FieldByName('weekcnt').AsFloat);
          end
     finally
          qq.Free;
     end;
end;

procedure TFpka40202.FormActivate(Sender: TObject);
begin
     Retrieve;
end;

procedure TFpka40202.BBcloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFpka40202.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFpka40202.MEyymmKeyPress(Sender: TObject; var Key: Char);
begin
     If key = #13 then begin
        key := #0;
        Retrieve;
     end;
end;

end.
