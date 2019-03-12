// 개발일자 : 2005.07.   개발자 : 강륜종
// 전산처리요청 2005-12935호 : 팀원 list-up 후 체크된 사번에 대해 일괄 결재 기능

unit pka4040a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, ComCtrls, StdCtrls, OnFocusButton, OnLineLabel, ExtCtrls,
  OnScheme, OnShapeLabel, OnGrDBGrid, CheckLst, OnListbox, DBCtrls, Db,
  OnMemDataset, Tmax_DataSetText, OnInsaCommon, Tmax_DmlSet, TmaxFunc;

type
  TFM_ConAll = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    PA_Buttons: TPanel;
    BT_app: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    GGrid1: TOnGrDbGrid;
    TMaxDataSet1: TTMaxDataSet;
    Label1: TLabel;
    Label_YYMM: TOnSectionLabel;
    Label2: TLabel;
    MD_Data1: TOnMemData;
    MD_Data1empno: TStringField;
    MD_Data1korname: TStringField;
    MD_Data1conyn: TStringField;
    TMaxDML1: TTMaxDML;
    GGrid2: TOnGrDbGrid;
    Label3: TLabel;
    DataSource2: TDataSource;
    TMaxDataSet2: TTMaxDataSet;
    Label4: TLabel;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BT_appClick(Sender: TObject);
    procedure GGrid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure GGrid1CellClick(Column: TColumn);

    procedure PL_Com_Contructor;    
    procedure LastdayFind;
    procedure TMaxDataSet1Find;
    procedure TMaxDataSet2Find;
    procedure GGrid1DblClick(Sender: TObject);
    procedure GGrid2CellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
    FG_duyymm : String;
    FG_deptcode : String;
    FG_LastDay : String;
    Day_Qry1   : String;
    Day_Qry2   : String;    
  end;

var
  FM_ConAll: TFM_ConAll;

implementation

uses pka4040a1;

{$R *.DFM}

procedure TFM_ConAll.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_ConAll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_ConAll.FormCreate(Sender: TObject);
var
   i,j : integer;
begin
  Label_YYMM.Caption := '결재기준년월 : '+FM_Main.FG_yy+'년 '+FM_Main.FG_Month+'월';
  FG_duyymm     := FM_Main.FG_yy + FM_Main.FG_Month;
//  FG_Deptcode   := Copy(FM_Main.ED_empno.deptcode,1,3);
  FG_Deptcode   := Copy(FM_Main.ED_empno.deptcode,1,4);

  LastdayFind;

  TMaxDataSet1Find;  //미결재자 리스트.
  TMaxDataSet2Find;  //미등록자 리스트.

  MD_Data1.Close;
  MD_Data1.Open;
end;

procedure TFM_ConAll.PL_Com_Contructor;
begin
  with TMaxDataSet1 do
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
    end;
end;

procedure TFM_ConAll.LastdayFind;
begin
  with TMaxDataSet1 do
    begin
      PL_Com_Contructor;
      Sql.Text := Format('SELECT TO_CHAR(LAST_DAY(TO_DATE(''%s'',''YYYYMMDD'')),''dd''), '+
                         '       ''field2'', ''field3'', ''field4'', ''field5''          '+
                         '  FROM DUAL ' , [FG_DUYYMM+'01']);
      Open;
      FG_Lastday := FieldByName('field1').AsString;
    end;
end;

//미결재자 리스트....
procedure TFM_ConAll.TMaxDataSet1Find;
var
  FL_Sql : String;
  i,j : Integer;
  Field : TField;
begin
     //2013.09.13.hjku. 미등록 대상자 추출 오류 해결하기 위해 추가...
     j := strtoint(FG_LastDay);

     for i := 1 to j do
     begin
          if i=1 then day_qry1 := 'nvl(DD'+inttostr(i)+' ,''99'')<>''99'' '
                 else day_qry1 := day_qry1 + 'and nvl(DD'+inttostr(i)+' ,''99'')<>''99'' ';
     end;

    with TMaxDataSet1 do
      begin
        PL_Com_Contructor;
        FL_Sql := 'SELECT A.empno,              '+  #13#10 +
                  '       A.korname,            '+  #13#10 +
                  '       nvl(conyn,''N''),     '+  #13#10 +
                  '       ''field4'',           '+  #13#10 +
                  '       ''field5''            '+  #13#10 +
                  '  FROM pkhduty A, Pimeemp B  '+  #13#10 +
                  ' WHERE B.empno  = A.empno(+) '+  #13#10 +
                  '   AND B.eempno =   '''+FM_Main.FG_empno+''''+ #13#10 +
                  '   AND A.duyymm(+)= '''+FG_DUYYMM+''''+ #13#10 +
                  '   AND nvl(conyn,''N'')=''N'''+  #13#10 + //미결재자만 조회..
                  '   AND (' + day_qry1 + ')     ' + #13#10;  //미입력자 제외.
                  {'   AND (dd1 <>''99'' and     '+  //미입력자 제외.
                  '        dd2 <>''99'' and     '+
                  '        dd3 <>''99'' and     '+
                  '        dd4 <>''99'' and     '+
                  '        dd5 <>''99'' and     '+
                  '        dd6 <>''99'' and     '+
                  '        dd7 <>''99'' and     '+
                  '        dd8 <>''99'' and     '+
                  '        dd9 <>''99'' and     '+
                  '        dd10<>''99'' and     '+
                  '        dd11<>''99'' and     '+
                  '        dd12<>''99'' and     '+
                  '        dd13<>''99'' and     '+
                  '        dd14<>''99'' and     '+
                  '        dd15<>''99'' and     '+
                  '        dd16<>''99'' and     '+
                  '        dd17<>''99'' and     '+
                  '        dd18<>''99'' and     '+
                  '        dd19<>''99'' and     '+
                  '        dd20<>''99'' and     '+
                  '        dd21<>''99'' and     '+
                  '        dd22<>''99'' and     '+
                  '        dd23<>''99'' and     '+
                  '        dd24<>''99'' and     '+
                  '        dd25<>''99'' and     '+
                  '        dd26<>''99'' and     '+
                  '        dd27<>''99'' and     '+
                  '        dd28<>''99''         ';
        if FG_LastDay = '28' then
          FL_Sql := FL_Sql +' ) '
        else if FG_LastDay = '29' then
          FL_Sql := FL_Sql +' AND  dd29<>''99'' )'
        else if FG_LastDay = '30' then
          FL_Sql := FL_Sql +' AND  dd29<>''99''  AND  dd30<>''99'' )'
        else if FG_LastDay = '31' then
          FL_Sql := FL_Sql +' AND  dd29<>''99''  AND  dd30<>''99''  AND  dd31<>''99'' )';
         }
        FL_Sql := FL_Sql + ' ORDER BY empno,conyn ';
        Sql.Text := FL_Sql;

        Open;
       ////////////////////////////////////////////////
        for i := 0 to FieldCount - 1 do
        begin
          Field := Fields[i];
          Field.Alignment := taCenter;
          case Field.Index of
            0 : Field.DisplayWidth := 20;     //empno
            1 : Field.DisplayWidth := 20;     //korname
            2 : Field.DisplayWidth := 20;     //conyn
            else
              Field.Visible := False;
          end//case end
        end; //for end

      TMaxDataSet1.First;
    end;
end;

//미등록자 리스트.
procedure TFM_ConAll.TMaxDataSet2Find;
var
  FL_Sql : String;
  i,j : Integer;
  Field : TField;
begin
     //2013.09.13.hjku. 미등록 대상자 추출 오류 해결하기 위해 추가...
     j := strtoint(FG_LastDay);

     for i := 1 to j do
     begin
          if i=1 then day_qry2 := 'nvl(DD'+inttostr(i)+' ,''99'')=''99'' '
                 else day_qry2 := day_qry2 + 'or nvl(DD'+inttostr(i)+' ,''99'')=''99'' ';
     end;

    with TMaxDataSet2 do
      begin
        Close;
        ServiceName := 'HINSA_select';
        ClearFieldInfo;
        AddField('field1', ftString, 100);
        AddField('field2', ftString, 100);
        AddField('field3', ftString, 100);
        AddField('field4', ftString, 100);
        AddField('field5', ftString, 100);
        Sql.Clear;

        FL_Sql := 'SELECT b.empno,                      '+ #13#10 +
                  '       b.korname,                    '+ #13#10 +
                  '       nvl(a.conyn,''N''),           '+ #13#10 +
                  '       ''field4'',                   '+ #13#10 +
                  '       ''field5''                    '+ #13#10 +
                  '  FROM pkhduty a, Pimeemp B          '+ #13#10 +
                  ' WHERE B.empno  = A.empno(+)         '+ #13#10 +
                  '   AND B.eempno =   '''+FM_Main.FG_empno+''''+ #13#10 +
                  '   AND A.duyymm(+)= '''+FG_DUYYMM+''''+ #13#10 +
                  '   AND (' + day_qry2 + ')     ' + #13#10;
                  {'   AND (nvl(dd1,''99'') = ''99'' or  '+
                  '        nvl(dd2,''99'') = ''99'' or  '+
                  '        nvl(dd3,''99'') = ''99'' or  '+
                  '        nvl(dd4,''99'') = ''99'' or  '+
                  '        nvl(dd5,''99'') = ''99'' or  '+
                  '        nvl(dd6,''99'') = ''99'' or  '+
                  '        nvl(dd7,''99'') = ''99'' or  '+
                  '        nvl(dd8,''99'') = ''99'' or  '+
                  '        nvl(dd9,''99'') = ''99'' or  '+
                  '        nvl(dd10,''99'')= ''99'' or  '+
                  '        nvl(dd11,''99'')= ''99'' or  '+
                  '        nvl(dd12,''99'')= ''99'' or  '+
                  '        nvl(dd13,''99'')= ''99'' or  '+
                  '        nvl(dd14,''99'')= ''99'' or  '+
                  '        nvl(dd15,''99'')= ''99'' or  '+
                  '        nvl(dd16,''99'')= ''99'' or  '+
                  '        nvl(dd17,''99'')= ''99'' or  '+
                  '        nvl(dd18,''99'')= ''99'' or  '+
                  '        nvl(dd19,''99'')= ''99'' or  '+
                  '        nvl(dd20,''99'')= ''99'' or  '+
                  '        nvl(dd21,''99'')= ''99'' or  '+
                  '        nvl(dd22,''99'')= ''99'' or  '+
                  '        nvl(dd23,''99'')= ''99'' or  '+
                  '        nvl(dd24,''99'')= ''99'' or  '+
                  '        nvl(dd25,''99'')= ''99'' or  '+
                  '        nvl(dd26,''99'')= ''99'' or  '+
                  '        nvl(dd27,''99'')= ''99'' or  '+
                  '        nvl(dd28,''99'')= ''99''     ';
        if FG_LastDay = '28' then
          FL_Sql := FL_Sql +' ) '
        else if FG_LastDay = '29' then
          FL_Sql := FL_Sql +'   or nvl(dd29,''99'')= ''99''    )'
        else if FG_LastDay = '30' then
          FL_Sql := FL_Sql +'   or nvl(dd29,''99'')= ''99''     '+
                            '   or nvl(dd30,''99'')= ''99''    )'
        else if FG_LastDay = '31' then
          FL_Sql := FL_Sql +'   or nvl(dd29,''99'')= ''99''     '+
                            '   or nvl(dd30,''99'')= ''99''     '+
                            '   or nvl(dd31,''99'')= ''99''    )';
        }
        FL_Sql := FL_Sql + ' ORDER BY empno ';
        Sql.Text := FL_Sql;

        Open;
       ////////////////////////////////////////////////
        for i := 0 to FieldCount - 1 do
        begin
          Field := Fields[i];
          Field.Alignment := taCenter;
          case Field.Index of
            0 : Field.DisplayWidth := 20;     //empno
            1 : Field.DisplayWidth := 20;     //korname
            2 : Field.DisplayWidth := 20;     //conyn
            else
              Field.Visible := False;
          end//case end
        end; //for end

      TMaxDataSet2.First;
    end;
end;

procedure TFM_ConAll.BT_appClick(Sender: TObject);
var
  FL_i   : Integer;
  FL_k   : Integer;
  FL_Comp: TOnShapeLabel;
  i      : Integer;
  FL_Sql : String;
  Field : TField;
begin
  if MD_Data1.RecordCount < 1 then
    begin
      MessageDlg('미결재 사원중 선택한 사원이 없습니다!. 결재할 사원을 선택하세요', mtInformation, [mbOK], 0);
      System.Exit;
    end;

   Label1.Caption := '해당월의 결재정보 저장 중입니다... 잠시만 기다리세요...';

   FM_Tmax           := TFM_Tmax.Create(Self);
   FM_Tmax.T_Session := FM_Main.TMaxSession;
   FM_Main.FG_Date   := FM_Tmax.GetData('sysdate' ,'','');

   with TMaxDML1 do
    begin
      MD_Data1.First;
      for i := 0 to GGrid1.SelectedRows.Count -1 do
      begin
        TMaxDML1.ClearFieldInfo;
        AddField('duyymm' ,FG_duyymm, ftString, False, True, False,'=');
        AddField('empno'  ,MD_Data1.FieldByName('empno').AsString, ftString, False, True, True,'=');
        AddField('conyn'  ,'Y'             , ftString, True, False, False, '');
        AddField('contime',FM_Main.FG_Date , ftString, True, False, False, '');
        AddField('conman' ,FM_Main.FG_empno, ftString, True, False, False, '');

        try
          TMaxDML1.Update;
          TMaxDML1.Execute;
        except
          MessageDlg('휴가계획 결재 실패 : 사번 '+MD_Data1.FieldByName('empno').AsString, mtInformation, [mbOK], 0);
        end;

        MD_Data1.Next;
      end;
    end;

    MessageDlg('휴가계획 결재가 완료 되었습니다...', mtInformation, [mbOK], 0);
    ////////////////////////////////////////////////////////////////////////////
    //데이터 다시 읽기...
    Label1.Caption := '';
    TMaxDataSet1.Close;
    TMaxDataSet1.Open;
    for i := 0 to TMaxDataSet1.FieldCount - 1 do
    begin
      Field := TMaxDataSet1.Fields[i];
      Field.Alignment := taCenter;
      case Field.Index of
        0 : Field.DisplayWidth := 20;     //empno
        1 : Field.DisplayWidth := 20;     //korname
        2 : Field.DisplayWidth := 20;     //conyn
        else
          Field.Visible := False;
      end//case end
    end; //for end

   MD_Data1.Close; 
end;

procedure TFM_ConAll.GGrid1ApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (TOnGrDbGrid(Sender).SelectedRows.CurrentRowSelected) then
    Canvas.Brush.Color := $00FF9B9B;
end;

procedure TFM_ConAll.GGrid1CellClick(Column: TColumn);
begin
  if not MD_Data1.Active then
    begin
      MD_Data1.Open;
    end;

   if Length(GGrid1.SelectedField.DisplayText) = 4 then
   begin
     MD_Data1.Append;
     MD_Data1.FieldByName('empno').AsString := GGrid1.SelectedField.DisplayText;
     MD_Data1.Post;
   end;
end;

procedure TFM_ConAll.GGrid1DblClick(Sender: TObject);
begin
{
  with FM_Main do
  begin
    ED_empno.OnReadEnded := nil;
    ED_empno.text  := GGrid1.SelectedField.DisplayText;

    FG_empdate   := ED_empno.empdate;
    if ED_dept.Enabled then
      begin
        ED_dept.Text := ED_empno.deptname;
        ED_dept.Hint := ED_empno.jobdept;
      end;

    PL_Month_Contructor;
//    ED_empno.PL_get_singledata;
  end;

  Close;
  }
end;

procedure TFM_ConAll.GGrid2CellClick(Column: TColumn);
begin
  MD_Data1.Close;
end;

end.

