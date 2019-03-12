unit pvb1040a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Tmax_DataSetText, Tmax_session, OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnLineLabel, StdCtrls,
  OnEditCombo, ImgList, OnDBGrid, OnSkinBtn, Db, OnTmaxInsaData,
  Tmax_DmlSet, OnStringUtils;

type
  TFM_SubForm1 = class(TForm)
    PA_work: TPanel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    QR_pvdept: TTMaxDataSet;
    DataSource1: TDataSource;
    ID_Data: TOnTMaxInsaData;
    ED_sdeptname: TOnEdit;
    Grid1: TOnDBGrid;
    ED_deptcode: TOnEdit;
    ED_deptname: TOnEdit;
    ED_temp1: TOnEdit;
    ED_temp2: TOnEdit;
    Shape1: TShape;
    OnSectionLabel2: TOnSectionLabel;
    QR_dml: TTMaxDML;
    QR_com: TTMaxDataSet;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FG_Ins2  : Boolean;
    
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    FG_empno     : String;

    procedure PL_InitForm;
    procedure PL_pvpycdept_FieldSet;
    procedure PL_Select_Tag2;
    procedure PL_Insert_Tag2;
    procedure PL_Save_Tag2;
    procedure PL_Delete_Tag2;
    function  PL_Get_deptcode : String;
    function  PL_Check_Tag2 : Boolean;
  end;

var
  FM_SubForm1: TFM_SubForm1;

implementation

uses pvb1040a1;

{$R *.DFM}

procedure TFM_SubForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_SubForm1.PL_InitForm;
begin
  QR_pvdept.Session := Insa_Session;
  QR_dml.Session    := Insa_Session;
  QR_com.Session    := Insa_Session;

  ID_Data.Session   := Insa_Session;
end;

procedure TFM_SubForm1.PL_pvpycdept_FieldSet;
var
  FL_Date : String;
begin
  ID_Data.gubun := data_date;
  FL_Date       := ID_Data.Data;

  with QR_dml do
    begin
      TableName   := 'pvpycdept';
      ServiceName := 'HINSA_perins';
      ClearFieldInfo;
      DataSet.ClearParamInfo;
      if not FG_ins2 then
      begin
           AddField('orgnum'       ,'ZZZ'            ,ftString, False, True, True, '=');
           AddField('deptcode'     ,ED_deptcode.Text ,ftString, False, True, True, '=');
      end
      else
      begin
           AddField('orgnum'      ,'ZZZ'            ,ftString, True, False, False, '');
           AddField('deptcode'    ,ED_deptcode.Text ,ftString, True, False, False, '');
      end;

      AddField('deptname'      ,ED_deptname.Text  ,ftString, True, False, False, '');
      AddField('temp1'         ,ED_temp1.Text     ,ftString, True, False, False, '');
      AddField('temp2'         ,ED_temp2.Text     ,ftString, True, False, False, '');
      AddField('writetime'     ,FL_Date           ,ftString, True, False, False, '');
      AddField('writeman'      ,FG_empno          ,ftString, True, False, False, '');
    end;
end;

function TFM_SubForm1.PL_Get_deptcode : String;
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
       Sql.Text := 'SELECT NVL(MAX(SUBSTR(deptcode,3,4)),0) + 1 cnt, ''2'',''3'',''4'',''5'' '+
                   '  FROM pvpycdept A '+
                   ' WHERE deptcode LIKE ''ZZ%'' '+
                   '   AND orgnum      = ''ZZZ'' ';
       if Open then
       begin
           Result := FillDataFix(Result,4 - Length(Trim(FieldByName('field1').AsString)),'0');
           Result := 'ZZ' + Result + Trim(FieldByName('field1').AsString);
       end;
       Close;
  end;
end;

function TFM_SubForm1.PL_Check_Tag2 : Boolean;
begin
  Result := False;

  if ED_deptcode.Text = '' then
  begin
       MessageDlg('부서코드를 입력하세요...', mtInformation, [mbOK], 0);
       ED_deptcode.SetFocus;
       System.Exit;
  end;

  if ED_deptname.Text = '' then
  begin
       MessageDlg('부서명을 입력하세요...', mtInformation, [mbOK], 0);
       ED_deptname.SetFocus;
       System.Exit;
  end;

  Result := True;
end;

procedure TFM_SubForm1.PL_Select_Tag2;
begin
  with QR_pvdept do
    begin
      Close;
      ServiceName := 'PVB1040A_sel2';
      Sql.Clear;
      Sql.Text := 'SELECT orgnum      ,  '+
                  '       deptcode    ,  '+
                  '       deptname    ,  '+
                  '       temp1       ,  '+
                  '       temp2          '+
                  '  FROM pvpycdept      '+
                  ' WHERE orgnum   = ''ZZZ''   '+
                  '   AND deptname LIKE ''%s'' '+
                  ' ORDER BY deptcode    ';
       Sql.Text := Format(Sql.Text,[ED_sdeptname.Text+'%']);
       DataSource1.OnDataChange := DataSource1DataChange;                  
       Open;
    end;
end;

procedure TFM_SubForm1.PL_Insert_Tag2;
begin
  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,-1);

  FG_Ins2           := True;
  ED_deptcode.Text := PL_Get_deptcode;
  ED_deptname.SetFocus;
end;

procedure TFM_SubForm1.PL_Save_Tag2;
begin
  DataSource1.OnDataChange := nil;
  PL_pvpycdept_FieldSet;
  if not FG_ins2 then
    QR_dml.Update
  else
    QR_dml.Insert;

  if not QR_dml.Execute then
    begin
      DataSource1.OnDataChange := DataSource1DataChange;
      System.Exit;
    end;

  if QR_pvdept.Active then
    begin
      QR_dml.ApplyDataSet(QR_pvdept, FG_ins2);
    end;
  FG_ins2 := False;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFM_SubForm1.PL_Delete_Tag2;
begin
  DataSource1.OnDataChange := nil;
  PL_pvpycdept_FieldSet;
  QR_dml.Delete;

  if not QR_dml.Execute then
    begin
      DataSource1.OnDataChange := DataSource1DataChange;
      System.Exit;
    end;
  if QR_pvdept.Active then
    begin
      with QR_pvdept do
        Delete;
    end;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFM_SubForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if FG_Ins2 then
    begin
      if MessageDlg('신규 등록 중입니다... 취소하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
        System.Exit;
    end;

  Hinsa_InitComponent(Self,11);
  Hinsa_InitComboBox(Self,11,-1);

  Hinsa_FieldDisplay(Self, QR_pvdept, 4, 11);
  FG_ins2 := False;
end;

end.
