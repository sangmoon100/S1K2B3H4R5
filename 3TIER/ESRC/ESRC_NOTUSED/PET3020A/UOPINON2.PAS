unit UOpinon2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, OnFocusButton, kpaylib,
  OnEditMemo;

type
  TForm2 = class(TForm)
    SF_Opinon: TOnSchemeForm;
    BT_Save: TOnFocusButton;
    BT_Close: TOnFocusButton;
    E_OMaintask: TOnEdit;
    M_Sayu: TOnMemo;
    M_Opnion1: TOnMemo;
    M_Opnion2: TOnMemo;
    procedure FormShow(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
  private
    { Private declarations }
    Le1opinionyn : String;

  public
    { Public declarations }
    L_Seqno       : string;
    LobjYN        : string;
    Lobjsayu      : string;
    Lobjopinion   : string;
    Lwork         : string;
    WorkTab       : Integer;
  end;

var
  Form2: TForm2;

implementation

uses HMainForm2, Hinsa_TmaxDM, HSubForm, UDown_Sub2, UDown_Sub1;

{$R *.DFM}

procedure TForm2.FormShow(Sender: TObject);
var
  SqlText : string;
begin
  M_Sayu.Lines.Text    := '';
  M_Opnion1.Lines.Text := '';
  M_Opnion2.Lines.Text := '';

  if WorkTab = 0 then   //업적평가..
  begin
       M_Opnion2.Visible := False;
       with FM_Sub.DBSet2 do
       begin
         SQL.Clear;
         SqlText := Format('select a.objsayu ||'';''|| a.objopinion ||'';''|| b.e1opinionyn  '+
                           '  from pehreaim_det a, pehremas b '+
                           ' where a.empno     = ''%s''       '+
                           '   and a.rabasdate = ''%s''       '+
                           '   and a.seqno     = ''%s''       '+
                           '   and a.empno     = b.empno      '+
                           '   and a.rabasdate = b.rabasdate  ',[FM_Main2.ED_empno.empno,srabasdate,FM_Main2.DBSet1.FieldByName('SEQNO').AsString]);

         DataModule_Tmax.Csel_SQL := SqlText;
         DataModule_Tmax.Csel_Open;
         Lobjsayu             := DataModule_Tmax.Csel_gfd(1);
         Le1opinionyn         := DataModule_Tmax.Csel_gfd(3);
         M_Opnion1.Lines.Text := DataModule_Tmax.Csel_gfd(2);
       end;

       with FM_Main2.DBSet1 do
       begin
         if Lwork = '1차' then M_Opnion1.SetFocus;
         E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
         LobjYN           := FieldByName('OBJYN').AsString;
         E_OMaintask.readonly:= true;
       end;
  end
  else //역량..
  begin
       if Lwork = '1차' then
       begin
            M_Opnion1.Lines.Text := FDown_Sub1.vOBJopinion1;
            M_Opnion2.Lines.Text := FDown_Sub1.vOBJopinion2;
            E_OMaintask.Text     := FDown_Sub1.vItemname;
            LobjYN               := FDown_Sub1.vOBJYN;
            Lobjsayu             := FDown_Sub1.vOBJSAYU;
       end
       else if Lwork = '2차' then
       begin
            M_Opnion1.Lines.Text := FDown_Sub2.vOBJopinion1;
            M_Opnion2.Lines.Text := FDown_Sub2.vOBJopinion2;
            E_OMaintask.Text     := FDown_Sub2.vItemname;
            LobjYN               := FDown_Sub2.vOBJYN;
            Lobjsayu             := FDown_Sub2.vOBJSAYU;
       end;
  end;
  //평가 Petition
  M_Sayu.Lines.Text := Lobjsayu;
  M_Sayu.readonly   := true;


  //평가사유 또는 근거
  if  ( (Lwork = '1차') and (Le1opinionyn  = 'Y') ) then  BT_Save.Enabled := false; //업적
  if  ( (Lwork = '1차') and (FM_Main2.v_e1opinionyn = 'Y') ) or ( (Lwork = '2차') and (FM_Main2.v_e2opinionyn = 'Y') )  then
      BT_Save.Enabled := false; //역량
                                                   
  if Lwork = '1차' then M_Opnion2.Enabled := False;
  if Lwork = '2차' then M_Opnion1.Enabled := False;      

  {//평가사유 또는 근거
  M_Opnion.readonly   := false;
  if (Le1opinionyn = 'Y') then
    begin
      M_Opnion1.EditStyle.FocusColor := $00D6EBEB;
      M_Opnion1.EditStyle.KillColor  := $00D6EBEB;
      M_Opnion1.readonly   := true;
      BT_Save.Enabled     := false;
    end;

  if LobjYN <> 'Y' then
    begin
      M_Opnion.EditStyle.FocusColor := $00D6EBEB;
      M_Opnion.EditStyle.KillColor  := $00D6EBEB;
      M_Opnion.readonly:= true;
      BT_Save.Enabled  := false;
    end;}
end;

procedure TForm2.BT_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TForm2.BT_SaveClick(Sender: TObject);
var
  Sqltext, vGsEkind, vItemno, vImageno   : string;
  Param   : OleVariant;
begin
  if WorkTab = 0 then  //업적평가.
  begin
       Param := VarArrayOf([replace(M_Opnion1.Lines.Text,'''','`'),
                            sRabasdate,
                            FM_Main2.ED_empno.empno,
                            FM_Main2.DBSet1.FieldByName('SEQNO').AsString
                           ]);

       with FM_Main2.DBSet_dml do
       begin
         SQL.Text := format('update pehreaim_det        '+
                            '   set objopinion = ''%s'' '+
                            ' where rabasdate  = ''%s'' '+
                            '   and empno      = ''%s'' '+
                            '   and seqno      = ''%s'' ',
                           [Param[0], Param[1], Param[2], Param[3]]);
//                           [M_Opnion1.Lines.Text, sRabasdate,FM_Main2.ED_empno.empno,FM_Main2.DBSet1.FieldByName('SEQNO').AsString]);

         Close;
         ServiceName := 'PET1010A_dml';
         ClearFieldInfo;
         Execute;
         MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
       end;
  end
  else
  begin
       if Lwork = '1차' then
       begin
            vGsEkind := FDown_Sub1.gsEkind;
            vItemno  := FDown_Sub1.vitemno;
            vImageno := FDown_Sub1.vImageno;
       end;
       if Lwork = '2차' then
       begin
            vGsEkind := FDown_Sub2.gsEkind;
            vItemno  := FDown_Sub2.vitemno;
            vImageno := FDown_Sub2.vImageno;
       end;

       with FM_Main2.DBSet_dml do
       begin
            Param := VarArrayOf([replace(M_Opnion1.Lines.Text,'''','`'),
                                 replace(M_Opnion2.Lines.Text,'''','`'),
                                 sRabasdate,
                                 FM_Main2.ED_empno.empno,
                                 vGsEkind,
                                 vItemno,
                                 vImageno
                                ]);

            SQL.Text := format('update pesds                 '+
                               '   set objopinion  = ''%s'', '+
                               '       objopinion2 = ''%s''  '+
                               ' where rabasdate   = ''%s''  '+
                               '   and empno       = ''%s''  '+
                               '   and Ekind       = ''%s''  '+
                               '   and itemno      = %s      '+
                               '   and imageno     = %s      ',
                              [Param[0], Param[1], Param[2], Param[3], Param[4], Param[5], Param[6]]);
//                              [M_Opnion1.Lines.Text, M_Opnion2.Lines.Text, sRabasdate, FM_Main2.Ed_empno.empno,
//                               vGsEkind,  vItemno, vImageno ]);

            Close;
            ServiceName := 'PET1010A_dml';
            ClearFieldInfo;
            Execute;
            MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
       end;  
  end;
end;

end.
