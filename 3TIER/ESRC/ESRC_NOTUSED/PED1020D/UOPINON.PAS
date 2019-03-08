unit UOpinon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, OnFocusButton,
  OnEditMemo;

type
  TForm1 = class(TForm)
    SF_Opinon: TOnSchemeForm;
    E_OMaintask: TOnEdit;
    BT_Save: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    M_Sayu: TOnMemo;
    M_Opnion: TOnMemo;
    procedure FormShow(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    L_Seqno      : string;
    Lobjsayu     : string;
    Lobjopinion  : string;
    Le1opinionyn : string;
  end;

var
  Form1: TForm1;

implementation

uses HMainForm, Hinsa_TmaxDM, HSubForm;

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
var
  SqlText : string;
begin
  M_Sayu.Lines.Text   := '';
  M_Opnion.Lines.Text :='';

  with FM_Sub.DBSet2 do
  begin
    SQL.Clear;
    SqlText := Format('select a.objsayu ||'';''|| a.objopinion ||'';''|| b.e1opinionyn  '+
                      'from pehreaim_det a, pehremas b     '+
                      'where a.empno=''%s''                  '+
                      '  and a.rabasdate=''%s''              '+
                      '  and a.seqno=''%s''                  '+
                      '  and a.empno=b.empno               '+
                      '  and a.rabasdate=b.rabasdate',[FM_Main.ED_empno.empno,srabasdate,FM_Main.DBSet1.FieldByName('SEQNO').AsString]);


    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open;
    Lobjsayu      := DataModule_Tmax.Csel_gfd(1);
    Lobjopinion   := DataModule_Tmax.Csel_gfd(2);
    Le1opinionyn  := DataModule_Tmax.Csel_gfd(3);
  end;

  with FM_Main.DBSet1 do
  begin
    M_Sayu.SetFocus;
    E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
    E_OMaintask.Enabled:= false;
  end;

  //이의사유 신청
  M_Sayu.Lines.Text := Lobjsayu;
  M_Sayu.Enabled    := false;
  
  //평가사유 또는 근거
  if (Le1opinionyn = 'Y') then
    begin
      M_Opnion.Lines.Text := Lobjopinion;
      M_Opnion.Enabled    := false;
      BT_Save.Enabled     := false;
    end
  else
    begin
      M_Opnion.Enabled    := true;
      M_Opnion.Lines.Text := Lobjopinion;
    end;

  if FM_Main.DBSet1.FieldByName('OBJYN').AsString <> 'Y' then
    begin
      M_Opnion.Enabled := false;
      BT_Save.Enabled  := false;
    end;
end;

procedure TForm1.OnFocusButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TForm1.BT_SaveClick(Sender: TObject);
var
  Sqltext   : string;
  v_Opnion  : string;

begin
  v_Opnion := M_Opnion.Lines.Text;

  with FM_Main.DBSet_dml do
  begin
    SQL.Text := format('update pehreaim_det  set objopinion=''%s''  '+
                       'where rabasdate=''%s'' and empno=''%s'' '+
                       'and seqno=''%s'' ',
                      [v_Opnion,sRabasdate,FM_Main.ED_empno.empno,FM_Main.DBSet1.FieldByName('SEQNO').AsString]);

    Close;
    ServiceName := 'PET1010A_dml';
    ClearFieldInfo;
    Execute;
    MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
  end;
end;

end.
