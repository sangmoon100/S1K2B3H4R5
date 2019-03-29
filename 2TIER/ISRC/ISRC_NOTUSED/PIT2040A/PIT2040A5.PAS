unit PIT2040A5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, pebtnedit, Db, DBCGrids, DBCtrls, PeJeonBtnDateEdit,
  peextcombo, peNumedit, ComCtrls, Tabnotbk, pecodebtnedit, pedbgrid,
  pedeptbtnedit, petxtwzd;

type
  TFm_SubForm3 = class(TForm)
    Panel5: TPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bt_Srh: TPeJeonOutLookBtn;
    Ed_aftdeptcode1: TPeDeptEdit;
    Ed_aftdeptcode2: TPeDeptEdit;
    Ed_befDeptcode1: TPeDeptEdit;
    Ed_befDeptcode2: TPeDeptEdit;
    Cbx_aftreqyn: TPeJeonPanelComboBox;
    Cbx_aftOppyn: TPeJeonPanelComboBox;
    Cbx_befreqyn: TPeJeonPanelComboBox;
    Cbx_befOppyn: TPeJeonPanelComboBox;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel2: TPanel;
    rBtnOrder1: TRadioButton;
    rBtnOrder2: TRadioButton;
    MoniGrid: TPeJeonDbGrid;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Bt_Text: TPeJeonOutLookBtn;
    DataSource1: TDataSource;
    Txt: TPeJeonTxtConvert;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_TextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_SubForm3: TFm_SubForm3;

implementation

uses pit2040a2;

{$R *.DFM}

procedure TFm_SubForm3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_SubForm3.Bt_SrhClick(Sender: TObject);
var
  i : integer;
  Field : TField;
begin
  with DM.Qry_SelectB do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT m.EmpNo 사번 ,m.KorName 성명, c.CodeName BAND,           ');
    SQL.Add('        d.DeptName 소속부서,e.DeptName 지원부서,                 ');
    SQL.Add('        decode(m.aftReqDate,null,''N'',''Y'') "1차의뢰",         ');
    SQL.Add('        m.aftConYn                            "1차의견",         ');
    SQL.Add('        decode(m.befReqDate,null,''N'',''Y'') "2차의뢰",         ');
    SQL.Add('        m.befConYn                            "2차의견",         ');

    SQL.Add('        m.AppDate 지원일, m.Orgnum 소속조직차수, f.CodeName 직위,');
    SQL.Add('        m.aftorgnum 지원조직차수,m.aftreqdate 지원부서의뢰일,    ');
    SQL.Add('        m.aftcondate 지원부서결재일, m.befreqdate 소속부서의뢰일,');
    SQL.Add('        m.befcondate 소속부서결재일,                             ');
    SQL.Add('        DECODE(m.State,''1'',''등록중'',                         ');
    SQL.Add('         DECODE(m.State,''2'',''대기중'',                        ');
    SQL.Add('          DECODE(m.State,''3'',''지원부서검토중'',               ');
    SQL.Add('           DECODE(m.State,''4'',''지원부서결재완료'',            ');
    SQL.Add('            DECODE(m.State,''5'',''소속부서검토중'',             ');
    SQL.Add('             DECODE(m.State,''6'',''소속부서결재완료'',          ');
    SQL.Add('              DECODE(m.State,''7'',''처리완료'',''''))))))) 상태 ');

    SQL.Add('   FROM Pischnmas m, PycCode c, PycDept d, PycDept e, PycCode f       ');
    SQL.Add('  WHERE m.paycl = c.codeno(+) AND c.codeid(+) = ''I112''              ');
    SQL.Add('    AND m.payra = f.codeno(+) AND f.codeid(+) = ''I113''              ');
    SQL.Add('    AND m.orgnum = d.orgnum AND m.deptcode = d.deptcode               ');
    SQL.Add('    AND m.aftorgnum = e.orgnum AND m.aftdeptcode = e.deptcode         ');
    SQL.Add('    AND m.AppDate > ''00000000''                                      ');
    SQL.Add('    AND nvl(m.deptcode,''ZZZZZ'') between :ldeptcode1 AND :ldeptcode2 ');
    SQL.Add('    AND nvl(m.deptcode,''ZZZZZ'') between :ldeptcode3 AND :ldeptcode4 ');

    if Cbx_aftreqyn.Text = 'Y' then SQL.Add(' AND m.aftreqdate IS NOT Null            ')
    else if Cbx_aftreqyn.Text = 'N' then SQL.Add(' AND m.aftreqdate  IS Null          ');

    if Cbx_aftOppyn.Text = 'Y' then SQL.Add(' AND nvl(m.aftConYn,''N'') = ''Y''       ')
    else if Cbx_aftOppyn.Text = 'N' then SQL.Add(' AND nvl(m.aftConYn,''N'') = ''N''  ');

    if Cbx_befreqyn.Text = 'Y' then SQL.Add(' AND m.befreqdate IS NOT Null            ')
    else if Cbx_befreqyn.Text = 'N' then SQL.Add(' AND m.befreqdate IS Null           ');

    if Cbx_befOppyn.Text = 'Y' then SQL.Add(' AND nvl(m.befConYn,''N'') = ''Y''       ')
    else if Cbx_befOppyn.Text = 'N' then SQL.Add(' AND nvl(m.befConYn,''N'') = ''N''  ');

    if rBtnOrder1.Checked = True then
      SQL.Add(' ORDER BY m.aftorgnum desc, m.aftdeptcode desc ')
    else if rBtnOrder2.Checked = True then
      SQL.Add(' ORDER BY m.orgnum desc, m.deptcode desc       ');

    ParamByName('ldeptcode1').AsString  := Ed_aftDeptcode1.Valuer.deptcode;
    ParamByName('ldeptcode2').AsString  := Ed_aftDeptcode2.Valuer.deptcode;
    ParamByName('ldeptcode3').AsString  := Ed_befDeptcode1.Valuer.deptcode;
    ParamByName('ldeptcode4').AsString  := Ed_befDeptcode2.Valuer.deptcode;

    Open;
    for i := 0 to FieldCount - 1 do
    begin
      Field := Fields[i];
      case Field.Index of
        0 : Field.DisplayWidth := 8;
        1 : Field.DisplayWidth := 11;
        2 : Field.DisplayWidth := 9;
        3 : Field.DisplayWidth := 31;
        4 : Field.DisplayWidth := 31;
        5 : Field.DisplayWidth := 7;
        6 : Field.DisplayWidth := 7;
        7 : Field.DisplayWidth := 7;
        8 : Field.DisplayWidth := 5;

        9  : Field.Visible := False;
        10 : Field.Visible := False;
        11 : Field.Visible := False;
        12 : Field.Visible := False;
        13 : Field.Visible := False;
        14 : Field.Visible := False;
        15 : Field.Visible := False;
        16 : Field.Visible := False;
        17 : Field.Visible := False;
      end
    end;
    MoniGrid.SelectedRows.CurrentRowSelected := True;
  end;
end;

procedure TFm_SubForm3.Bt_TextClick(Sender: TObject);
begin
  Txt.Execute;
end;

procedure TFm_SubForm3.FormShow(Sender: TObject);
begin
  //DM.Qry_SelectB.Close;
  Bt_SrhClick(Sender);
end;

end.
