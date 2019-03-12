unit PIA1070B_9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Tmax_session, OnInsaCommon, Tmax_DataSetText, OnDBGrid, StdCtrls,
  ExtCtrls, OnLineLabel, OnShapeLabel, Db, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditCombo;

type
  TFM_SubForm9 = class(TForm)
    PA_Work1: TPanel;
    OnSectionLabel2: TOnSectionLabel;
    Shape3: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Grid1: TOnDBGrid;
    DataSource1: TDataSource;
    QR_po: TTMaxDataSet;
    anBasDate: TOnComboEdit;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Shape6: TShape;
    procedure RadioGroup1Click(Sender: TObject);
    procedure anBasDateChange(Sender: TObject);

  private
    { Private declarations }
    start : integer;

  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    procedure PL_InitForm;
    procedure PL_Select_Data;
    function  Csel_gfd(p_loc: Integer): String;
  end;

var
  FM_SubForm9: TFM_SubForm9;

implementation

uses PIA1070B_1;
{$R *.DFM}

procedure TFM_SubForm9.PL_InitForm;
var  i : integer;
begin
  QR_po.Session := Insa_Session;

  with QR_po do
  begin
    anBasDate.Items.Clear;

    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('STDATE' , ftString, 100);
    AddField('F2'     , ftString, 100);
    AddField('F3'     , ftString, 100);
    AddField('F4'     , ftString, 100);
    AddField('F5'     , ftString, 100);
    ClearParamInfo;
    Sql.Clear;

    Sql.Text := 'select distinct NVL(SUBSTRB(STDATE,1,4),'' '') STDATE, '+
                '       '''' F2, '''' F3, '''' F4, '''' F5 from PIDUPOST ' +
                ' order by 1 desc ';
    Open;
    for  i := 0  to  QR_po.RecordCount -1 do
    begin
      anBasDate.Items.Add(QR_po.Fieldbyname('STDATE').AsString);
      next;
    end;
  End;

  RadioGroup1.ItemIndex := 0;
  anBasDate.ItemIndex   := 0;

  PL_Select_Data;
end;

procedure TFM_SubForm9.PL_Select_Data;
var SqlText : String;
begin
  with QR_po do
  begin
    SqlText := 'SELECT UNITNM , RDDEPTNM , UNKIND ,         ' +
               '       SUBSTR(STDATE,1,4)||''-''||SUBSTR(STDATE,5,2)||''-''||SUBSTR(STDATE,7,2)||'' ~ ''||' +
               '       SUBSTR(FIDATE,1,4)||''-''||SUBSTR(FIDATE,5,2)||''-''||SUBSTR(FIDATE,7,2) STDATE,   ' +
               '       UNITARGET, ''6'' Field6, ''7'' Field7, ''8'' Field8, ''9'' Field9, ''10'' Field10  ' +
               '  FROM PIDUPOST                             ' +
               ' WHERE empno = '''+ FM_Main.FG_CurEmpno +'''' ;

    If      (RadioGroup1.ItemIndex = 1) Then SqlText := SqlText + 'AND UNKIND = ''SME'' '
    Else If (RadioGroup1.ItemIndex = 2) Then SqlText := SqlText + 'AND UNKIND = ''VW''  '
    Else                                     SqlText := SqlText;

    SqlText := SqlText + ' AND STDATE like ''' + anBasDate.Text + '''||''%'' ' +
                         ' ORDER BY STDATE ';

    Close;
    ServiceName := 'HINSA_select12';
    ClearFieldInfo;
    ClearParamInfo;

    AddField('UNITNM'   , ftString, 2000);
    AddField('RDDEPTNM' , ftString, 2000);
    AddField('UNKIND'   , ftString, 2000);
    AddField('STDATE'   , ftString, 2000);
    AddField('UNITARGET', ftString, 2000);
    AddField('Field6'   , ftString, 2000);
    AddField('Field7'   , ftString, 2000);
    AddField('Field8'   , ftString, 2000);
    AddField('Field9'   , ftString, 2000);
    AddField('Field10'  , ftString, 2000);
    Sql.Text := SqlText;
    Open;

    if RecordCount <= 0 then
    begin
      Grid1.Visible := False;
    end
    else
    begin
      Grid1.Visible := True;
    end;
  end;
end;

function TFM_SubForm9.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := QR_po.FieldByName('sel_data').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_SubForm9.RadioGroup1Click(Sender: TObject);
begin
  PL_Select_Data;
end;


procedure TFM_SubForm9.anBasDateChange(Sender: TObject);
begin
  PL_Select_Data;
end;

end.
