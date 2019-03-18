unit PKA40503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnFocusButton, ComCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnShapeLabel, Db, MemDS, DBAccess, Ora, Datelib,
  Grids, Comobj, OnScheme, Tmax_DataSetText, func, Buttons, OnLineLabel, FormMon1,
  OnEditCombo;

type
  TFM_Batch = class(TForm)
    OpenDialog1: TOpenDialog;
    P_helpinfo: TStatusBar;
    Panel2: TPanel;
    BT_exit: TOnFocusButton;
    BT_Upload: TOnFocusButton;
    BT_Insert: TOnFocusButton;
    Bt_Down: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    ErrorPanel: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    Memo1: TMemo;
    BT_ErrorClose: TOnFocusButton;
    Lempno: TLabel;
    Lsysdate: TLabel;
    OnSectionLabel2: TOnSectionLabel;
    Shape4: TShape;
    Shape1: TShape;
    OnSectionLabel3: TOnSectionLabel;
    StringGrid1: TStringGrid;
    ED_year: TOnComboEdit;
    OraQuery: TOraQuery;
    tmp_oraqry: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_UploadClick(Sender: TObject);
    procedure BT_InsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_DownClick(Sender: TObject);
    procedure BT_ErrorCloseClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

  private
    { Private declarations }


  public
    { Public declarations }
    procedure StringGrid_Clear;
  end;

var
  FM_Batch: TFM_Batch;

implementation

uses PKA40501;

{$R *.DFM}


procedure TFM_Batch.FormShow(Sender: TObject);
var
    FL_Date  : string;
    FL_IDate : integer;
begin
    Lempno.Caption   := PKorname + '(' + Pempno+')';
    Lsysdate.Caption :=  fn_GetDateStr;

    FL_Date    := copy(fn_GetDateStr,1,4);

    if not IsNumber(FL_Date) then
      System.Exit;

    FL_IDate := strtoint(FL_Date);
    ED_year.Items.Clear;
    ED_year.KeyItems.Clear;
    ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');
    ED_year.Items.Add(FL_Date+' 년');
    ED_year.Items.Add(IntToStr(FL_IDate+1)+' 년');
    ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
    ED_year.KeyItems.Add(FL_Date);
    ED_year.KeyItems.Add(IntToStr(FL_IDate+1));
    ED_year.Text := MainForm.GSYear;

  StringGrid_Clear;
end;

procedure TFM_Batch.StringGrid_Clear;
var
  i : integer;
begin
  StringGrid1.ColCount    := 7;
  StringGrid1.RowCount    := 2;
  StringGrid1.Cells[ 0,0] := '사번' ;
  StringGrid1.Cells[ 1,0] := '성명';
  StringGrid1.Cells[ 2,0] := '금년 발생연차일수' ;
  StringGrid1.Cells[ 3,0] := '전년 사용연차일수' ;
  StringGrid1.Cells[ 4,0] := '익년 선사용연차일수' ;
  StringGrid1.Cells[ 5,0] := '금년 사용가능연차일수' ;
  StringGrid1.Cells[ 6,0] := '금년 사용목표' ;

  for i := 0 to 6 do
       StringGrid1.Cells[i,1] := '';
end;

procedure TFM_Batch.BT_UploadClick(Sender: TObject);
var
  v           : Variant ;
  iRow, iCol  : integer ;
  CNT, Sg_RCnt: integer;
  temp_used_cnt : real;
  temp_empno, temp_year : String;
  temp_tot_yearly_cnt, temp_pre_used_cnt, temp_next_yearly_cnt : string;
  temp_yearly_cnt, temp_yearlyplan_cnt : string;
begin
    Memo1.Clear;
    StringGrid_Clear;
    BT_Insert.Enabled := False;

  try
       v:= CreateOleObject('Excel.application');
  except
       ShowMessage('Excel이 설치되어 있어야 합니다.');
       Exit;
  end;

  if OpenDialog1.Execute then
  begin
       v.WorkBooks.open(OpenDialog1.FileName);
  end
  else Exit;

  cnt  := strToint(v.ActiveSheet.UsedRange.Rows.Count);

  StringGrid1.ColCount := 7;
  StringGrid1.RowCount := cnt;

  temp_year := MainForm.GSYear;

  For iRow := 2 to cnt do
  begin
      P_helpinfo.SimpleText := inttostr(iRow-1)+'/' + inttostr(cnt-1) + '을 업로드 중입니다.';
      temp_empno           := '';
      temp_tot_yearly_cnt  := '';
      temp_pre_used_cnt    := '';
      temp_next_yearly_cnt := '';
      temp_yearly_cnt      := '';
      temp_yearlyplan_cnt  := '';
      temp_used_cnt        := 0;

      For iCol := 1 to StringGrid1.ColCount do
      begin
          Case iCol of
               1: begin
                    temp_empno := (v.cells[iRow, iCol]);

                    if Trim(v.cells[iRow, iCol]) = '' then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 사원번호오류')
                    else if not MainForm.IsValidEmpno(v.cells[iRow, iCol]) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 사원번호오류');
                  end; 
               3: begin
                    if(trim(v.cells[iRow, iCol])='') then v.cells[iRow, iCol] := '0';

                    temp_tot_yearly_cnt := (v.cells[iRow, iCol]);

                    if not MainForm.IsFloat(temp_tot_yearly_cnt) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 발생연차일수 오류')
                    else if(strtofloat(temp_tot_yearly_cnt) > 25) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 발생연차일수 초과 오류')
                    else if(strtofloat(temp_tot_yearly_cnt) <0 ) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 발생연차일수 오류');
                  end;
               4: begin
                    if(trim(v.cells[iRow, iCol])='') then v.cells[iRow, iCol] := '0';

                    temp_pre_used_cnt := (v.cells[iRow, iCol]);

                    if not MainForm.IsFloat(temp_pre_used_cnt) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 전년 사용연차일수 오류')
                    else if(strtofloat(temp_pre_used_cnt) > 25) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 전년 사용연차일수 오류')
                    else if(strtofloat(temp_pre_used_cnt) <0 ) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 전년 사용연차일수 오류')
                                         ;
                  end;
               //2017.03.06.hjku.. 익년 선사용연차일수 추가.. 김진호M 요청
               5: begin
                    if(trim(v.cells[iRow, iCol])='') then v.cells[iRow, iCol] := '0';

                    temp_next_yearly_cnt := (v.cells[iRow, iCol]);

                    if not MainForm.IsFloat(temp_next_yearly_cnt) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 익년 선사용연차일수 오류')
                    else if(strtofloat(temp_next_yearly_cnt) > 25) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 익년 선사용연차일수 오류')
                    else if(strtofloat(temp_next_yearly_cnt) <0 ) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 익년 선사용연차일수 오류')
                                         ;
                  end;
               6: begin
                    if(trim(v.cells[iRow, iCol])='') then v.cells[iRow, iCol] := '0';

                    temp_yearly_cnt := (v.cells[iRow, iCol]);

                    if not MainForm.IsFloat(temp_yearly_cnt) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 사용가능연차일수 오류')
                    {2017.03.06.hjku.. 익년 선사용연차 추가로 삭제.. 김진호M 요청
                    else if(strtofloat(temp_yearly_cnt) > 25) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 사용가능연차일수 초과 오류')

                    else if(strtofloat(temp_yearly_cnt) <=0 ) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 사용가능연차일수 오류');
                                         }                                         
                                         ;

                    if ((strtofloat(temp_tot_yearly_cnt)-strtofloat(temp_pre_used_cnt)+strtofloat(temp_next_yearly_cnt)) <> strtofloat(temp_yearly_cnt)) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 사용가능연차일수 검증 오류');

                    temp_used_cnt := MainForm.PL_Get_Duty_Cnt(temp_empno,temp_year + '0101', temp_year + '1231','1');

                    if(temp_used_cnt>0) and
                      (temp_used_cnt>strtofloat(temp_yearly_cnt)) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 사용년차 초과 오류');

                  end;
               7: begin
                    if(trim(v.cells[iRow, iCol])='') then v.cells[iRow, iCol] := '0';

                    temp_yearlyplan_cnt := (v.cells[iRow, iCol]);

                    if not MainForm.IsFloat(temp_yearlyplan_cnt) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 연차사용목표 오류')
                    else if(strtofloat(temp_yearlyplan_cnt) > 25) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 연차사용목표 오류');

                    if(strtofloat(temp_yearlyplan_cnt)>0) and
                      (strtofloat(temp_yearly_cnt)<strtofloat(temp_yearlyplan_cnt)) then
                         Memo1.Lines.Add(inttoStr(iRow)+', '+
                                         Trim(v.cells[iRow, 1])+', '+
                                         Trim(v.cells[iRow, 2])+' - 금년 연차사용목표 초과 오류');
                  end;
          end;

          if Memo1.Lines.text = '' then
          begin
              StringGrid1.Cells[iCol-1, iRow -1] := v.cells[iRow, iCol];
          end;

      end; //For iCol := 1 to StringGrid1.ColCount - 1 do
  end; //For iRow := 2 to cnt do

  v.WorkBooks.Close;
  v.quit ;
  v:= unassigned;

  if Memo1.Lines.Text <> '' then
  begin
      Memo1.Lines.Add('==================================     ');
      Memo1.Lines.Add('상기 오류 내역 수정후 재작업 요망.     ');
      Memo1.Lines.Add('==================================     ');
      Memo1.Lines.Add('표기된 오류내용에 대해 수정후');
      Memo1.Lines.Add('다시 등록해 주시기 바랍니다.');

      StringGrid_Clear;
      ErrorPanel.Visible := True;
      System.Exit;
  end;

  ErrorPanel.Visible := false;
  P_helpinfo.SimpleText := ('총 ' + IntTostr(Cnt -1) + ' 건의 엑셀파일 로드가 완료 되었습니다.');

  if (Cnt - 1) <> 0 then
      BT_Insert.Enabled := True
  else
      BT_Insert.Enabled := False;
end;

procedure TFM_Batch.BT_InsertClick(Sender: TObject);
var
  MRow, Cnt : integer ;
  ret_val : boolean;
begin
    Cnt := 0;

    ErrorPanel.Visible := false;    

    if MessageDlg('일괄등록작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        Memo1.Clear;
        For MRow := 1 to StringGrid1.RowCount -1 do
        begin
            P_helpinfo.SimpleText := inttostr(MRow)+'/' + inttostr(StringGrid1.RowCount-1) + '을 저장 중입니다.';
            MainForm.p_empno            := trim(StringGrid1.Cells[ 0, MRow]);
            MainForm.p_korname          := trim(StringGrid1.Cells[ 1, MRow]);
            MainForm.p_tot_yearly_cnt   := trim(StringGrid1.Cells[ 2, MRow]);
            MainForm.p_pre_used_cnt     := trim(StringGrid1.Cells[ 3, MRow]);
            MainForm.p_next_yearly_cnt  := trim(StringGrid1.Cells[ 4, MRow]);
            MainForm.p_yearly_cnt       := trim(StringGrid1.Cells[ 5, MRow]);
            MainForm.p_yearlyplan_cnt   := trim(StringGrid1.Cells[ 6, MRow]);

            ret_val := MainForm.save_pkyearlt;

            if(ret_val) then Cnt := Cnt + 1
            else
            begin
              self.Memo1.Lines.Add(IntToStr(MRow)+','+
                                   Trim(MainForm.p_empno)+','+
                                   Trim(MainForm.p_korname)+'-저장 오류');
            end;
        end;  //Row For End

        if Memo1.Lines.Text <> '' then
        begin
           Memo1.Lines.Add('===========================================');
           Memo1.Lines.Add('상기 오류 대상자에 대해 수정후 재작업 요망.');
           StringGrid_Clear;
           ErrorPanel.Visible := True;
        end;

        StringGrid1.ColCount := 5;
        BT_Insert.Enabled    := False;
        MessageDlg('총 ' + IntTostr(Cnt) + '건의 데이터 저장완료.', mtInformation,[mbOK],0);
        P_helpinfo.SimpleText := ('총 ' + IntTostr(Cnt -1) + ' 건의 엑셀파일 저장이 완료 되었습니다.');
    end;
end;

procedure TFM_Batch.Bt_DownClick(Sender: TObject);
var
  XL, XArr: Variant;
  i,j,k: integer;
  SavePlace: TBookmark;
begin
  P_helpinfo.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 7], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       P_helpinfo.SimpleText := '';
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '사번';
  XArr[ 2]  := '성명';
  XArr[ 3]  := '금년 발생연차일수(A)(ex)24.5';
  XArr[ 4]  := '전년 사용연차일수(B)(ex)10.0';
  XArr[ 5]  := '익년 선사용연차일수(C)(ex)3.5';
  XArr[ 6]  := '금년 사용가능연차일수(A-B+C)(ex)18.0';
  XArr[ 7]  := '금년 연차사용목표(정수)(ex)10';

  XL.Range['A1', 'G1'].Value := XArr;
  XL.Range['A1', 'G1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'G1'].Interior.Color:= $00CBF0B3;

  XL.Range['A1', 'G1'].font.name := '맑은 고딕';//'굴림체';
  XL.Range['A1', 'G1'].HorizontalAlignment              := 3;  //가운데 정렬
  XL.Range['A1', 'G1'].font.Size           := 9;
  XL.Range['A1', 'G1'].HorizontalAlignment := 1;  //좌측정렬
  XL.Range['A1', 'G1'].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬

  XL.Visible := true;                 //엑셀자료 보여줌
  P_helpinfo.SimpleText := '';
end;



procedure TFM_Batch.BT_ErrorCloseClick(Sender: TObject);
begin
  ErrorPanel.Visible := False;
end;

procedure TFM_Batch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_Batch.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Batch.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   TW , TH : Integer;
begin
  StringGrid1.canvas.fillRect(rect);
  StringGrid1.canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 3, StringGrid1.cells[acol, arow]);

  if (ACol >= 0) then
  begin
    with StringGrid1.Canvas do
    begin
      FillRect(Rect);
      TW := TextWidth(StringGrid1.Cells[ACol , ARow]);
      TH := TextHeight(StringGrid1.Cells[ACol , ARow]);
      TextOut((Rect.Left + Rect.Right - TW) div 2, (Rect.Top + Rect.Bottom - TH) div 2 , StringGrid1.Cells[ ACol , ARow] );
      Exit;
    end;
  end;
end;

end.


