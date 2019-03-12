unit UOpinon2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, OnFocusButton, kpaylib,
  OnEditMemo;

type
  TF_Opinon2 = class(TForm)
    SF_Opinon: TOnSchemeForm;
    E_OMaintask: TOnEdit;
    BT_Save: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    M_Sayu: TOnMemo;
    M_Opnion: TOnMemo;
    BT_Del: TOnFocusButton;
    M_Opnion2: TOnMemo;
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
    Lobjopinion2: string;
    WorkTab     : Integer;
  end;

var
  F_Opinon2: TF_Opinon2;

implementation

uses HMainForm2, UTeamForm2;

{$R *.DFM}

procedure TF_Opinon2.FormShow(Sender: TObject);
var
  SqlText, Le1opinionyn, Le2opinionyn : string;
begin
  M_Sayu.Lines.Text   := '';
  M_Opnion.Lines.Text := '';

  if (WorkTab = 0) Then E_OMaintask.EditLabel.Caption := '중점추진업무'
  Else                  E_OMaintask.EditLabel.Caption := '평 가 항 목';

  //평가자 소견 완료 여부
  SqlText := Format('select e1opinionyn ||'';''|| e2opinionyn '+
                    '  from pehremas          '+
                    ' where empno=''%s''      '+
                    '   and rabasdate=''%s''  ',[FM_Main2.Ed_empno.empno,FM_Main2.Lrabasdate]);

  FM_Main2.Csel_SQL := SqlText;
  FM_Main2.Csel_Open;
  Le1opinionyn      := FM_Main2.Csel_gfd(1);
  Le2opinionyn      := FM_Main2.Csel_gfd(2);

  if WorkTab = 0 then
  begin
       M_Opnion2.Visible := False;
         
       L_Seqno   := FM_Main2.DBSet1.FieldByName('SEQNO').AsString;

       SqlText := Format('select objsayu ||'';''|| objopinion '+
                         'from pehreaim_DET                   '+
                         'where empno=''%s''                  '+
                         '  and rabasdate=''%s''              '+
                         '  and seqno=''%s''',[FM_Main2.GSempno,FM_Main2.Lrabasdate,L_Seqno]);


       FM_Main2.Csel_SQL := SqlText;
       FM_Main2.Csel_Open;

       Lobjsayu      := FM_Main2.Csel_gfd(1);

       if Le1opinionyn = 'Y' then
         Lobjopinion   := FM_Main2.Csel_gfd(2);

       with FM_Main2.DBSet1 do
       begin
         M_Sayu.SetFocus;
         E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
         E_OMaintask.ReadOnly := true;
       end;
  end
  else
  begin
       E_OMaintask.Text := TeamForm2.vItemname;
       Lobjsayu         := TeamForm2.vOBJSAYU;
       if Le1opinionyn = 'Y' then Lobjopinion  := TeamForm2.vOBJopinion;
       if Le2opinionyn = 'Y' then Lobjopinion2 := TeamForm2.vOBJopinion2;
       M_Sayu.SetFocus;
  end;

  if   FM_Main2.OBJSeason <> 'S' then
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
       if (FM_Main2.Lrvalobjyn = 'Y') then
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
  M_Opnion.Lines.Text   := Lobjopinion;
  M_Opnion.ReadOnly     := true;
  M_Opnion2.Lines.Text  := Lobjopinion2;
  M_Opnion2.ReadOnly    := true;  
end;

procedure TF_Opinon2.OnFocusButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TF_Opinon2.BT_SaveClick(Sender: TObject);
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
                           FM_Main2.Lrabasdate,
                           FM_Main2.Ed_empno.empno,
                           L_Seqno
                          ]);

       Sqltext := format('update pehreaim_det  set objsayu=''%s'', objyn=''%s'' '+
                         ' where rabasdate = ''%s'' and empno=''%s'' '+
                         '   and seqno     = ''%s'' ',
                         [Param[0],Param[1],Param[2], Param[3],Param[4]]);
//                         [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.Ed_empno.empno,L_Seqno]);

       FM_Main2.Cupd_SQL := Sqltext;
       FM_Main2.Cupd_Exec;
  end
  else
  if WorkTab = 1 then
  begin
      Param := VarArrayOf([replace(v_Sayu,'''','`'),
                           v_objsayn,
                           FM_Main2.Lrabasdate,
                           FM_Main2.Ed_empno.empno,
                           TeamForm2.var_Ekind,
                           TeamForm2.vitemno,
                           TeamForm2.vImageno
                          ]);

      if TeamForm2.Pevcno <> '3' then
      begin
           Sqltext := format('update pesds  set objsayu=''%s'', objyn=''%s'' '+
                             ' where rabasdate =''%s'' and empno  =''%s'' '+
                             '   and Ekind     =''%s'' and itemno = %s   and imageno = %s ',
                             [Param[0],Param[1],Param[2], Param[3],Param[4], Param[5],Param[6]]);
//                             [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.Ed_empno.empno,
//                              TeamForm2.var_Ekind, TeamForm2.vitemno, TeamForm2.vImageno ]);
      end
      else
      begin
           Sqltext := format('update petds  set objsayu=''%s'', objyn=''%s'' '+
                             ' where rabasdate =''%s'' and empno  =''%s'' '+
                             '   and Ekind     =''%s'' and itemno = %s   and imageno = %s ',
                             [Param[0],Param[1],Param[2], Param[3],Param[4], Param[5],Param[6]]);
//                             [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.Ed_empno.empno,
//                              TeamForm2.var_Ekind, TeamForm2.vitemno, TeamForm2.vImageno ]);
      end;
      FM_Main2.Cupd_SQL := Sqltext;
      FM_Main2.Cupd_Exec;
  end;

  MessageDlg('[평가 Petition]이 저장되었습니다.', mtInformation, [mbOK], 0);
end;

procedure TF_Opinon2.BT_DelClick(Sender: TObject);
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
                           FM_Main2.Lrabasdate,
                           FM_Main2.Ed_empno.empno,
                           L_Seqno
                          ]);

       Sqltext := format('update pehreaim_det  set objsayu=''%s'', objyn=''%s'' '+
                         ' where rabasdate =''%s'' and empno=''%s'' '+
                         '   and seqno     =''%s'' ',
                         [Param[0],Param[1],Param[2], Param[3],Param[4]]);
//                         [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.Ed_empno.empno,L_Seqno]);

       FM_Main2.Cupd_SQL := Sqltext;
       FM_Main2.Cupd_Exec;
  end
  else
  if WorkTab = 1 then
  begin
      Param := VarArrayOf([replace(v_Sayu,'''','`'),
                           v_objsayn,
                           FM_Main2.Lrabasdate,
                           FM_Main2.Ed_empno.empno,
                           TeamForm2.var_Ekind,
                           TeamForm2.vitemno,
                           TeamForm2.vImageno
                          ]);

      if TeamForm2.Pevcno <> '3' then
      begin
           Sqltext := format('update pesds  set objsayu=''%s'', objyn=''%s'' '+
                             ' where rabasdate =''%s'' and empno  =''%s'' '+
                             '   and Ekind     =''%s'' and itemno = %s   and imageno = %s ',
                             [Param[0],Param[1],Param[2], Param[3],Param[4], Param[5],Param[6]]);
//                             [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.Ed_empno.empno,
//                              TeamForm2.var_Ekind, TeamForm2.vitemno, TeamForm2.vImageno ]);
      end
      else
      begin
           Sqltext := format('update petds  set objsayu=''%s'', objyn=''%s'' '+
                             ' where rabasdate =''%s'' and empno  =''%s'' '+
                             '   and Ekind     =''%s'' and itemno = %s   and imageno = %s ',
                             [Param[0],Param[1],Param[2], Param[3],Param[4], Param[5],Param[6]]);
//                             [v_Sayu,v_objsayn,FM_Main2.Lrabasdate,FM_Main2.Ed_empno.empno,
//                              TeamForm2.var_Ekind, TeamForm2.vitemno, TeamForm2.vImageno ]);
      end;

      FM_Main2.Cupd_SQL := Sqltext;
      FM_Main2.Cupd_Exec;
  end;

  MessageDlg('[평가 Petition]이 삭제되었습니다.', mtInformation, [mbOK], 0);
end;

end.
