unit UOpinon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, OnFocusButton, kpaylib,
  OnEditMemo;

type
  TF_Opinon1 = class(TForm)
    SF_Opinon: TOnSchemeForm;
    OnSchemeForm1: TOnSchemeForm;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    L_Seqno     : string;
    Lobjsayu    : string;
    Lobjopinion : string;
    Lobjopinion2: string;
    WorkTab     : Integer;
  end;

var
  F_Opinon1: TF_Opinon1;

implementation

uses HMainForm, UTeamForm;

{$R *.DFM}

procedure TF_Opinon1.FormShow(Sender: TObject);
var
  SqlText, Le1opinionyn, Le2opinionyn : string;
begin
  M_Sayu.Lines.Text   := '';
  M_Opnion.Lines.Text := '';


  if (WorkTab = 0) Then E_OMaintask.EditLabel.Caption := '중점추진업무'
  Else                  E_OMaintask.EditLabel.Caption := '평 가 항 목';

  //평가자 소견 완료 여부
  SqlText := Format('select e1opinionyn  '+
                    '  from PEJNOMAS          '+
                    ' where empno=''%s''      '+
                    '   and rabasdate=''%s''  ',[FM_Main.Ed_empno.empno,FM_Main.Lrabasdate]);

  FM_Main.Csel_SQL := SqlText;
  FM_Main.Csel_Open;
  Le1opinionyn      := FM_Main.Csel_gfd(1);

  if WorkTab = 0 then
  begin
       L_Seqno   := FM_Main.DBSet1.FieldByName('SEQNO').AsString;

       SqlText := Format('select objsayu ||'';''|| objopinion '+
                         '  from PEJNOEMP_DET                 '+
                         ' where empno     =''%s''            '+
                         '   and rabasdate =''%s''            '+
                         '   and seqno     =''%s'''           ,[FM_Main.Ed_empno.empno,FM_Main.Lrabasdate,L_Seqno]);


       FM_Main.Csel_SQL := SqlText;
       FM_Main.Csel_Open;

       Lobjsayu      := FM_Main.Csel_gfd(1);

       if Le1opinionyn = 'Y' then Lobjopinion   := FM_Main.Csel_gfd(2);

       with FM_Main.DBSet1 do
       begin
         M_Sayu.SetFocus;
         E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
         E_OMaintask.ReadOnly := true;
       end;
  end
  else
  begin
       E_OMaintask.Text := TeamForm.vItemname;
       Lobjsayu         := TeamForm.vOBJSAYU;
       if Le1opinionyn = 'Y' then Lobjopinion  := TeamForm.vOBJopinion;
       if Le2opinionyn = 'Y' then Lobjopinion2 := TeamForm.vOBJopinion2;
       M_Sayu.SetFocus;
  end;


  if   FM_Main.OBJSeason <> 'S' then
  begin
       BT_Save.Visible   := False;
       BT_Del.Visible    := False;
       M_Sayu.EditStyle.FocusColor := $00D6EBEB;
       M_Sayu.EditStyle.KillColor  := $00D6EBEB;
       M_Sayu.ReadOnly   := true;
       M_Sayu.Lines.Text := Lobjsayu;
  end
  else
  begin
       //평가 Petition 사유
       if (FM_Main.Lrvalobjyn = 'Y') then
       begin
         M_Sayu.EditStyle.FocusColor := $00D6EBEB;
         M_Sayu.EditStyle.KillColor  := $00D6EBEB;
         M_Sayu.Lines.Text := Lobjsayu;
         M_Sayu.ReadOnly   := true;
         BT_Save.Enabled   := false;
         BT_Del.Enabled    := false;
       end
       else
       begin
         M_Sayu.ReadOnly   := false;
         M_Sayu.Lines.Text := Lobjsayu;
       end;
  end;

  //평가사유 또는 근거
  M_Opnion.Lines.Text  := Lobjopinion;
  M_Opnion.ReadOnly    := true;
end;

procedure TF_Opinon1.OnFocusButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TF_Opinon1.BT_SaveClick(Sender: TObject);
var
  Sqltext   : string;
  v_Sayu    : string;
  v_objsayn : string;
  Param     : OleVariant;
begin
  v_Sayu    := M_Sayu.Lines.Text;
  v_objsayn := 'Y';
  if WorkTab = 0 then
  begin
      Param := VarArrayOf([replace(v_Sayu,'''','`'),
                           v_objsayn,
                           FM_Main.Lrabasdate,
                           FM_Main.Ed_empno.empno,
                           L_Seqno
                          ]);
       Sqltext := format('update PEJNOEMP_DET  set objsayu=''%s'', objyn=''%s'' '+
                         ' where rabasdate = ''%s'' and empno=''%s'' '+
                         '   and seqno     = ''%s'' ',
                         [Param[0],Param[1],Param[2], Param[3],Param[4]]);
       FM_Main.Cupd_SQL := Sqltext;
       FM_Main.Cupd_Exec;
  end
  else
  if WorkTab = 1 then
  begin
      Param := VarArrayOf([replace(v_Sayu,'''','`'),
                           v_objsayn,
                           FM_Main.Lrabasdate,
                           FM_Main.Ed_empno.empno,
                           TeamForm.var_Ekind,
                           TeamForm.vitemno,
                           TeamForm.vImageno
                          ]);

      Sqltext := format('update pesus set objsayu=''%s'', objyn=''%s'' '+
                        ' where rabasdate =''%s'' and empno  =''%s'' '+
                        '   and Ekind     =''%s'' and itemno = %s   and imageno = %s ',
                       [Param[0],Param[1],Param[2], Param[3],Param[4], Param[5],Param[6]]);
      FM_Main.Cupd_SQL := Sqltext;
      FM_Main.Cupd_Exec;
  end;
  MessageDlg('[평가 Petition]이 저장되었습니다.', mtInformation, [mbOK], 0);
end;

procedure TF_Opinon1.BT_DelClick(Sender: TObject);
var
  Sqltext   : string;
  v_Sayu    : string;
  v_objsayn : string;
  Param     : OleVariant;
begin
  M_Sayu.Lines.Text := '';
  v_Sayu    := '';
  v_objsayn := 'N';

  if WorkTab = 0 then
  begin
      Param := VarArrayOf([replace(v_Sayu,'''','`'),
                           v_objsayn,
                           FM_Main.Lrabasdate,
                           FM_Main.Ed_empno.empno,
                           L_Seqno
                          ]);

       Sqltext := format('update PEJNOEMP_DET  set objsayu=''%s'', objyn=''%s'' '+
                         ' where rabasdate =''%s'' and empno=''%s'' '+
                         '   and seqno     =''%s'' ',
                         [Param[0],Param[1],Param[2], Param[3],Param[4]]);
//                         [v_Sayu,v_objsayn,FM_Main.Lrabasdate,FM_Main.Ed_empno.empno,L_Seqno]);

       FM_Main.Cupd_SQL := Sqltext;
       FM_Main.Cupd_Exec;
  end
  else
  if WorkTab = 1 then
  begin
      Param := VarArrayOf([replace(v_Sayu,'''','`'),
                           v_objsayn,
                           FM_Main.Lrabasdate,
                           FM_Main.Ed_empno.empno,
                           TeamForm.var_Ekind,
                           TeamForm.vitemno,
                           TeamForm.vImageno
                          ]);

      Sqltext := format('update pesUs  set objsayu=''%s'', objyn=''%s'' '+
                        ' where rabasdate =''%s'' and empno  =''%s'' '+
                        '   and Ekind     =''%s'' and itemno = %s   and imageno = %s ',
                       [Param[0],Param[1],Param[2], Param[3],Param[4], Param[5],Param[6]]);
      FM_Main.Cupd_SQL := Sqltext;
      FM_Main.Cupd_Exec;
  end;
  MessageDlg('[평가 Petition]이 삭제되었습니다.', mtInformation, [mbOK], 0);
end;

procedure TF_Opinon1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree; //JSH추가
end;

end.
