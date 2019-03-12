unit UOpinon2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, OnFocusButton,
  OnEditMemo;

type
  TForm2 = class(TForm)
    SF_Opinon: TOnSchemeForm;
    E_OMaintask: TOnEdit;
    BT_Save: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    M_Sayu: TOnMemo;
    M_Opnion: TOnMemo;
    BT_Del: TOnFocusButton;
    procedure FormShow(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_DelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    L_Seqno     : string;
    Lobjsayu    : string;
    Lobjopinion : string;
  end;

var
  Form2: TForm2;

implementation

uses HMainForm2;

{$R *.DFM}

procedure TForm2.FormShow(Sender: TObject);
var
  SqlText : string;
begin
  M_Sayu.Lines.Text   := '';
  M_Opnion.Lines.Text :='';
  L_Seqno   := FM_Main2.DBSet1.FieldByName('SEQNO').AsString;                                           

  SqlText := Format('select objsayu ||'';''|| objopinion '+
                    'from pehreaim_DET                   '+
                    'where empno=''%s''                  '+
                    '  and rabasdate=''%s''              '+
                    '  and seqno=''%s''',[FM_Main2.GSempno,FM_Main2.Lrabasdate,L_Seqno]);


  FM_Main2.Csel_SQL := SqlText;
  FM_Main2.Csel_Open;

  Lobjsayu      := FM_Main2.Csel_gfd(1);
  Lobjopinion   := FM_Main2.Csel_gfd(2);

  with FM_Main2.DBSet1 do
  begin
    M_Sayu.SetFocus;
    E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
    E_OMaintask.Enabled:= false;
  end;

  //평가 Petition
  if (FM_Main2.Lrvalobjyn = 'Y') then
    begin
      M_Sayu.Lines.Text := Lobjsayu;
      M_Sayu.Enabled    := false;
      BT_Save.Enabled    := false;
      BT_Del.Enabled    := false;
    end
  else
    begin
      M_Sayu.Enabled    := true;
      M_Sayu.Lines.Text := Lobjsayu;
    end;

  //평가사유 또는 근거
  M_Opnion.Lines.Text := Lobjopinion;
  M_Opnion.Enabled    := false;
end;

procedure TForm2.OnFocusButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TForm2.BT_SaveClick(Sender: TObject);
var
  Sqltext   : string;
  v_Sayu    : string;
  v_objsayn : string;
begin
  v_Sayu    := M_Sayu.Lines.Text;
  v_objsayn := 'Y';

  Sqltext := format('update pehreaim_det  set objsayu=''%s'', objyn=''%s'' '+
                    'where rabasdate=''%s'' and empno=''%s'' '+
                    'and seqno=''%s'' ',
                    [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.GSempno,L_Seqno]);

  FM_Main2.Cupd_SQL := Sqltext;
  FM_Main2.Cupd_Exec;
  MessageDlg('[평가 Petition]이 저장되었습니다.', mtInformation, [mbOK], 0);
end;

procedure TForm2.BT_DelClick(Sender: TObject);
var
  Sqltext   : string;
  v_Sayu    : string;
  v_objsayn : string;
begin
  M_Sayu.Lines.Text := '';
  v_Sayu    := '';
  v_objsayn := 'N';

  Sqltext := format('update pehreaim_det  set objsayu=''%s'', objyn=''%s'' '+
                    'where rabasdate=''%s'' and empno=''%s'' '+
                    'and seqno=''%s'' ',
                    [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.GSempno,L_Seqno]);

  FM_Main2.Cupd_SQL := Sqltext;
  FM_Main2.Cupd_Exec;
  MessageDlg('[평가 Petition]이 삭제되었습니다.', mtInformation, [mbOK], 0);
end;

end.
