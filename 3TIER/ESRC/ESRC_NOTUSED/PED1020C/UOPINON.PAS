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
    M_Opnion2: TOnMemo;
    procedure FormShow(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    L_Seqno      : string;
    LobjYN       : string;
    Lobjsayu     : string;
    Lobjopinion  : string;
    Lobjopinion2 : string;
    Le1opinionyn : string;
    Le2opinionyn : string;
    Lwork        : string;
    WorkTab      : Integer;
    Openform     : Integer;
  end;

var
  Form1: TForm1;

implementation

uses HMainForm, Hinsa_TmaxDM, HSubForm, HMainForm1;

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
var
  SqlText : string;
begin
  M_Sayu.Lines.Text   := '';
  M_Opnion.Lines.Text :='';

  if WorkTab = 0 then
  begin
       with FM_Sub.DBSet2 do
       begin
         SQL.Clear;
         if  Lwork = '2차' then
         SqlText := Format('select a.objsayu ||'';''|| a.objopinion ||'';''|| b.e1opinionyn  '+
                           'from pehreaim_det a, pehremas b     '+
                           'where a.empno=''%s''                  '+
                           '  and a.rabasdate=''%s''              '+
                           '  and a.seqno=''%s''                  '+
                           '  and a.empno=b.empno               '+
                           '  and a.rabasdate=b.rabasdate',[FM_Main1.var_empno,srabasdate,FM_Main1.TDS_Works.FieldByName('SEQNO').AsString])
         else
         SqlText := Format('select a.objsayu ||'';''|| a.objopinion ||'';''|| b.e1opinionyn  '+
                           'from pehreaim_det a, pehremas b     '+
                           'where a.empno=''%s''                  '+
                           '  and a.rabasdate=''%s''              '+
                           '  and a.seqno=''%s''                  '+
                           '  and a.empno=b.empno               '+
                           '  and a.rabasdate=b.rabasdate',[FM_Main.var_empno,srabasdate,FM_Main.TDS_Works.FieldByName('SEQNO').AsString]);


         DataModule_Tmax.Csel_SQL := SqlText;
         DataModule_Tmax.Csel_Open;
         Lobjsayu      := DataModule_Tmax.Csel_gfd(1);
         Lobjopinion   := DataModule_Tmax.Csel_gfd(2);
       end;

       if  Lwork = '2차' then
       with FM_Main1.TDS_Works do
       begin
         M_Opnion.SetFocus;
         E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
         E_OMaintask.ReadOnly:= true;
       end
       else
       with FM_Main.TDS_Works do
       begin
         M_Opnion.SetFocus;
         E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
         E_OMaintask.ReadOnly:= true;
       end;
  end
  else
  begin
       if  Openform = 0 then
       begin
            E_OMaintask.Text := FM_Main.vItemname;
            LobjYN           := FM_Main.vOBJYN;
            Lobjsayu         := FM_Main.vOBJSAYU;
            Lobjopinion      := FM_Main.vOBJopinion;
            Lobjopinion2     := FM_Main.vOBJopinion2;
       end
       else
       if  Openform = 1 then
       begin
            E_OMaintask.Text := FM_Main1.vItemname;
            LobjYN           := FM_Main1.vOBJYN;
            Lobjsayu         := FM_Main1.vOBJSAYU;
            Lobjopinion      := FM_Main1.vOBJopinion;
            Lobjopinion2     := FM_Main1.vOBJopinion2;
       end;
  end;

  //평가 Petition
  M_Sayu.Lines.Text := Lobjsayu;
  M_Sayu.ReadOnly   := true;

  //평가사유 또는 근거
  if (Lwork = '2차') then
  begin
      if (Le2opinionyn = 'Y')  then
      begin
          M_Opnion.EditStyle.FocusColor  := $00D6EBEB;
          M_Opnion.EditStyle.KillColor   := $00D6EBEB;
          M_Opnion.Lines.Text  := Lobjopinion;
          M_Opnion.ReadOnly    := true;

          M_Opnion2.EditStyle.FocusColor := $00D6EBEB;
          M_Opnion2.EditStyle.KillColor  := $00D6EBEB;
          M_Opnion2.Lines.Text := Lobjopinion2;
          M_Opnion2.ReadOnly   := true;
          BT_Save.Enabled      := false;
      end
      else
      begin
          M_Opnion.EditStyle.FocusColor  := $00D6EBEB;
          M_Opnion.EditStyle.KillColor   := $00D6EBEB;
          M_Opnion.Lines.Text  := Lobjopinion;
          M_Opnion.ReadOnly    := true;

          M_Opnion2.ReadOnly   := false;
          M_Opnion2.Lines.Text := Lobjopinion2;
      end;
  end
  else
  begin
      if (Le1opinionyn = 'Y') then
      begin
         M_Opnion.EditStyle.FocusColor  := $00D6EBEB;
         M_Opnion.EditStyle.KillColor   := $00D6EBEB;
         M_Opnion.Lines.Text  := Lobjopinion;
         M_Opnion.ReadOnly    := true;

         M_Opnion2.EditStyle.FocusColor := $00D6EBEB;
         M_Opnion2.EditStyle.KillColor  := $00D6EBEB;
         M_Opnion2.Lines.Text := Lobjopinion2;
         M_Opnion2.ReadOnly   := true;
         BT_Save.Enabled      := false;
      end
      else
      begin
         M_Opnion.ReadOnly    := false;
         M_Opnion.Lines.Text  := Lobjopinion;

         M_Opnion2.EditStyle.FocusColor := $00D6EBEB;
         M_Opnion2.EditStyle.KillColor  := $00D6EBEB;
         M_Opnion2.Lines.Text := Lobjopinion2;
         M_Opnion2.ReadOnly   := true;
      end;
  end;
  
  if WorkTab = 0 then
  begin
      M_Opnion2.visible    := false;
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
  v_Opnion2  : string;
begin
  v_Opnion := M_Opnion.Lines.Text;
  v_Opnion2:= M_Opnion2.Lines.Text;
  if WorkTab = 0 then
  begin
       with FM_Main.DBSet_dml do
       begin
         SQL.Text := format('update pehreaim_det  set objopinion=''%s''  '+
                            'where rabasdate=''%s'' and empno=''%s'' '+
                            'and seqno=''%s'' ',
                           [v_Opnion,sRabasdate,FM_Main.var_empno,FM_Main.TDS_Works.FieldByName('SEQNO').AsString]);

         Close;
         ServiceName := 'PET1010A_dml';
         ClearFieldInfo;
         Execute;
         MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
       end;
  end
  else
  begin
       if Openform = 1 then
           with FM_Main1.DBSet_dml do
           begin
             SQL.Text := format('update petds set objopinion2=''%s''                        '+
                                ' where rabasdate=''%s'' and empno  =''%s''                 '+
                                '   and Ekind    =''%s'' and itemno = %s   and imageno = %s ',
                               [v_Opnion2,sRabasdate,FM_Main1.var_empno,
                                FM_Main1.var_Ekind, FM_Main1.vitemno, FM_Main1.vImageno ]);
             Close;
             ServiceName := 'PET1010A_dml';
             ClearFieldInfo;
             Execute;
             MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
           end
       else
           with FM_Main.DBSet_dml do
           begin
             SQL.Text := format('update petds set objopinion=''%s''                         '+
                                ' where rabasdate=''%s'' and empno  =''%s''                 '+
                                '   and Ekind    =''%s'' and itemno = %s   and imageno = %s ',
                               [v_Opnion,sRabasdate,FM_Main.var_empno,
                                FM_Main.var_Ekind, FM_Main.vitemno, FM_Main.vImageno ]);
             Close;
             ServiceName := 'PET1010A_dml';
             ClearFieldInfo;
             Execute;
             MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
           end;
  end;
end;

end.
