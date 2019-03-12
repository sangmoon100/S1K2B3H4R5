unit PKA4040A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ExtCtrls, Db, Tmax_DataSetText,func,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, OnShapeLabel, PDownLoad, Pass,
  OnInsaCommon, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, OnEditBtnCtrl,
  OnLineLabel, OnScheme, OnEditCombo,Calen1, UDutycode, ComCtrls;

type
  TFM_yearly_move = class(TForm)
    TDS_Com: TTMaxDataSet;
    TMaxDataSet1: TTMaxDataSet;
    QR_sel1: TTMaxDataSet;
    QR_dml: TTMaxDataSet;
    DataSource1: TDataSource;
    OnSchemeForm1: TOnSchemeForm;
    QR_com: TTMaxDataSet;
    Panel2: TPanel;
    PA_Buttons: TPanel;
    bt_move: TOnFocusButton;
    bt_close: TOnFocusButton;
    bt_search: TOnFocusButton;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Grid2: TStringGrid;
    e_Moddate2: TOnButtonEdit;
    e_Moddate1: TOnButtonEdit;
    e_dutycode: TOnComboEdit;
    Shape8: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel5: TOnSectionLabel;
    Shape9: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Grid2Click(Sender: TObject);
    procedure e_dutycodeChange(Sender: TObject);
    procedure bt_moveClick(Sender: TObject);
    procedure e_Moddate1ButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure e_Moddate2ButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure bt_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    YR_Regdate1, YR_Regdate2, YR_Moddate1, YR_Moddate2, YR_DutyCode :String;
    YR_RegCnt1, YR_RegCnt2, YR_ModCnt1, YR_ModCnt2 : double;
    YR_StrtDate, YR_EndDate,  YR_Empno, YR_Korname : string;

    procedure PL_InitYearly;
    procedure Clear_StringGrid;
    procedure PL_Select_yearly_list;
    function  PL_Input_Check : Boolean;
    Function  Check_DateValid( InDate : String ) : Boolean;
    function  PL_Get_Duty_Cnt(empno, yrdate, flag : String) : real;
    function  Insert_Yearly_ModHis : boolean;
    function  Make_Query(v_empno,dutydate, dutycode, flag : string; out update_list, insert_list, column_list :string):boolean;
    function  Update_Query(v_empno,dutydate, flag, update_list, insert_list, column_list :string):boolean;


  end;
type
  TstCellObj = packed record
  case Integer of
    0 : ( Num      : Integer);
    1 : ( Sender   : TObject);
end;   

var
  FM_yearly_move: TFM_yearly_move;

{const
  HOLIYEAR  = '63'; // 연차
  YEARHALF  = '64'; // 반연차 2010.06.28
}
implementation
uses
  pka4040a1;

{$R *.DFM}

procedure TFM_yearly_move.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_yearly_move.bt_closeClick(Sender: TObject);
begin
  FM_Main.PL_Month_Contructor;
  close;
end;

procedure TFM_yearly_move.FormShow(Sender: TObject);
begin
  PL_InitYearly;
end;

procedure TFM_yearly_move.PL_InitYearly;
begin
  //2016.09.23.hjku.. 휴가계획등록 마감된 자료 확인 추가
  FM_Main.FG_Mendyn := FM_Main.PL_Month_endyn(FM_Main.FG_yy+FM_Main.FG_Month,FM_Main.ED_empno.empno);
  
  e_dutycode.ItemIndex := 0;
  e_Moddate1.Text := '';
  e_Moddate2.Text := '';

  e_Moddate2.Enabled := false;

  YR_Regdate1 := '';
  YR_Regdate2 := '';
  YR_Moddate1 := '';
  YR_Moddate2 := '';
  YR_DutyCode := '63';

  YR_RegCnt1  := 0;
  YR_RegCnt2  := 0;
  YR_ModCnt1  := 0;
  YR_ModCnt2  := 0;

  if(FM_Main.FG_yy> copy(FM_Main.GS_Knteyymm,1,4)) then
  begin
    YR_StrtDate := FM_Main.FG_yy +'0101';
    YR_EndDate  := FM_Main.FG_yy +'1231';
  end
  else
  begin
    YR_StrtDate := FormatDateTime('yyyymmdd',IncMonth(StrToDate(copy(FM_Main.GS_Knteyymm,1,4)+'-'+copy(FM_Main.GS_Knteyymm,5,2)+'-01'), 1));;
    YR_EndDate  := copy(FM_Main.GS_Knteyymm,1,4) +'1231';
  end;

  YR_Empno    := FM_Main.ED_empno.empno;
  YR_Korname  := FM_Main.ED_empno.korname;

  PL_Select_yearly_list;
end;

procedure TFM_yearly_move.PL_Select_yearly_list;
var
  i       : Integer;
  CelObj  : TstCellObj;
begin

  with QR_sel1 do
    begin
      Close;
      ServiceName := 'HINSA_select4';
      ClearFieldInfo;

      AddField('empno'     , ftString, 100);
      AddField('DUTYYYMMDD', ftString, 100);
      AddField('DUTYCODE'  , ftString, 100);
      AddField('dutyname'  , ftString, 100);
      AddField('field5'    , ftString, 100);

      Sql.Clear;

      Sql.Add('SELECT                                                                                                                                                                                                       ');
      Sql.Add('        EMPNO,                                                                                                                                                                                               ');
      Sql.Add('        DUTYYYMMDD,                                                                                                                                                                                          ');
      Sql.Add('        DUTYCODE,                                                                                                                                                                                            ');
      Sql.Add('        (SELECT DUNAME FROM PKCDUCOD WHERE A.DUTYCODE = DUKIND) DUTYNAME,                                                                                                                                    ');
      Sql.Add('        0                                                                                                                                                                                                    ');
      Sql.Add(' FROM                                                                                                                                                                                                        ');
      Sql.Add('        (SELECT DUYYMM||''01'' DUTYYYMMDD, EMPNO,  DD1 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''02'' DUTYYYMMDD, EMPNO,  DD2 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''03'' DUTYYYMMDD, EMPNO,  DD3 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''04'' DUTYYYMMDD, EMPNO,  DD4 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''05'' DUTYYYMMDD, EMPNO,  DD5 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''06'' DUTYYYMMDD, EMPNO,  DD6 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''07'' DUTYYYMMDD, EMPNO,  DD7 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''08'' DUTYYYMMDD, EMPNO,  DD8 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''09'' DUTYYYMMDD, EMPNO,  DD9 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''10'' DUTYYYMMDD, EMPNO, DD10 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''11'' DUTYYYMMDD, EMPNO, DD11 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''12'' DUTYYYMMDD, EMPNO, DD12 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''13'' DUTYYYMMDD, EMPNO, DD13 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''14'' DUTYYYMMDD, EMPNO, DD14 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''15'' DUTYYYMMDD, EMPNO, DD15 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''16'' DUTYYYMMDD, EMPNO, DD16 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''17'' DUTYYYMMDD, EMPNO, DD17 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''18'' DUTYYYMMDD, EMPNO, DD18 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''19'' DUTYYYMMDD, EMPNO, DD19 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''20'' DUTYYYMMDD, EMPNO, DD20 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''21'' DUTYYYMMDD, EMPNO, DD21 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''22'' DUTYYYMMDD, EMPNO, DD22 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''23'' DUTYYYMMDD, EMPNO, DD23 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''24'' DUTYYYMMDD, EMPNO, DD24 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''25'' DUTYYYMMDD, EMPNO, DD25 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''26'' DUTYYYMMDD, EMPNO, DD26 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''27'' DUTYYYMMDD, EMPNO, DD27 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''28'' DUTYYYMMDD, EMPNO, DD28 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''29'' DUTYYYMMDD, EMPNO, DD29 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''30'' DUTYYYMMDD, EMPNO, DD30 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+''' UNION ALL        ');
      Sql.Add('         SELECT DUYYMM||''31'' DUTYYYMMDD, EMPNO, DD31 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR('''+YR_StrtDate+''',1,6) AND SUBSTR('''+YR_EndDate+''',1,6) AND EMPNO = '''+YR_Empno+'''                  ');
      Sql.Add('        )A                                                                                                                                                                                                   ');
      Sql.Add('     WHERE A.DUTYCODE IN (''63'',''64'')                                                                                                                                                                     ');
      Sql.Add('order by 1,2                                                                                                                                                                                                   ');
      open;

    end;

  Clear_StringGrid;

  if QR_sel1.RecordCount > 0 then
  begin
    Grid2.RowCount := QR_sel1.RecordCount +1;

    for i := 1 to QR_sel1.RecordCount do
    begin

      Grid2.Cells[1, i] :=  QR_sel1.fieldbyname('DUTYYYMMDD').AsString;
      Grid2.Cells[2, i] :=  QR_sel1.fieldbyname('DUTYCODE').AsString;
      Grid2.Cells[3, i] :=  QR_sel1.fieldbyname('DUTYNAME').AsString;

      CelObj.Num := 2;
      Grid2.Cells[0, i] := 'N';
      Grid2.Objects[0,i] := CelObj.Sender;

      QR_sel1.next;
    end;
  end
  else
  begin
    Grid2.RowCount := 2;
    Grid2.Cells[1, 1] :=  '';
    Grid2.Cells[2, 1] :=  '';
    Grid2.Cells[3, 1] :=  '';

    CelObj.Num := 2;
    Grid2.Cells[0, 1] := 'N';
    Grid2.Objects[0,1] := CelObj.Sender;
  end;
end;



procedure TFM_yearly_move.Clear_StringGrid;
var
  i : integer;
begin
    grid2.ColCount    := 4;
    grid2.RowCount    := 2;
    Grid2.Cells[0,0]  := '';
    Grid2.Cells[1,0]  := '연차년월일';
    Grid2.Cells[2,0]  := '연차코드';
    Grid2.Cells[3,0]  := '연차명';

    grid2.ColWidths[0]:= 40;
    grid2.ColWidths[1]:= 80;
    grid2.ColWidths[2]:= 60;
    grid2.ColWidths[3]:= 60;

    for i := 0 to 3 do
         grid2.Cells[i,1] := '';    
end;


procedure DrawCheck(DC:HDC;BBRect:TRect;bCheck:Boolean);
begin
  if bCheck then
  Begin
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK + DFCS_CHECKED)
  End
  else
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK);
end;

procedure TFM_yearly_move.Grid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
  arect: TRect;
  CelObj: TstCellObj;
begin
  with Grid2.Canvas do
  begin
    if (ARow = 0) then Font.Style := [fsBold]
    else               Font.Style := [];

    FillRect(Rect);
    Rect.Top   := Rect.Top + 4;

    Loc := DT_CENTER;
    DrawText(Handle, PChar(Grid2.Cells[ACol, ARow]), -1, Rect, Loc);
  end;

  with TStringGrid(Sender).Canvas do
  begin
    if ARow > 0 then
    begin
      if ACol = 0 then
      begin
        // 3. CheckBox 그리기
        with (Sender As TStringGrid) do
        begin
          //화면을 지웁니다.
          Canvas.FillRect(Rect);
          // arect는 크기입니다. Box크기를 보고 조절하세요.
          arect := Rect;
          arect.Top := Rect.Top + 2;
          arect.Bottom := Rect.Bottom - 2;
          CelObj.Sender:=Objects[ACol,ARow];
          DrawCheck(Canvas.Handle, arect, CelObj.Num = 1);
        end;
      end;
    end;
  end;

end;

procedure TFM_yearly_move.Grid2Click(Sender: TObject);
var
  CelObj: TstCellObj;
  pt: TPoint;
  ACol,ARow: Integer;
  valconyn : String;
  yearlydate : String;
begin
  pt := Mouse.CursorPos;
  pt := Grid2.ScreenToClient(pt);
  Grid2.MouseToCell(pt.x,pt.y,ACol,ARow);

  with Grid2 do
  Begin
    valconyn   := Cells[0 ,Row];
    yearlydate := Cells[1 ,Row];
  End;

  if (ARow > 0) and (ACol = 0) then
  begin
    CelObj.Sender := Grid2.Objects[ACol,ARow];

    if CelObj.Num = 1 then
    Begin
      CelObj.Num:=2;
      Grid2.Cells[0, ARow] := 'N';
    end else
    Begin
      CelObj.Num := 1;
      Grid2.Cells[0, ARow] := 'Y';
    End;

    Grid2.Objects[ACol,ARow] := CelObj.Sender;
    Grid2.Invalidate;
    Exit;
  End;

end;

procedure TFM_yearly_move.e_dutycodeChange(Sender: TObject);
begin
  if(e_dutycode.ItemIndex=0) then
  begin
    e_Moddate1.Enabled := true;
    e_Moddate2.Enabled := false;
    e_Moddate2.Text := '';
  end
  else
  begin
    e_Moddate1.Enabled := true;
    e_Moddate2.Enabled := true;
  end;
end;

Function TFM_yearly_move.Check_DateValid( InDate : String ) : Boolean;
var
   Temp : Real;
   Buf  : String;
begin
  Result := False;

  Buf := InDate;
  if (Length(Buf) <> 8) or (copy(Buf,1,6) <= FM_Main.GS_Knteyymm) then
  begin
     Result := False;
     System.Exit;
  end;

  if (Copy(Buf,1,4)<>FM_Main.FG_yy) then
  begin

     System.Exit;
  end;

  Buf := Copy(Buf,1,4) + DateSeparator + Copy(Buf,5,2) + DateSeparator + Copy(Buf,7,2);

  Try
  Temp := StrToDate( Buf );
  Except on EConvertError do
     begin
          Result := False;
          System.Exit;
     end;
  end;

  Result := True;
end;

function TFM_yearly_move.PL_Get_Duty_Cnt(empno, yrdate, flag : String) : real;
begin
  result := 0.0;

  if(yrdate='') then system.exit;

  with QR_com do
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

    SQL.Add('select hper.dutyutil.GET_DUTY_CNT('''+empno+''','''+yrdate+''','''+yrdate+''','''+flag+''',''''),   ');
    SQL.Add('       '''' field2, '''' field3,'''' field4,'''' field5 from dual                          ');
    //memo1.text := sql.text;
    Open;

    if(RecordCount > 0) then
         result := FieldByName('field1').AsFloat
    else result := 0.0;
  end;
end;

function TFM_yearly_move.PL_Input_Check : Boolean;
var
    i,j,ColonPos   : Integer;
    yearlycnt : double;
    temp_dutycode : string;
begin
  result := false;

  j := 0;

  YR_Regdate1 := '';
  YR_Regdate2 := '';
  YR_Moddate1 := '';
  YR_Moddate2 := '';

  YR_RegCnt1 := 0;
  YR_RegCnt2 := 0;
  YR_ModCnt1 := 0;
  YR_ModCnt2 := 0;

  yearlycnt := 0;
  for i := 1 to Grid2.RowCount-1 do
  begin
      if(Grid2.Cells[0, i]='Y')and(trim(Grid2.Cells[1, i])<>'') then
      begin
        j := j + 1;

             if(trim(Grid2.Cells[2, i]) = HOLIYEAR) then yearlycnt := yearlycnt + 1
        else if(trim(Grid2.Cells[2, i]) = YEARHALF) then yearlycnt := yearlycnt + 0.5;

             if j = 1 then YR_Regdate1 := trim(Grid2.Cells[1, i])
        else if j = 2 then YR_Regdate2 := trim(Grid2.Cells[1, i]);

      end;
  end;

  if( Grid2.RowCount <= 1 ) or ( yearlycnt <= 0 ) then
  begin
      MessageDlg('선택한 자료가 없습니다.', mtError, [mbOk], 0);
      exit;
  end;

  if( yearlycnt > 1 ) then
  begin
    MessageDlg('연차이동은 1일 단위로 이동 가능합니다.'+#13#10 +
                '등록연차를 다시 선택해 주시기 바랍니다.', mtInformation,[mbOk], 0);
    exit;
  end;

  temp_dutycode := e_dutycode.Items[e_dutycode.ItemIndex];

  ColonPos := AnsiPos( ':', temp_dutycode );
  YR_DutyCode := trim(copy( temp_dutycode, 1, ColonPos - 1 ));
  YR_Moddate1 := trim(RemoveChar(e_Moddate1.Text,'-'));
  YR_Moddate2 := trim(RemoveChar(e_Moddate2.Text,'-'));

  if not((YR_DutyCode = HOLIYEAR) or (YR_DutyCode = YEARHALF)) then
  begin
    MessageDlg('선택한 연차코드가 없습니다.', mtInformation,[mbOk], 0);
    e_dutycode.SetFocus;
    Exit;
  end;

  if  not ( Check_DateValid(YR_Regdate1))  then
  begin
       MessageDlg('등록연차일이 유효 하지 않거나 휴가계획등록 마감된 날짜입니다.'+#13#10 +
                  '기준년도에 해당되는 날짜만 선택할 수 있습니다.'+#13#10 +
                  '[등록연차조회]를 클릭하여 등록연차를 조회한 후 작업하시기 바랍니다.', mtInformation,[mbOk], 0);
       Grid2.SetFocus;
       Exit;
  end;

  if(YR_Regdate2<>'') then
  begin
    if  not ( Check_DateValid(YR_Regdate2))  then
    begin
       MessageDlg('등록연차일이 유효 하지 않거나 휴가계획등록 마감된 날짜입니다.'+#13#10 +
                  '기준년도에 해당되는 날짜만 선택할 수 있습니다.'+#13#10 +
                  '[등록연차조회]를 클릭하여 등록연차를 조회한 후 작업하시기 바랍니다.', mtInformation,[mbOk], 0);
         Grid2.SetFocus;
         Exit;
    end;
  end;


  if  not ( Check_DateValid(YR_Moddate1))  then
  begin
       MessageDlg('이동일1가(이) 유효 하지 않거나 휴가계획등록 마감된 날짜입니다.'+#13#10 +
                  '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
       e_Moddate1.SetFocus;
       Exit;
  end;

  if ((YR_Moddate2<>'')and(YR_DutyCode = YEARHALF)) then
  begin
    if  not ( Check_DateValid(YR_Moddate2))  then
    begin
       MessageDlg('이동일2가(이) 유효 하지 않거나 휴가계획등록 마감된 날짜입니다.'+#13#10 +
                  '기준년도에 해당되는 날짜만 입력할 수 있습니다.', mtInformation,[mbOk], 0);
         e_Moddate2.SetFocus;
         Exit;
    end;
  end;

  if((YR_Regdate1<>'')and(YR_Regdate1=YR_Regdate2)) then
  begin
    YR_Regdate2 := '';
  end;

  if((YR_Moddate1<>'')and(YR_Moddate1=YR_Moddate2)) then
  begin
    MessageDlg('이동일1과 이동일2가 동일합니다.'+#13#10 +
               '이동일2를 다른 날짜로 변경해 주시기 바랍니다.', mtInformation,[mbOk], 0);
    e_Moddate2.SetFocus;
    Exit;
  end;

  if(YR_Regdate1<>'') then YR_RegCnt1 := PL_Get_Duty_Cnt(YR_Empno, YR_Regdate1, '1');
  if(YR_Regdate2<>'') then YR_RegCnt2 := PL_Get_Duty_Cnt(YR_Empno, YR_Regdate2, '1');
  if(YR_Moddate1<>'') then YR_ModCnt1 := PL_Get_Duty_Cnt(YR_Empno, YR_Moddate1, '2');
  if(YR_Moddate2<>'') then YR_ModCnt2 := PL_Get_Duty_Cnt(YR_Empno, YR_Moddate2, '2');

  if(YR_Regdate1<>'') and (YR_Regdate1= YR_Moddate1) then YR_ModCnt1 := 1;

  if(YR_Regdate1<>'') and (YR_Regdate1= YR_Moddate2) then YR_ModCnt2 := 1;

  if(YR_Regdate2<>'') and (YR_Regdate2= YR_Moddate1) then YR_ModCnt1 := 1;

  if(YR_Regdate2<>'') and (YR_Regdate2= YR_Moddate2) then YR_ModCnt2 := 1;

  if (YR_DutyCode = YEARHALF) then
  begin
    YR_ModCnt1 := YR_ModCnt1 / 2;
    YR_ModCnt2 := YR_ModCnt2 / 2;
  end;

  if(YR_RegCnt1 + YR_RegCnt2)<>(YR_ModCnt1 + YR_ModCnt2) then
  begin
    if(YR_Moddate1<>'')and(YR_ModCnt1<=0) then
    begin
      MessageDlg('등록연차일수와 이동연차일수가 동일하지 않습니다.'+#13#10 +
                 '이동일1가(이) 휴일이거나 다른 휴가가 등록되었을 경우 이동일이 정상적으로 계산되지 않습니다.'+#13#10 +
                 '등록된 휴가코드를 확인후 이동하시기 바랍니다.', mtInformation,[mbOk], 0);
      e_Moddate1.SetFocus;
      Exit;
    end;

    if(YR_Moddate2<>'')and(YR_ModCnt2<=0) then
    begin
      MessageDlg('등록연차일수와 이동연차일수가 동일하지 않습니다.'+#13#10 +
                 '이동일2가(이) 휴일이거나 다른 휴가가 등록되었을 경우 이동일이 정상적으로 계산되지 않습니다.'+#13#10 +
                 '등록된 휴가코드를 확인후 이동하시기 바랍니다.', mtInformation,[mbOk], 0);
      e_Moddate2.SetFocus;
      Exit;
    end;
    
    MessageDlg('등록연차일수와 이동연차일수가 동일하지 않습니다.'+#13#10 +
               '등록일이 휴일이거나 다른 휴가로 변경되었을 경우 이동일이 정상적으로 계산되지 않습니다.'+#13#10 +
               '등록연차일이 다른 경우 [등록연차조회]를 클릭하여 등록연차를 다시 조회한 후 작업하시기 바랍니다.', mtInformation,[mbOk], 0);
    grid2.SetFocus;
    Exit;
  end;
  result := true;
end;

function TFM_yearly_move.Insert_Yearly_ModHis : boolean;
begin
  result := false;

  with QR_dml do 
  begin
    ServiceName := 'PKA4040A_dml';
    Close;
    Sql.Clear ;

    Sql.Add(' INSERT INTO PKYEARLYMODIFY(APPDATE, EMPNO, KORNAME,MOD_FLAG,                                    ');
    Sql.Add('                            REGFRDATE, REGTODATE, REGYEARLY_CNT,                                 ');
    Sql.Add('                            REGFRDATE2, REGTODATE2, REGYEARLY_CNT2,                              ');
    Sql.Add('                            MODFRDATE, MODTODATE, MODYEARLY_CNT,                                 ');
    Sql.Add('                            MODFRDATE2, MODTODATE2, MODYEARLY_CNT2,                              ');
    Sql.Add('                            DUTYCODE, EEMPNO, CON_YN, WRITEEMPNO, WRITETIME)                     ');
    Sql.Add(' VALUES                                                                                          ');
    Sql.Add('       (to_char(sysdate,''YYYYMMDDHH24MISS''),    '''+ YR_empno+''', '''+YR_korname+''', ''M'',  ');
    Sql.Add('        ''' + YR_Regdate1     + ''',                                                             ');
    Sql.Add('        ''' + YR_Regdate1     + ''',                                                             ');
    Sql.Add('        ''' + floattostr(YR_RegCnt1) + ''',                                                      ');
    Sql.Add('        ''' + YR_Regdate2     + ''',                                                             ');
    Sql.Add('        ''' + YR_Regdate2     + ''',                                                             ');
    Sql.Add('        ''' + floattostr(YR_RegCnt2) + ''',                                                      ');
    Sql.Add('        ''' + YR_Moddate1     + ''',                                                             ');
    Sql.Add('        ''' + YR_Moddate1     + ''',                                                             ');
    Sql.Add('        ''' + floattostr(YR_ModCnt1) + ''',                                                      ');
    Sql.Add('        ''' + YR_Moddate2     + ''',                                                             ');
    Sql.Add('        ''' + YR_Moddate2     + ''',                                                             ');
    Sql.Add('        ''' + floattostr(YR_ModCnt2) + ''',                                                      ');
    Sql.Add('        ''' + YR_DutyCode  + ''','''',''Y'',                                                     ');
    Sql.Add('        ''' + FM_Main.FG_empno+''', to_char(sysdate,''YYYYMMDDHH24MISS''))                       ');

    //memo1.text := sql.text;

    try
      Execute
    except
      Application.MessageBox('연차휴가 이동신청이 실패했습니다.','작업실패',MB_OK);
      Exit;
    end;
  end;
  result := true;
end;


procedure TFM_yearly_move.bt_moveClick(Sender: TObject);
var
  update_list, insert_list, column_list :string;
begin
  if MessageBox(HANDLE,'연차이동을 실행 하시겠습니까?','저장확인',MB_YESNO) <> IDYES then system.exit;

  //2016.09.23.hjku.. 휴가계획등록 마감된 자료 확인 추가
  FM_Main.FG_Mendyn := FM_Main.PL_Month_endyn(FM_Main.FG_yy+FM_Main.FG_Month,FM_Main.ED_empno.empno);

  if not PL_Input_Check() then system.exit;

  if not Insert_Yearly_ModHis() then system.exit;

  if not Make_Query(YR_empno,YR_Regdate1,'', '1', update_list, insert_list, column_list) then
  begin
    MessageDlg('등록연차일을 확인해 보시기 바랍니다... 저장실패1!!', mtInformation, [mbok], 0) ;
    exit;
  end;

  if not Update_Query(YR_empno,YR_Regdate1, '1', update_list, insert_list, column_list) then
  begin
    MessageDlg('연차이동일 반영 오류... 저장실패1-1!!', mtInformation, [mbok], 0) ;
    exit;
  end;

  if(YR_Regdate2<>'') then
  begin
    if not Make_Query(YR_empno,YR_Regdate2,'', '1', update_list, insert_list, column_list) then
    begin
      MessageDlg('등록연차일을 확인해 보시기 바랍니다... 저장실패2!!', mtInformation, [mbok], 0) ;
      exit;
    end;
    if not Update_Query(YR_empno,YR_Regdate2, '1', update_list, insert_list, column_list) then
    begin
      MessageDlg('연차이동일 반영 오류... 저장실패1-2!!', mtInformation, [mbok], 0) ;
      exit;
    end;
  end;

  if not Make_Query(YR_empno,YR_Moddate1,  YR_dutycode, '2', update_list,  insert_list,  column_list)
  then
  begin
    MessageDlg('이동연차일을 확인해 보시기 바랍니다... 저장실패1!!', mtInformation, [mbok], 0) ;
    exit;
  end;

  if not Update_Query(YR_empno,YR_Moddate1, '2', update_list, insert_list, column_list) then
  begin
    MessageDlg('연차이동일 반영 오류... 저장실패2-1!!', mtInformation, [mbok], 0) ;
    exit;
  end;

  if(YR_Moddate2<>'') then
  begin
    if not Make_Query(YR_empno,YR_Moddate2,YR_dutycode, '2', update_list, insert_list, column_list) then
    begin
      MessageDlg('이동연차일을 확인해 보시기 바랍니다... 저장실패2!!', mtInformation, [mbok], 0) ;
      exit;
    end;
    if not Update_Query(YR_empno,YR_Moddate2, '2', update_list, insert_list, column_list) then
    begin
      MessageDlg('연차이동일 반영 오류... 저장실패2-2!!', mtInformation, [mbok], 0) ;
      exit;
    end;
  end;

  PL_InitYearly;
end;


function TFM_yearly_move.Make_Query(v_empno,dutydate,dutycode, flag : string; out update_list, insert_list, column_list :string):boolean;
var
 i,j,dd : integer;
 holi_insert_list, holi_column_list : String;
begin
  //flag 1: 연차, 2:평일 조회
  result := false;

  update_list      := '';
  insert_list      := '';
  column_list      := '';
  holi_insert_list := '';
  holi_column_list := '';

  dd := strtoint(copy(dutydate,7,2));

  if(flag='1') then
  begin
    update_list := update_list + 'DD'+inttostr(dd)+' = ''00'', ';
    insert_list := insert_list + ' ''00'', ';
    column_list := column_list + 'DD'+inttostr(dd)+', ';
  end
  else if(flag='2') then
  begin
    update_list := update_list + 'DD'+inttostr(dd)+' = '''+dutycode+''', ';
    insert_list := insert_list + ' '''+dutycode+''', ';
    column_list := column_list + 'DD'+inttostr(dd)+', ';
  end;

  // insert시 휴일정보가 반영되도록
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

    SQL.ADD('    SELECT A.YYYYMMDD,                                                                                       ');
    SQL.ADD('           (CASE WHEN A.DAYCODE IN (''1'',''7'') OR B.HOLIDATE IS NOT NULL                                    ');
    SQL.ADD('                 THEN ''49''                                                                                  ');
    SQL.ADD('                 ELSE ''00'' END) dutycode,                                                                   ');
    SQL.ADD('    ''field3'', ''field4'', ''field5''                                                                        ');
    SQL.ADD('      FROM PKHCALDAYS A,                                                                                      ');
    SQL.ADD('           PKCHOLI B                                                                                          ');
    SQL.ADD('     WHERE A.YYYYMMDD = B.HOLIDATE(+)                                                                         ');
    SQL.ADD('       AND A.YYYYMM   = ''' + copy(dutydate,1,6) +'''                                                         ');

    Open;

    QR_com.First;

    if(QR_com.RecordCount > 0) then
    begin
      for i := 1 to QR_com.RecordCount do
      begin
        j := strtoint(copy(QR_com.FieldbyName('field1').AsString,7,2));

        if(j=dd) then
        begin
          QR_com.Next;
          continue;
        end;

        holi_insert_list := holi_insert_list + ' '''+QR_com.FieldbyName('field2').AsString+''', ';
        holi_column_list := holi_column_list + 'DD'+inttostr(j)+', ';

        QR_com.Next;
      end;
    end;
    insert_list := insert_list + holi_insert_list;
    column_list := column_list + holi_column_list;

  end;

  result := true;
end;

function TFM_yearly_move.Update_Query(v_empno,dutydate, flag, update_list, insert_list, column_list :string):boolean;
begin
  result := false;

  with QR_dml do
  begin
    ServiceName := 'PKA4040A_dml';
    Close;
    Sql.Clear ;

    Sql.Add ('MERGE INTO PKHDUTY P                                                                                                                   ');
    Sql.Add ('      USING (SELECT '''+copy(dutydate,1,6)+''' DUYYMM, EMPNO, ORGNUM, DEPTCODE, KORNAME FROM PIMPMAS WHERE EMPNO ='''+YR_Empno+''') V1 ');
    Sql.Add ('         ON  (P.DUYYMM = V1.DUYYMM AND P.EMPNO = V1.EMPNO)                                                                             ');
    Sql.Add ('       WHEN MATCHED THEN                                                                                                               ');
    Sql.Add ('            UPDATE SET                                                                                                                ');
    Sql.Add (update_list                                                                                                                              );
    Sql.Add ('                   WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),                                                                  ');
    Sql.Add ('                   WRITEMAN  = '''+FM_Main.FG_empno+'''                                                                                ');
    Sql.Add ('       WHEN NOT MATCHED THEN                                                                                                           ');
    Sql.Add ('            INSERT( p.DUYYMM, p.EMPNO, p.KORNAME ,p.ORGNUM, p.DEPTCODE, '+column_list+' WRITETIME, WRITEMAN)                           ');
    Sql.Add ('            VALUES(V1.DUYYMM,V1.EMPNO,V1.KORNAME,V1.ORGNUM,V1.DEPTCODE, '+insert_list+'TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),'''+FM_Main.FG_empno+''')         ');

    //memo2.Text := sql.Text;

    try
      Execute
    except
      Application.MessageBox('연차휴가 이동신청이 실패했습니다.','작업실패2',MB_OK);
      Exit;
    end;
  end;

  result := true;
end;

procedure TFM_yearly_move.e_Moddate1ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        e_Moddate1.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);

    Finally
        calendar.Free;
    End;
end;

procedure TFM_yearly_move.e_Moddate2ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    Try
        calendar := Tcalendar.Create(Self);
        calendar.ShowModal;
        e_Moddate2.Text := Copy(calendar.DayCaption,1,4)+'-'+Copy(calendar.DayCaption,5,2) +'-'+Copy(calendar.DayCaption,7,2);

    Finally
        calendar.Free;
    End;
end;

procedure TFM_yearly_move.bt_searchClick(Sender: TObject);
begin
  PL_InitYearly;
end;

end.
