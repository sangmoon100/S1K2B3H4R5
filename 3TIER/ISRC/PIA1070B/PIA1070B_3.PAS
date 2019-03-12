unit PIA1070B_3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnLineLabel, ExtCtrls, OnDBGrid, Db, Tmax_DataSetText, Tmax_session, OnInsaCommon,
  StdCtrls, OnFocusButton,func;

type
  TFM_SubForm2 = class(TForm)
    PA_Work1: TPanel;
    Shape6: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Grid1: TOnDBGrid;
    QR_fa: TTMaxDataSet;
    DataSource1: TDataSource;
    Shape3: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    BT_Input: TOnFocusButton;
    procedure BT_InputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    procedure PL_InitForm;
    procedure PL_Select_Data;
  end;

var
  FM_SubForm2: TFM_SubForm2;

implementation

{$R *.DFM}

uses PIA1070B_1, PIA1070B_3_2;

procedure TFM_SubForm2.PL_InitForm;
begin
  QR_fa.Session   := Insa_Session;
end;

procedure TFM_SubForm2.PL_Select_Data;
begin
  with QR_fa do
  begin
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT A.facode     ,                             '+
                   '       A.faname     ,                             '+
                   '       A.fabirthdate,                             '+
                   '       A.faschgr    ,                             '+
                   '       A.fajobcode  ,                             '+
                   '       A.faplace    ,                             '+
                   '       A.fawith     ,                             '+
                   '       A.faallowyn  ,                             '+
                   '       A.famedyn    ,                             '+
                   '       B.codename facodenm   ,                    '+
                   '       C.codename faschgrnm  ,                    '+
                   '       D.codename fajobcodenm                     '+
                   '  FROM pyccode B, pyccode C, pyccode D, pimfami A '+
                   ' WHERE A.empno  = '''+ FM_Main.FG_CurEmpno + '''  '+
                   '   AND B.codeid = ''I211''                        '+
                   '   AND B.codeno = A.facode                        '+
                   '   AND C.codeid(+) = ''I221''                     '+
                   '   AND C.codeno(+) = A.faschgr                    '+
                   '   AND D.codeid(+) = ''I212''                     '+
                   '   AND nvl(A.DELYN,''N'') <> ''Y''                '+
                   '   AND D.codeno(+) = A.fajobcode                  '+
                   ' Order By 1, 3                                    ';
       Open;

       FieldByName('fabirthdate').EditMask := '####/##/##;0;_';
       if   RecordCount <= 0 then Grid1.Visible := False
       else                       Grid1.Visible := True;
  end;
end;

//등록 버튼 클릭시
procedure TFM_SubForm2.BT_InputClick(Sender: TObject);
begin
  //가족관계
  FM_SubForm2_2.ED_family.Session := Insa_Session;
  FM_SubForm2_2.ED_family.Text    := QR_fa.FieldByName('facode').AsString;
  FM_SubForm2_2.ED_family.PL_get_singledata;

  //성명
  FM_SubForm2_2.ED_korname.text := QR_fa.FieldByName('faname').AsString;

  //동거
  FM_SubForm2_2.ED_dongyn.Text := QR_fa.FieldByName('fawith').AsString;

  //학력
  FM_SubForm2_2.ED_faschgr.Session := Insa_Session;
  FM_SubForm2_2.ED_faschgr.Text    := QR_fa.FieldByName('faschgr').AsString;
  FM_SubForm2_2.ED_faschgr.PL_get_singledata;

  //생년월일
  FM_SubForm2_2.ED_bitthday.text := QR_fa.FieldByName('fabirthdate').AsString;

  //직업
  FM_SubForm2_2.ED_job.Session := Insa_Session;
  FM_SubForm2_2.ED_job.Text    := QR_fa.FieldByName('fajobcode').AsString;
  FM_SubForm2_2.ED_job.PL_get_singledata;

  //근무처/직위
  FM_SubForm2_2.ED_paycl.text := QR_fa.FieldByName('faplace').AsString;

  if (FM_Main.FG_pempno = FM_Main.ED_empno.Text) then
    begin
      FM_SubForm2_2.ED_family.Enabled  :=False;
      FM_SubForm2_2.ED_korname.Enabled :=False;
      FM_SubForm2_2.ED_bitthday.Enabled:=False;
      FM_SubForm2_2.BT_Add.Enabled     :=False;
      FM_SubForm2_2.BT_del.Enabled     :=False;
    end;

  if ((FM_Main.FG_pempno = FM_Main.ED_empno.Text) and (copy(FM_Main.FG_Grade,2,1) <= 'B')) then
   begin
      FM_SubForm2_2.ED_family.Enabled:=true;
      FM_SubForm2_2.ED_korname.Enabled:=true;
      FM_SubForm2_2.ED_bitthday.Enabled:=true;
      FM_SubForm2_2.BT_Add.Enabled:=true;
      FM_SubForm2_2.BT_del.Enabled:=true;

      FM_SubForm2.BT_Input.Enabled:=True;
    end;

  //2015.01.08.hjku. 초기화 누락부분 추가..
  FM_SubForm2_2.PA_Buttons.Caption := ' ';
  FM_SubForm2_2.Initialize_Fields('U');
      
  FM_SubForm2_2.showmodal;
  PL_Select_Data;
end;

procedure TFM_SubForm2.FormCreate(Sender: TObject);
begin
  {if ((FM_Main.FG_pempno = FM_Main.ED_empno.Text) or (copy(FM_Main.FG_Grade,2,1) <= 'B')) then
    BT_Input.Enabled:=True
  else
    BT_Input.Enabled:=False;}
end;

end.
