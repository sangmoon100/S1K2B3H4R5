unit pvb1040a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Tmax_DataSetText, Tmax_session, OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnLineLabel, StdCtrls,
  OnEditCombo, ImgList, OnDBGrid, OnSkinBtn, Db, OnTmaxInsaData,
  Tmax_DmlSet, OnStringUtils;

type
  TFM_SubForm2 = class(TForm)
    PA_work: TPanel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    DataSource1: TDataSource;
    ID_Data: TOnTMaxInsaData;
    ED_sv_pcname: TOnEdit;
    Grid1: TOnDBGrid;
    Shape1: TShape;
    OnSectionLabel2: TOnSectionLabel;
    ED_v_pcid: TOnEdit;
    ED_v_pcname: TOnEdit;
    QR_pro: TTMaxDataSet;
    QR_com: TTMaxDataSet;
    QR_dml: TTMaxDML;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FG_ins3  : Boolean;

    procedure DataSource1DataChange(Sender: TObject; Field: TField);    
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    FG_empno     : String;

    procedure PL_InitForm;
    procedure PL_pvprolist_FieldSet;
    procedure PL_Select_Tag3;
    procedure PL_Insert_Tag3;
    procedure PL_Save_Tag3;
    procedure PL_Delete_Tag3;
    function  PL_Get_v_pcid : String;
    function  PL_Check_Tag3 : Boolean;
  end;

var
  FM_SubForm2: TFM_SubForm2;

implementation

uses pvb1040a1;

{$R *.DFM}

procedure TFM_SubForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_SubForm2.PL_InitForm;
begin
  QR_Pro.Session  := Insa_Session;
  QR_dml.Session  := Insa_Session;
  QR_com.Session  := Insa_Session;

  ID_Data.Session := Insa_Session;
end;

procedure TFM_SubForm2.PL_pvprolist_FieldSet;
var
  FL_Date : String;
begin
  ID_Data.gubun := data_date;
  FL_Date       := ID_Data.Data;

  with QR_dml do
  begin
       TableName   := 'pvprolist';
       ServiceName := 'HINSA_perins';
       ClearFieldInfo;
       DataSet.ClearParamInfo;
       if not FG_ins3 then
       begin
            AddField('v_pcid'    ,ED_v_pcid.Text   ,ftString, False, True, True, '=');
       end
       else
       begin
            AddField('v_pcid'    ,ED_v_pcid.Text ,ftString, True, False, False, '');
       end;
       AddField('v_pcname'      ,ED_v_pcname.Text  ,ftString, True, False, False, '');
       AddField('writetime'     ,FL_Date           ,ftString, True, False, False, '');
       AddField('writeman'      ,FG_empno          ,ftString, True, False, False, '');
  end;
end;

function TFM_SubForm2.PL_Get_v_pcid : String;
begin
  Result := '';
  with QR_com do
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('field1'  , ftString, 100);
       AddField('field2'  , ftString, 100);
       AddField('field3'  , ftString, 100);
       AddField('field4'  , ftString, 100);
       AddField('field5'  , ftString, 100);
       Sql.Clear;
       Sql.Text := 'SELECT /*+ index_desc (A) */  NVL(MAX(v_pcid),0) + 1 cnt, ''2'',''3'',''4'',''5'' '+
                   '  FROM pvprolist A        '+
                   ' WHERE v_pcid <> ''9999'' '+
                   '   AND rownum = 1 ';
       if Open then
       begin
            Result := FillDataFix(Result,4 - Length(Trim(FieldByName('field1').AsString)),'0');
            Result := Result + Trim(FieldByName('field1').AsString);
       end;
       Close;
  end;
end;

function TFM_SubForm2.PL_Check_Tag3 : Boolean;
begin
  Result := False;

  if ED_v_pcid.Text = '' then
  begin
       MessageDlg('방문목적Id를 입력하세요...', mtInformation, [mbOK], 0);
       ED_v_pcid.SetFocus;
       System.Exit;
  end;

  if ED_v_pcname.Text = '' then
  begin
       MessageDlg('방문목적명을 입력하세요...', mtInformation, [mbOK], 0);
       ED_v_pcname.SetFocus;
       System.Exit;
  end;

  Result := True;
end;

procedure TFM_SubForm2.PL_Select_Tag3;
begin
  with QR_pro do
  begin
       Close;
       ServiceName := 'HINSA_prolist';
       Sql.Clear;
       Sql.Add(Format('SELECT v_pcid, v_pcname FROM pvprolist '+
                      ' WHERE v_pcname LIKE ''%s'' '+
                      '   AND v_pcid <> ''9999''   '+
                      ' ORDER BY v_pcid            ',
                      [ED_sv_pcname.Text + '%'] ));
       DataSource1.OnDataChange := DataSource1DataChange;
       Open;
  end;
end;

procedure TFM_SubForm2.PL_Insert_Tag3;
begin
  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,-1);

  FG_Ins3          := True;
  ED_v_pcid.Text   := PL_Get_v_pcid;
  ED_v_pcname.SetFocus;
end;

procedure TFM_SubForm2.PL_Save_Tag3;
begin
  DataSource1.OnDataChange := nil;
  PL_pvprolist_FieldSet;
  if not FG_ins3 then
       QR_dml.Update
  else
       QR_dml.Insert;

  if not QR_dml.Execute then
  begin
       DataSource1.OnDataChange := DataSource1DataChange;
       System.Exit;
  end;

  if QR_pro.Active then
  begin
       QR_dml.ApplyDataSet(QR_pro, FG_ins3);
  end;
  FG_ins3 := False;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFM_SubForm2.PL_Delete_Tag3;
begin
  DataSource1.OnDataChange := nil;
  PL_pvprolist_FieldSet;
  QR_dml.Delete;

  if not QR_dml.Execute then
  begin
       DataSource1.OnDataChange := DataSource1DataChange;
       System.Exit;
  end;
  if QR_pro.Active then
  begin
      with QR_pro do
           Delete;
  end;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFM_SubForm2.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if FG_Ins3 then
  begin
       if MessageDlg('신규 등록 중입니다... 취소하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
            System.Exit;
  end;

  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,-1);

  Hinsa_FieldDisplay(Self, QR_pro, 4, 11);
  FG_ins3 := False;
end;

end.
