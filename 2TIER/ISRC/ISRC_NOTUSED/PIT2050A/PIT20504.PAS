unit PIT20504;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnSkinBtn, ExtCtrls, OnFocusButton;

type
  TFm_SubForm4 = class(TForm)
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    rb_close_n: TRadioButton;
    rb_close_y: TRadioButton;
    bt_save: TOnSkinButton;
    bt_exit: TOnSkinButton;
    CheckBox2: TCheckBox;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    ed_monum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    Shape2: TShape;
    Label6: TLabel;
    Shape3: TShape;
    Label7: TLabel;
    cbx_monum: TComboBox;
    cbx_deptname: TComboBox;
    Label4: TLabel;
    cbx_deptcode: TComboBox;
    procedure bt_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_SubForm4: TFm_SubForm4;

implementation

uses PIT20500;

{$R *.DFM}

procedure TFm_SubForm4.bt_exitClick(Sender: TObject);
begin
   Close;
end;

procedure TFm_SubForm4.FormShow(Sender: TObject);
begin
   with MainForm.Ory_vari do
   begin
      Close;
      Sql.Clear;
      sql.add(' select value1               ');
      sql.add('   from pimvari              ');
      sql.add('  where gubun = ''00''       ');
      sql.add('    and sgubun = ''0004''    ');
      Open;
//      showmessage(FieldByName('value1').AsString);
      ed_monum.Text := FieldByName('value1').AsString;
   end;
   //
   with MainForm.Ory_monum do
   begin
      Close;
      Sql.Clear;
      sql.add('select distinct monum  monum');
      sql.add('  from pischndept           ');
      Open;
//      showmessage(FieldByName('monum').AsString);
      cbx_monum.Items.Add(FieldByName('monum').AsString);
      cbx_monum.ItemIndex := 0;
   end;

   with MainForm.Ory_deptcode do
   begin
      Close;
      Sql.Clear;
      sql.add('select distinct a.deptcode, b.deptname ');
      sql.add('  from pischndept a, pycdept b         ');
      sql.add(' where a.deptcode = b.deptcode         ');
      sql.add(' and a.orgnum=b.orgnum                 ');
      Open;
//      showmessage(FieldByName('deptname').AsString);
//      cbx_monum.Items.Add(FieldByName('monum').AsString);
      cbx_deptname.Items.Add(FieldByName('deptname').AsString);

   end;


end;

end.
