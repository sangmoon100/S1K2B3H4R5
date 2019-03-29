unit PIU20202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditMemo, ComCtrls, StdCtrls, OnFocusButton, OnEditCombo,
  OnShapeLabel, OnInsaCommon,  Db, MemDS, DBAccess, Ora, Func;

type
  TSubForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Shape2: TShape;
    Label1: TLabel;
    L_paycl: TOnShapeLabel;
    L_payra: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    Shape3: TShape;
    Label2: TLabel;
    Shape6: TShape;
    Label3: TLabel;
    SB_Help: TStatusBar;
    M_long: TOnMemo;
    Shape1: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    Shape7: TShape;
    Label6: TLabel;
    L_conyn: TOnShapeLabel;
    L_emp: TOnShapeLabel;
    L_dept1: TOnShapeLabel;
    L_dept2: TOnShapeLabel;
    L_dept3: TOnShapeLabel;
    Bt_desc1: TOnFocusButton;
    Bt_desc2: TOnFocusButton;
    Bt_desc3: TOnFocusButton;
    Bt_close: TOnFocusButton;
    Bt_conY: TOnFocusButton;
    Bt_conN: TOnFocusButton;
    L_move1: TOnShapeLabel;
    L_move2: TOnShapeLabel;
    L_move3: TOnShapeLabel;
    Ora_Save: TOraQuery;
    L_status: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    P_timekind: TPanel;
    Shape4: TShape;
    RB_5: TRadioButton;
    RB_3: TRadioButton;
    RB_2: TRadioButton;
    RB_A: TRadioButton;
    RB_E: TRadioButton;
    RB_T: TRadioButton;
    procedure Bt_closeClick(Sender: TObject);
    procedure Bt_desc1Click(Sender: TObject);
    procedure Bt_conYClick(Sender: TObject);
    procedure Bt_conNClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    GSsayu1     : String;
    GSsayu2     : String;
    GSsayu3     : String;
    GSspedesc1  : String;
    GSspedesc2  : String;
    GSspedesc3  : String;
  end;

var
  SubForm: TSubForm;

implementation

uses PIU20201, PIU20203;

{$R *.DFM}

procedure TSubForm.Bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TSubForm.Bt_desc1Click(Sender: TObject);
begin
  try
    Fm_SubForm11 := TFm_SubForm11.Create(self);

    if TOnFocusButton(Sender).Tag = 1 then
      begin
        Fm_SubForm11.M_appsayu.Text  := GSsayu1;
        Fm_SubForm11.M_Spedesc.Text  := GSspedesc1;
        Fm_SubForm11.GSflag          := 1;
      end
    else if TOnFocusButton(Sender).Tag = 2 then
      begin
        Fm_SubForm11.M_appsayu.Text  := GSsayu2;
        Fm_SubForm11.M_Spedesc.Text  := GSspedesc2;
        Fm_SubForm11.GSflag          := 2;
      end
    else if TOnFocusButton(Sender).Tag = 3 then
      begin
        Fm_SubForm11.M_appsayu.Text  := GSsayu3;
        Fm_SubForm11.M_Spedesc.Text  := GSspedesc3;
        Fm_SubForm11.GSflag          := 3;
      end;

    Fm_SubForm11.Showmodal;

  finally
    Fm_SubForm11.Free;
  end;

end;

procedure TSubForm.Bt_conYClick(Sender: TObject);
begin
  if L_status.ValueCaption <> '신청' then
    begin
      MessageDlg('신청상태가 "신청"이 아닙니다.',mtInformation, [mbOk ],0) ;
      Exit;
    end;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update pidchapp                 ');
      Sql.Add('   set conyn     = ''Y'',       ');
      Sql.Add('       writetime = to_char(sysdate, ''yyyymmddhh24miss''),  ');
      Sql.Add('       writeman  = :writeman    ');
      Sql.Add(' where empno     = :empno       ');
      ParamByName('writeman').AsString := MainForm.GSempno;
      ParamByName('empno').AsString    := Copy(L_emp.ValueCaption,1,4) ;
      ExecSql;
      MessageDlg('"자격인정" 처리 되었습니다',mtInformation, [mbOk ],0) ;
      L_conyn.ValueCaption := 'Y';
    end;
end;

procedure TSubForm.Bt_conNClick(Sender: TObject);
begin
  if L_status.ValueCaption <> '신청' then
    begin
      MessageDlg('신청상태가 "신청"이 아닙니다.',mtInformation, [mbOk ],0) ;
      Exit;
    end;

  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      Sql.Add('update pidchapp                 ');
      Sql.Add('   set conyn     = ''N'',       ');
      Sql.Add('       writetime = to_char(sysdate, ''yyyymmddhh24miss''),  ');
      Sql.Add('       writeman  = :writeman    ');
      Sql.Add(' where empno     = :empno       ');
      ParamByName('writeman').AsString := MainForm.GSempno;
      ParamByName('empno').AsString    := Copy(L_emp.ValueCaption,1,4) ;
      ExecSql;
      MessageDlg('"자격미달" 처리 되었습니다',mtInformation, [mbOk ],0) ;
      L_conyn.ValueCaption := 'N';
    end;

end;

end.
