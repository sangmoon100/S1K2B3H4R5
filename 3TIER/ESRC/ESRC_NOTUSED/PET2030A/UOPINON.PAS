unit UOpinon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, StdCtrls, OnFocusButton,
  kpaylib,  OnEditMemo;

type
  TForm1 = class(TForm)
    SF_Opinon: TOnSchemeForm;
    E_OMaintask: TOnEdit;
    BT_Save: TOnFocusButton;
    BT_Close: TOnFocusButton;
    M_Sayu: TOnMemo;
    M_Opnion1: TOnMemo;
    procedure FormShow(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
  private
    { Private declarations }
    Le1opinionyn  : String;
  public
    { Public declarations }
    L_Seqno       : string;
    LobjYN        : string;
    Lobjsayu      : string;
    Lwork         : string;
    WorkTab       : Integer;
    OpenForm      : Integer;
  end;

var
  Form1: TForm1;

implementation

uses HMainForm, Hinsa_TmaxDM, HSubForm, UDown_Sub1;

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
var
  SqlText : string;
begin
  M_Sayu.Lines.Text    := '';
  M_Opnion1.Lines.Text := '';

  if WorkTab = 0 then  //업적평가.
  begin
    with FM_Sub.DBSet2 do
    begin
      SQL.Clear;
      SqlText := Format('select a.objsayu ||'';''|| a.objopinion ||'';''|| b.e1opinionyn  '+
                       '  from PEJNOEMP_DET a, PEJNOMAS b '+
                       ' where a.empno     = ''%s''       '+
                       '   and a.rabasdate = ''%s''       '+
                       '   and a.seqno     = ''%s''       '+
                       '   and a.empno     = b.empno      '+
                       '   and a.rabasdate = b.rabasdate  ',[FM_Main.ED_empno.empno,srabasdate,FM_Main.DBSet1.FieldByName('SEQNO').AsString]);

      DataModule_Tmax.Csel_SQL := SqlText;
      DataModule_Tmax.Csel_Open;
      Lobjsayu             := DataModule_Tmax.Csel_gfd(1);
      Le1opinionyn         := DataModule_Tmax.Csel_gfd(3);
      M_Opnion1.Lines.Text := DataModule_Tmax.Csel_gfd(2);
    end;

    with FM_Main.DBSet1 do
    begin
      E_OMaintask.Text := FieldByName('PROPELTASK').AsString;
      LobjYN           := FieldByName('OBJYN').AsString;
      E_OMaintask.readonly:= true;
    end;
  end
  else
  begin
    M_Opnion1.Lines.Text := FDown_Sub1.vOBJopinion1;
    E_OMaintask.Text     := FDown_Sub1.vItemname;
    LobjYN               := FDown_Sub1.vOBJYN;
    Lobjsayu             := FDown_Sub1.vOBJSAYU;
  end;

  //평가 Petition
  M_Sayu.Lines.Text := Lobjsayu;
  M_Sayu.readonly   := true;

  //평가사유 또는 근거
  if  (Le1opinionyn  = 'Y')         then BT_Save.Enabled := false; //업적
  if  (FM_Main.v_e1opinionyn = 'Y') then BT_Save.Enabled := false; //역량
end;

procedure TForm1.BT_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.BT_SaveClick(Sender: TObject);
var
  Sqltext, vGsEkind, vItemno, vImageno   : string;
  Param   : OleVariant;
begin
  if WorkTab = 0 then  //업적평가.
  begin
       with FM_Main.DBSet_dml do
       begin
          Param := VarArrayOf([replace(M_Opnion1.Lines.Text,'''','`'),
                               sRabasdate,
                               FM_Main.ED_empno.empno,
                               FM_Main.DBSet1.FieldByName('SEQNO').AsString
                              ]);

          SQL.Text := format('update PEJNOEMP_DET        '+
                             '   set objopinion = ''%s'' '+
                             ' where rabasdate  = ''%s'' '+
                             '   and empno      = ''%s'' '+
                             '   and seqno      = ''%s'' ',
                             [Param[0], Param[1], Param[2], Param[3]]);

          Close;
          ServiceName := 'PET1010A_dml';
          ClearFieldInfo;
          Execute;
          MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
       end;
  end
  else
  begin
    vGsEkind := FDown_Sub1.gsEkind;
    vItemno  := FDown_Sub1.vitemno;
    vImageno := FDown_Sub1.vImageno;

    with FM_Main.DBSet_dml do
    begin
      Param := VarArrayOf([replace(M_Opnion1.Lines.Text,'''','`'),
                           sRabasdate,
                           FM_Main.ED_empno.empno,
                           vGsEkind,
                           vItemno,
                           vImageno
                          ]);

        SQL.Text := format('update pesUs                 '+
                           '   set objopinion  = ''%s''  '+
                           ' where rabasdate   = ''%s''  '+
                           '   and empno       = ''%s''  '+
                           '   and Ekind       = ''%s''  '+
                           '   and itemno      = %s      '+
                           '   and imageno     = %s      ',
                           [Param[0], Param[1], Param[2], Param[3], Param[4], Param[5]]);

        Close;
        ServiceName := 'PET1010A_dml';
        ClearFieldInfo;
        Execute;
        MessageDlg('[평가소견]이 등록되었습니다.', mtInformation, [mbOK], 0);
    end;
  end;
end;

end.
