unit pkg10222;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, numedit, ExtCtrls, Buttons, DB, DBTables, Ora, Func;//, UserHelp;

type
  TStandardForm = class(TForm)
    Bevel1: TBevel;
    Bevel6: TBevel;
    Label1: TLabel;
    NEmatecnt: TNumberEdit;
    NEmateamt: TNumberEdit;
    NEchildcnt: TNumberEdit;
    NEchildamt: TNumberEdit;
    NEtogethermm: TNumberEdit;
    NEparentcnt: TNumberEdit;
    NEparentamt: TNumberEdit;
    NEchildmaxage: TNumberEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    BBhelp: TBitBtn;
    BB_Close: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel8: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    NEparentminage: TNumberEdit;
    Label11: TLabel;
    NEparentwomen: TNumberEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Panel5: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel7: TBevel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Bevel9: TBevel;
    Label26: TLabel;
    Bevel10: TBevel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Bevel11: TBevel;
    Label30: TLabel;
    Label31: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Label32: TLabel;
    Label33: TLabel;
    Bevel14: TBevel;
    Panel7: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Bevel15: TBevel;
    Panel8: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Bevel16: TBevel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StandardForm: TStandardForm;

implementation

{$R *.DFM}

procedure TStandardForm.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select matecnt,         ');
               SQL.Add('       mateamt,         ');
               SQL.Add('       parentcnt,       ');
               SQL.Add('       parentamt,       ');
               SQL.Add('       parentminage,    ');
               SQL.Add('       togethermm,      ');
               SQL.Add('       childcnt,        ');
               SQL.Add('       childamt,        ');
               SQL.Add('       childmaxage      ');
               SQL.Add('  from pkcfmbas         ');
               Open;
               NEmatecnt.Value      := FieldByName('MATECNT').AsFloat;
               NEmateamt.Value      := FieldByName('MATEAMT').AsFloat;
               NEparentcnt.Value    := FieldByName('PARENTCNT').AsFloat;
               NEparentamt.Value    := FieldByName('PARENTAMT').AsFloat;
               NEparentminage.Value := FieldByName('PARENTMINAGE').AsFloat;

               if NEparentminage.Value > 0 then NEparentwomen.Value := NEparentminage.Value - 5;

               NEtogethermm.Value   := FieldByName('TOGETHERMM').AsFloat;
               NEchildcnt.Value     := FieldByName('CHILDCNT').AsFloat;
               NEchildamt.Value     := FieldByName('CHILDAMT').AsFloat;
               NEchildmaxage.Value  := FieldByName('CHILDMAXAGE').AsFloat;
          end;
     Finally
          qq.Free;
     end;

end;

end.

