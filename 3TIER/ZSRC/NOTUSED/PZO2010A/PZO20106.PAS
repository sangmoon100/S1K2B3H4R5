unit PZO20106;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnFocusButton, ComCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnShapeLabel, Db, MemDS, DBAccess, Ora, Datelib,
  Grids, Comobj, OnScheme, Tmax_DataSetText, func;

type
  TFM_Batch = class(TForm)
    OpenDialog1: TOpenDialog;
    P_helpinfo: TStatusBar;
    Panel2: TPanel;
    BT_Delete: TOnFocusButton;
    BT_exit: TOnFocusButton;
    BT_Upload: TOnFocusButton;
    BT_Insert: TOnFocusButton;
    Bt_Down: TOnFocusButton;
    cbx_down: TComboBox;
    StringGrid1: TStringGrid;
    ErrorPanel: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    Memo1: TMemo;
    BT_ErrorClose: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    TDS1: TTMaxDataSet;
    P_Help: TPanel;
    Shape1: TShape;
    OnShapeLabel2: TOnShapeLabel;
    BT_HelpClose: TOnFocusButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BT_help: TOnFocusButton;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_UploadClick(Sender: TObject);
    procedure BT_InsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ErrorCloseClick(Sender: TObject);
    procedure BT_HelpCloseClick(Sender: TObject);
    procedure Bt_DownClick(Sender: TObject);
    procedure BT_helpClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

  private
    LastEmpno : String;
    { Private declarations }
    gsJuminMsg : String;

  public
    { Public declarations }
    procedure StringGrid_Clear;

  end;

var
  FM_Batch: TFM_Batch;

implementation

uses PZO20101;

{$R *.DFM}     


procedure TFM_Batch.StringGrid_Clear;
var
  i : integer;
begin
  StringGrid1.ColCount    := 13;
  StringGrid1.RowCount    := 2;
  StringGrid1.Cells[ 0,0] := '성명'          ;
  StringGrid1.Cells[ 1,0] := '소속회사코드'  ;
  StringGrid1.Cells[ 2,0] := '생년월일'      ;
  StringGrid1.Cells[ 3,0] := '성별'          ;
  StringGrid1.Cells[ 4,0] := '관리부서코드'  ;
  StringGrid1.Cells[ 5,0] := '담당매니저사번';
  StringGrid1.Cells[ 6,0] := '일반전화'      ;
  StringGrid1.Cells[ 7,0] := '핸드폰'        ;
  StringGrid1.Cells[ 8,0] := '이메일'        ;
  StringGrid1.Cells[ 9,0] := '근무지명'      ;
  StringGrid1.Cells[10,0] := '투입시작일'    ;
  StringGrid1.Cells[11,0] := '투입종료일'    ;
  StringGrid1.Cells[12,0] := '현장대리인여부';

  for i := 0 to 12 do
       StringGrid1.Cells[i,1] := '';

end;



procedure TFM_Batch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FM_Main.FL_OPstate := 0;
  Action := CaFree;
end;

procedure TFM_Batch.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Batch.BT_UploadClick(Sender: TObject);
var
  v           : Variant ;
  iRow, iCol  : integer ;
  CNT, Sg_RCnt, work : integer;
  tmp_korname, tmp_birthdate, tmp_sex : String;
begin
  Work              := 0;
  Memo1.Clear;
  StringGrid_Clear;
  BT_Insert.Enabled := False;
  BT_Delete.Enabled := False;
  LastEmpno := '0000';

  Case MessageDlg('일괄등록할 데이터 업로드이면 Yes를 선택하세요.', mtConfirmation, [mbYes, mbCancel], 0) of
       mrYes : Work := 1;
  else
       System.Exit;
  end;

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

  if Work = 1 then
  begin
       Memo1.Lines.Text := '';
       StringGrid1.ColCount := 13;
       StringGrid1.RowCount := cnt;
       For iRow := 2 to cnt do
       begin
            tmp_korname   := '';
            tmp_birthdate := '';
            tmp_sex       := '';
            
            For iCol := 1 to StringGrid1.ColCount do
            begin
                 Case iCol of
                      1: begin
                              if Trim(v.cells[iRow, iCol]) = '' then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 사원성명없음')
                              else tmp_korname := Trim(v.cells[iRow, iCol]);
                         end;
                      2: begin
                              if not FM_Main.IsValidComCode(UpperCase(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 동일회사코드없음');
                         end;
                      3: begin
                              if not DateCheck(v.cells[iRow, iCol]) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 생년월일오류')
                              else tmp_birthdate := trim(v.cells[iRow, iCol]);

                         end;
                      4: begin
                              if not FM_Main.IsValidSex(v.cells[iRow, iCol]) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 성별오류')
                              else tmp_sex := trim(v.cells[iRow, iCol]);

                              if(tmp_korname<>'') and (tmp_birthdate<>'') and (tmp_sex<>'') then
                              begin
                                  if FM_Main.CheckEmpnoDup(tmp_korname,tmp_birthdate,tmp_sex) then
                                  begin
                                      Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                      Trim(v.cells[iRow, 1])+', '+
                                                      Trim(v.cells[iRow, 3])+', '+
                                                      Trim(v.cells[iRow, 4])+' - 성명,생년월일,성별 중복오류')
                                  end;
                              end;

                         end;
                      5: begin
                              if not FM_Main.IsValidDeptCode(UpperCase(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 관리부서코드오류');

                         end;
                      6: begin
                              if not FM_Main.IsValidEmpno(UpperCase(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 담당매니저사번오류');

                         end;
                      7: begin
                              if not FM_Main.IsValidPhoneNo(v.cells[iRow, iCol]) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 일반전화오류');

                         end;
                      8: begin
                              if not FM_Main.IsValidPhoneNo(v.cells[iRow, iCol]) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 핸드폰오류');

                         end;
                      9: begin
                              if not FM_Main.IsValidEmail(v.cells[iRow, iCol]) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 이메일오류');

                         end;
                     10: begin
                              if not FM_Main.IsValidJobplace(Trim(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 근무지명오류');

                         end;
                     11: begin
                              if not FM_Main.IsValidStartDate(FM_Main.RemoveSpecialChar(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 투입시작일오류');

                         end;
                     12: begin
                              if not FM_Main.IsValidEndDate(v.cells[iRow, iCol-1],v.cells[iRow, iCol]) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 투입종료일오류');

                         end;
                     13: begin
                              if Trim(v.cells[iRow, iCol]) = '' then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1])+', '+
                                                   Trim(v.cells[iRow, 2])+' - 현장대리인여부없음');

                         end;
                 end;

                 if Memo1.Lines.text = '' then
                 begin
                     StringGrid1.Cells[iCol-1, iRow -1] := v.cells[iRow, iCol];
                 end;
            end; //For iCol := 1 to StringGrid1.ColCount - 1 do
       end; //For iRow := 2 to cnt do
  end;

  v.WorkBooks.Close;
  v.quit ;
  v:=unassigned;

  if Memo1.Lines.Text <> '' then
  begin
       Memo1.Lines.Add('==================================     ');
       Memo1.Lines.Add('상기 오류 내역 수정후 재작업 요망.     ');
       Memo1.Lines.Add('==================================     ');
       Memo1.Lines.Add('중복된 성명, 생년월일, 성별에 대해     ');
       Memo1.Lines.Add('재직중인 동일 사원이 존재할 경우 해당 사원 검색후  ');
       Memo1.Lines.Add('해당 사번으로 사용해 주시기 바라며,    ');
       Memo1.Lines.Add('중복 등록이 불가피 할 경우             ');
       Memo1.Lines.Add(' IT기획보안팀 윤진석M로 문의바랍니다.  ');

       StringGrid_Clear;
       ErrorPanel.Visible := True;
       P_Help.Visible     := True;
       System.Exit;
  end;

  ErrorPanel.Visible := false;
  P_helpinfo.SimpleText := ('총 ' + IntTostr(Cnt -1) + ' 건의 엑셀파일 로드가 완료 되었습니다.');

  if (Cnt - 1) <> 0 then
  begin
       if   work = 1 then BT_Insert.Enabled := True
       else               BT_Delete.Enabled := True;
  end
  else
  begin
       BT_Insert.Enabled := False;
       BT_Delete.Enabled := False;
  end;
end;

procedure TFM_Batch.BT_InsertClick(Sender: TObject);
var
  MRow, Cnt : integer ;
  ret_val : boolean;
begin
  Cnt := 0;

  if MessageDlg('일괄등록작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
       Memo1.Clear;

       For MRow := 1 to StringGrid1.RowCount -1 do
       begin
           with fm_main do
           begin
               p_empno       := AutoEmpno;
               p_korname     := trim(StringGrid1.Cells[ 0, MRow]);
               p_comcode     := trim(UpperCase (StringGrid1.Cells[ 1, MRow]));
               p_birthdate   := trim(removechar(StringGrid1.Cells[ 2, MRow],'-'));
               p_sex         := trim(StringGrid1.Cells[ 3, MRow]);
               p_orgnum      := GSorgnum;
               p_deptcode    := trim(UpperCase(StringGrid1.Cells[ 4, MRow]));
               p_managerid   := trim(UpperCase(StringGrid1.Cells[ 5, MRow]));
               p_telno       := removechar(StringGrid1.Cells[ 6, MRow],' ');
               p_cellno      := removechar(StringGrid1.Cells[ 7, MRow],' ');
               p_email       := trim(StringGrid1.Cells[ 8, MRow]);
               p_jobplacenm  := trim(RemoveSpecialChar(StringGrid1.Cells[ 9, MRow]));
               //p_jobplacenm  := trim(StringGrid1.Cells[ 9, MRow]);
               p_regman      := GSempno;
               p_regdate     := Copy(FG_Date,1,8);
               p_startdate   := trim(removechar(StringGrid1.Cells[10, MRow],'-'));
               p_enddate     := trim(removechar(StringGrid1.Cells[11, MRow],'-'));
               p_fieldrepyn  := trim(StringGrid1.Cells[12, MRow]);
               p_stateyn     := 'Y';
               p_writeman    := GSempno;

               if(trim(p_empno)='') then
               begin
                   self.Memo1.Lines.Add(IntToStr(MRow)+','+
                                   Trim(p_korname)+','+
                                   Trim(p_comcode)+','+
                                   Trim(p_birthdate)+'-사번 생성 오류');
               end
               else
               begin
                   ret_val := InsertPzmoutmas;

                   if(ret_val) then Cnt := Cnt + 1
                   else
                   begin
                       self.Memo1.Lines.Add(IntToStr(MRow)+','+
                                       Trim(p_korname)+','+
                                       Trim(p_comcode)+','+
                                       Trim(p_birthdate)+'-저장 오류');
                   end;
               end;
           end;

       end;  //Row For End

       if Memo1.Lines.Text <> '' then
       begin
            Memo1.Lines.Add('==================================');
            Memo1.Lines.Add('상기 오류 대상자에 대해 수정후 재작업 요망.');
            StringGrid_Clear;
            ErrorPanel.Visible := True;
            P_Help.Visible := True;
       end;

       StringGrid1.ColCount := 3;
       BT_Insert.Enabled    := False;
       MessageDlg('총 ' + IntTostr(Cnt) + '건의 데이터 저장완료.', mtInformation,[mbOK],0);
  end;
end;

procedure TFM_Batch.FormShow(Sender: TObject);
begin
  StringGrid_Clear;
  cbx_down.ItemIndex := 0;
  fm_main.FL_OPstate := 1;
end;

procedure TFM_Batch.BT_ErrorCloseClick(Sender: TObject);
begin
  ErrorPanel.Visible := False;
end;

procedure TFM_Batch.BT_HelpCloseClick(Sender: TObject);
begin
    P_Help.Visible     := False;
end;

procedure TFM_Batch.Bt_DownClick(Sender: TObject);
var
  XL, XArr: Variant;
  i,j,k: integer;
  SavePlace: TBookmark;
begin
  P_helpinfo.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 13], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       P_helpinfo.SimpleText := '';
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  if cbx_down.ItemIndex = 0 then
  begin
       //컬럼명 지정_서브타이블 지정
       XArr[ 1]  := '성명'          ;
       XArr[ 2]  := '소속회사코드'  ;
       XArr[ 3]  := '생년월일(ex.19880808)'      ;
       XArr[ 4]  := '성별(남/여)'          ;
       XArr[ 5]  := '관리부서코드'  ;
       XArr[ 6]  := '담당매니저사번';
       XArr[ 7]  := '일반전화(ex.02-1234-1234)'      ;
       XArr[ 8]  := '핸드폰(ex.010-1234-1234)'        ;
       XArr[ 9]  := '이메일(ex.ab12@abc.com)'        ;
       XArr[10]  := '근무지명(ex.저동)'      ;
       XArr[11]  := '투입시작일(ex.20150105)'    ;
       XArr[12]  := '투입종료일(ex.20160104)'    ;
       XArr[13]  := '현장대리인여부(N/Y)';

       XL.Range['A1', 'M1'].Value := XArr;
       XL.Range['A1', 'M1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'M1'].Interior.Color:= $00CBF0B3;
  end
  else
  begin
       //컬럼명 지정_서브타이블 지정
       XArr[1]  := '사원번호';
       XArr[2]  := '사원성명';
       //XArr[1]  := '회사코드';

       XL.Range['A1', 'B1'].Value := XArr;
       XL.Range['A1', 'B1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'B1'].Interior.Color:= $00CBF0B3;
  end;
  XL.Visible := true;                 //엑셀자료 보여줌
  P_helpinfo.SimpleText := '';
end;

procedure TFM_Batch.BT_helpClick(Sender: TObject);
begin
    P_Help.Visible := true;
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


