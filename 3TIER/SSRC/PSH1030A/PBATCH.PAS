unit PBATCH;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Grids, OnFocusButton, ExtCtrls, OnShapeLabel, Comobj,  Db,
  Func,
  OnScheme;

type
  TFM_Batch = class(TForm)
    SF_Main: TOnSchemeForm;
    OnSchemeForm1: TOnSchemeForm;
    OnShapeLabel4: TOnShapeLabel;
    Panel2: TPanel;
    BT_Delete: TOnFocusButton;
    BT_exit: TOnFocusButton;
    BT_load: TOnFocusButton;
    BT_Insert: TOnFocusButton;
    Bt_Down: TOnFocusButton;
    cbx_down: TComboBox;
    StringGrid1: TStringGrid;
    ErrorPanel: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    Memo1: TMemo;
    BT_ErrorClose: TOnFocusButton;
    P_Help: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    OnShapeLabel2: TOnShapeLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BT_HelpClose: TOnFocusButton;
    OpenDialog1: TOpenDialog;
    P_helpinfo: TStatusBar;
    procedure BT_loadClick(Sender: TObject);
    procedure Bt_DownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StringGrid_Clear;
  end;

var
  FM_Batch: TFM_Batch;

implementation

{$R *.DFM}


procedure TFM_Batch.StringGrid_Clear;
var
  i : integer;
begin
  StringGrid1.ColCount    := 11;
  StringGrid1.RowCount    := 2;
  StringGrid1.Cells[ 0,0] := '가족명';
  StringGrid1.Cells[ 1,0] := '가족관계코드';
  StringGrid1.Cells[ 2,0] := '가족주민번호';
  StringGrid1.Cells[ 3,0] := '사업자번호';
  StringGrid1.Cells[ 4,0] := '상호';
  StringGrid1.Cells[ 5,0] := '지급일';
  StringGrid1.Cells[ 6,0] := '치료내역';
  StringGrid1.Cells[ 7,0] := '지급금액';
  for i := 0 to 8 do
       StringGrid1.Cells[i,1] := '';
end;

procedure TFM_Batch.BT_loadClick(Sender: TObject);
var
  v           : Variant ;
  iRow, iCol  : integer ;
  CNT, Sg_RCnt, work : integer;
  sEmpno, sImsiEmpno, sJobcode : String;
begin
  P_Help.Visible    := True;

  Work              := 0;
  StringGrid_Clear;
  BT_Insert.Enabled := False;
  BT_Delete.Enabled := False;


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
       StringGrid1.ColCount := 11;
       StringGrid1.RowCount := cnt;
       For iRow := 2 to cnt do
       begin
            For iCol := 1 to StringGrid1.ColCount - 1 do
            begin
                 Case iCol of
                      1: begin
                              if not CheckComcode(UpperCase(v.cells[iRow, iCol])) then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1]) +', '
                                                   Trim(v.cells[iRow, 2]) +', '
                                                   Trim(v.cells[iRow, 3]) +'- 등록 가능한 가족관계가 아닙니다.');
                         end;
                      2: begin
                              if Trim(v.cells[iRow, iCol]) = '' then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1]) +', '
                                                   Trim(v.cells[iRow, 2]) +', '
                                                   Trim(v.cells[iRow, 3]) +' - 사업자번호가 없습니다.');
                              if Length(SearchAndReplace(Trim(v.cells[iRow, iCol]),'-','')) <> 10 then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1]) +', '
                                                   Trim(v.cells[iRow, 2]) +', '
                                                   Trim(v.cells[iRow, 3]) +' - 사업자번호가 10자리의 숫자가 아닙니다.');

                         end;
                      3: begin
                              if Trim(v.cells[iRow, iCol]) = '' then
                                   Memo1.Lines.Add(inttoStr(iRow)+', '+
                                                   Trim(v.cells[iRow, 1]) +', '
                                                   Trim(v.cells[iRow, 2]) +', '
                                                   Trim(v.cells[iRow, 3]) +' - 상호가 없습니다.' );

                         end;
                      4: begin
                              sJobcode := v.cells[iRow, iCol];
                              if sJobcode <> '' then
                              begin
                                   if not CheckJobcode(UpperCase(v.cells[iRow, iCol])) then
                                        Memo1.Lines.Add(inttoStr(iRow)+','+
                                                        Trim(v.cells[iRow, 1])+','+
                                                        Trim(v.cells[iRow, 2])+'-인력코드오류');
                              end;
                         end;
                 end;

                 if Memo1.Lines.text = '' then
                 begin
                      if (iCol = 1) then
                      begin
                           StringGrid1.Cells[iCol -1, iRow -1] := Uppercase(v.cells[iRow, iCol]) ;
                      end
                      else if (iCol = 2) or (iCol = 3) then
                      begin
                           StringGrid1.Cells[iCol, iRow -1] := v.cells[iRow, iCol];
                      end
                      else if (iCol = 4) then
                      begin
                           StringGrid1.Cells[iCol, iRow -1] := Uppercase(v.cells[iRow, iCol]);
                      end
                      else if (iCol = 5) then
                      begin
                           //StringGrid1.Cells[iCol, iRow -1] := FM_DRMMENU.gseOrgnum;
                      end
                      else if  (iCol = 6) then
                      begin
                          // StringGrid1.Cells[iCol, iRow -1] := FM_DRMMENU.gseDeptCode;
                      end
                      else if (iCol = 7) or (iCol = 8) or (iCol = 9) or (iCol = 10) then
                      begin
                           StringGrid1.Cells[iCol , iRow -1] := v.cells[iRow, iCol - 2] ;
                      end;
                 end;
            end;
       end;
  end
  else
  begin
       Memo1.Lines.Text     := '';
       StringGrid1.ColCount := 3;
       StringGrid1.RowCount := cnt;
       For iRow := 2 to cnt do
       begin
            sImsiEmpno := v.cells[iRow, 2];
            if      length(sImsiEmpno) = 1 then sEmpno := '000' + sImsiEmpno
            else if length(sImsiEmpno) = 2 then sEmpno := '00'  + sImsiEmpno
            else if length(sImsiEmpno) = 3 then sEmpno := '0'   + sImsiEmpno
            else if length(sImsiEmpno) = 4 then sEmpno :=         sImsiEmpno
            else
            begin
                 ShowMessage('사번을 정확히 입력하세요.');
                 Exit;
            end;
           { if not CheckEmpno(Uppercase(v.cells[iRow, 1]),sEmpno) then
                 Memo1.Lines.Add(inttoStr(iRow)+','+
                                 Trim(v.cells[iRow, 1])+','+
                                 Trim(v.cells[iRow, 2])+','+
                                 Trim(v.cells[iRow, 3])+'-이 사원은 없습니다.');
           }
            if Memo1.Lines.text = '' then
                 For iCol := 1 to StringGrid1.ColCount do
                 begin
                      if iCol = 2 then StringGrid1.Cells[iCol -1, iRow -1] := sEmpno
                      else             StringGrid1.Cells[iCol -1, iRow -1] := UpperCase(v.cells[iRow, iCol]) ;
                 end;
       end;
  end;
  v.WorkBooks.Close;
  v.quit ;
  v:=unassigned;

  if Memo1.Lines.Text <> '' then
  begin
       Memo1.Lines.Add('==================================');
       Memo1.Lines.Add('상기 오류 내역 수정후 재작업 요망.');
       Memo1.Lines.Add('==================================');
       Memo1.Lines.Add('중복된 주민번호 입력 오류사원에 경우 ');   //kth  20090813 재직중이면서 주민가 동일하면 저장 안되게 체크
       Memo1.Lines.Add('재직중인 동일 사원이 존재함으로 해당사원 검색후  ');
       Memo1.Lines.Add('해당사번으로 사용해 주시기 바랍니다.             ');

       StringGrid_Clear;
       ErrorPanel.Visible := True;
       P_Help.Visible     := True;
       System.Exit;
  end;

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
  P_Help.Visible := False;
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
       XArr[1]  := '본인사번';
       XArr[2]  := '가족명';
       XArr[3]  := '가족주민번호(''-''입력)';
       XArr[4]  := '사업자번호(''-''제외)';
       XArr[5]  := '상호명';
       XArr[6]  := '의료비지급일(ex. 20050105)';
       XArr[7]  := '치료내역';
       XArr[8]  := '지급금액';

       XL.Range['A1', 'H1'].Value := XArr;
       XL.Range['A1', 'H1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'H1'].Interior.Color:= $00CBF0B3;
  end
  else
  begin
       //컬럼명 지정_서브타이블 지정
       XArr[1]  := '본인사번';
       XArr[2]  := '가족명';
       XArr[3]  := '가족주민번호(''-''입력)';
       XArr[4]  := '사업자번호(''-''제외)';
       XArr[5]  := '의료비지급일(ex. 20050105)';
       XArr[6]  := '지급금액';
       XL.Range['A1', 'F1'].Value := XArr;
       XL.Range['A1', 'F1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', 'F1'].Interior.Color:= $00CBF0B3;
  end;
  XL.Visible := true;                 //엑셀자료 보여줌
  P_helpinfo.SimpleText := '';
end;

end.
