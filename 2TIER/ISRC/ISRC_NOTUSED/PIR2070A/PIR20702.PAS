unit PIR20702;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditMemo, StdCtrls, OnFocusButton, Db, MemDS, DBAccess, Ora, Mask,
  DBCtrls;

type
  TIntroPopup = class(TForm)
    SF_Main: TOnSchemeForm;
    BtClose: TOnFocusButton;
    OraQuery3: TOraQuery;
    DataSource3: TDataSource;
    OnShapeLabel27: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel10: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel19: TOnShapeLabel;
    OnShapeLabel22: TOnShapeLabel;
    OnShapeLabel26: TOnShapeLabel;
    OnMemo3: TOnMemo;
    OnMemo1: TOnMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    OraQuery3LICENCE1NAME: TStringField;
    OraQuery3LICENCE2NAME: TStringField;
    OraQuery3TOEIC: TStringField;
    OraQuery3ENGSCORE: TStringField;
    OraQuery3ETCLANG: TStringField;
    OraQuery3ETCLANG_POINT: TStringField;
    OraQuery3BOHUN: TStringField;
    OraQuery3OBSYN: TStringField;
    OraQuery3ARMYKIND: TStringField;
    OraQuery3ARMYGRADE: TStringField;
    OraQuery3ARMYEXCEPT: TStringField;
    OraQuery3BADUNIVNAME: TStringField;
    OraQuery3BADUNIVMAJOR: TStringField;
    OraQuery3BODYHEIGHT: TStringField;
    OraQuery3BODYWEIGHT: TStringField;
    OraQuery3BLOODTYPE: TStringField;
    OraQuery3INTEREST: TStringField;
    OraQuery3STRENGTH: TStringField;
    OraQuery3SELFINFO: TMemoField;
    Bt_Save: TOnFocusButton;
    OraQuery4: TOraQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    MemoField1: TMemoField;
    procedure BtCloseClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Rid : String;
    Pgrade : String;
  end;

  const rabasdate='20080501';
  
var
  IntroPopup: TIntroPopup;

implementation

uses PIR20701;

{$R *.DFM}

procedure TIntroPopup.BtCloseClick(Sender: TObject);
begin
     Close;
end;

procedure TIntroPopup.FormPaint(Sender: TObject);
begin
     With OraQuery3 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT a.licence1name, a.licence2name, ''TOEIC'' toeic, engscore, etclang, etclang_point,             ');
          SQL.Add('        DECODE(bohun,''1'',''Y'',''N'') bohun, obsyn,                                                 ');
	  SQL.Add('        (SELECT codename FROM pyccode WHERE codeid=''I031'' AND codeno=a.armykind) armykind,          ');
	  SQL.Add('        (SELECT codename FROM pyccode WHERE codeid=''I034'' AND codeno=a.armygrade) armygrade,        ');
	  SQL.Add('        (SELECT codename FROM pyccode WHERE codeid=''I037'' AND codeno=a.armyexcept) armyexcept,      ');
	  SQL.Add('        badunivname,                                                                                  ');
	  SQL.Add('        (SELECT codename FROM pyccode WHERE codeid=''I225'' AND codeno=a.badunivmajor) badunivmajor,  ');
	  SQL.Add('        (bodyheight || ''cm'') bodyheight, (bodyweight || ''kg'') bodyweight,                         ');
          SQL.Add('        (bloodtype ||''형'') bloodtype, interest, strength, selfinfo                                  ');
          SQL.Add('   FROM prectmas a                                                                                    ');
          SQL.Add('  WHERE rabasdate = :v_rabasdate                                                                      ');
          SQL.Add('    AND rid       = :v_rid                                                                            ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_rid'      ).AsString := Rid;

          Open;
     end;

     if (Copy(Pgrade,2,1) = 'A') or (Copy(Pgrade,2,1) = 'B') then
     begin
          Bt_Save.Visible := True;
          DBMemo1.ReadOnly := False;
          DBMemo2.ReadOnly := False;
     end
     else begin
         Bt_Save.Visible := False;
         DBMemo1.ReadOnly := True;
         DBMemo2.ReadOnly := True;
     end;
end;

procedure TIntroPopup.Bt_SaveClick(Sender: TObject);
begin
     With OraQuery4 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' UPDATE prectmas                  ');
          SQL.Add('    SET strength  = :v_strength,  ');
          SQL.Add('        selfinfo  = :v_selfinfo   ');
          SQL.Add('  WHERE rabasdate = :v_rabasdate  ');
          SQL.Add('    AND rid       = :v_rid        ');

          ParamByName('v_rabasdate').AsString := rabasdate;
          ParamByName('v_rid'      ).AsString := Rid;
          ParamByName('v_strength' ).AsString := DBMemo1.Text;
          ParamByName('v_selfinfo' ).AsString := DBMemo2.Text;

          Execute;
     end;

     MessageBox(Self.Handle,'저장 되었습니다.','종합인사',MB_OK+MB_ICONINFORMATION);
     OraQuery3.Refresh;
end;

end.
