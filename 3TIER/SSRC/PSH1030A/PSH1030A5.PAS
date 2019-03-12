unit PSH1030A5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnFocusButton, ComCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnShapeLabel, Db, MemDS, DBAccess, Ora, Datelib,
  Grids, Comobj, OnScheme, Tmax_DataSetText, func, Buttons, OnLineLabel, FormMon1;

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
    TDS1: TTMaxDataSet;
    ErrorPanel: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    Memo1: TMemo;
    BT_ErrorClose: TOnFocusButton;
    Lempno: TLabel;
    Lsysdate: TLabel;
    OnSectionLabel2: TOnSectionLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Shape4: TShape;
    Shape1: TShape;
    OnSectionLabel3: TOnSectionLabel;
    E_CORPNAME: TOnEdit;
    SpeedButton1: TSpeedButton;
    E_APPDATE: TOnMaskEdit;
    E_CORPTEL: TOnEdit;
    StringGrid1: TStringGrid;
    E_PLAYITEM: TOnEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_UploadClick(Sender: TObject);
    procedure BT_InsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_DownClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure E_APPDATEExit(Sender: TObject);
    procedure BT_ErrorCloseClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

  private
    { Private declarations }
    //저장변수
    p_appdate   : String;
    p_empno     : String;
    p_korname   : String;
    p_playamt   : String;

  public
    { Public declarations }
    procedure StringGrid_Clear;
    function InsertPzmoutmas : Boolean;
  end;

var
  FM_Batch: TFM_Batch;

implementation

uses PSH1030A1;

{$R *.DFM}


procedure TFM_Batch.FormShow(Sender: TObject);
begin
  Lempno.Caption := FM_Mainform.FG_korname + '(' + FM_Mainform.FG_empno+')';
  Lsysdate.Caption :=  Copy(FM_Mainform.FG_Date,1,4)+'/'+Copy(FM_Mainform.FG_Date,5,2)+'/'+Copy(FM_Mainform.FG_Date,7,2);
  E_APPDATE.Text := Copy(FM_Mainform.FG_Date,1,6);
  StringGrid_Clear;
end;

procedure TFM_Batch.StringGrid_Clear;
var
  i : integer;
begin
  StringGrid1.ColCount    := 3;
  StringGrid1.RowCount    := 2;
  StringGrid1.Cells[ 0,0] := '사번' ;
  StringGrid1.Cells[ 1,0] := '성명';
  StringGrid1.Cells[ 2,0] := '금액' ;

  for i := 0 to 2 do
       StringGrid1.Cells[i,1] := '';
end;

procedure TFM_Batch.BT_UploadClick(Sender: TObject);
var
  v           : Variant ;
  iRow, iCol  : integer ;
  CNT, Sg_RCnt: integer;
begin
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

  StringGrid1.ColCount := 3;
  StringGrid1.RowCount := cnt;
  
  For iRow := 2 to cnt do
  begin
    For iCol := 1 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[iCol-1, iRow -1] := v.cells[iRow, iCol];
    end; //For iCol := 1 to StringGrid1.ColCount - 1 do
  end; //For iRow := 2 to cnt do

  v.WorkBooks.Close;
  v.quit ;
  v:=unassigned;

  P_helpinfo.SimpleText := ('총 ' + IntTostr(Cnt -1) + ' 건의 엑셀파일 로드가 완료 되었습니다.');
//  P_helpinfo.Font.Color :=  clRed;

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

  if MessageDlg('일괄등록작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Memo1.Clear;
    For MRow := 1 to StringGrid1.RowCount -1 do
    begin
      p_empno     := trim(StringGrid1.Cells[ 0, MRow]);
      p_korname   := trim(StringGrid1.Cells[ 1, MRow]);
      p_playamt   := trim(StringGrid1.Cells[ 2, MRow]);

      if(trim(p_empno)='') then
      begin
        self.Memo1.Lines.Add(IntToStr(MRow)+','+
                             Trim(p_empno)+','+
                             Trim(p_korname)+'-사번 생성 오류');
      end
      else
      begin
        ret_val := InsertPzmoutmas;                                                             

        if(ret_val) then Cnt := Cnt + 1
        else
        begin
          self.Memo1.Lines.Add(IntToStr(MRow)+','+
                               Trim(p_empno)+','+
                               Trim(p_korname)+'-저장 오류');
        end;
      end;
    end;  //Row For End

    if Memo1.Lines.Text <> '' then
    begin
     Memo1.Lines.Add('==================================');
     Memo1.Lines.Add('상기 오류 대상자에 대해 수정후 재작업 요망.');
     StringGrid_Clear;
     ErrorPanel.Visible := True;
    end;

    StringGrid1.ColCount := 3;
    BT_Insert.Enabled    := False;
    MessageDlg('총 ' + IntTostr(Cnt) + '건의 데이터 저장완료.', mtInformation,[mbOK],0);
  end;
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

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '사번';
  XArr[ 2]  := '성명';
  XArr[ 3]  := '금액';

  XL.Range['A1', 'C1'].Value := XArr;
  XL.Range['A1', 'C1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'C1'].Interior.Color:= $00CBF0B3;
  XL.Visible := true;                 //엑셀자료 보여줌
  P_helpinfo.SimpleText := '';
end;


function TFM_Batch.InsertPzmoutmas : Boolean;
begin
    result := true;
    with TDS1 do
    begin
        ServiceName := 'PZO2010A_dml';
        Close;
        Sql.Clear;
        SQL.Text  := 'INSERT INTO PSHAPLAY( APPDATE                  ' +#13#10 +
                     '                     ,EMPNO                    ' +#13#10 +
                     '                     ,KORNAME                  ' +#13#10 +
                     '                     ,PAYCL                    ' +#13#10 +
                     '                     ,SEQ                      ' +#13#10 +
                     '                     ,JOBPLACE                 ' +#13#10 +
                     '                     ,CORPNAME                 ' +#13#10 +
                     '                     ,CORPTEL                  ' +#13#10 +
                     '                     ,PLAYDATE                 ' +#13#10 +
                     '                     ,PLAYITEM                 ' +#13#10 +
                     '                     ,PLAYAMT                  ' +#13#10 +
                     '                     ,EXCEPTAMT                ' +#13#10 +
                     '                     ,DIVISION                 ' +#13#10 +
                     '                     ,STARTYYMM                ' +#13#10 +
                     '                     ,ENDYYMM                  ' +#13#10 +
                     '                     ,COMMENTS                 ' +#13#10 +
                     '                     ,WRITEMAN                 ' +#13#10 +
                     '                     ,WRITETIME)               ' +#13#10 +
                     ' SELECT  ''' + E_APPDATE.Text           + '''  ' +#13#10 +
                     '       , EMPNO, KORNAME, PAYCL                 ' +#13#10 +
                     '       , (SELECT NVL(MAX(SEQ),0)+1 FROM PSHAPLAY WHERE EMPNO = A.EMPNO AND APPDATE = ''' + E_APPDATE.Text + ''') SEQ ' +#13#10 +
                     '       , JOBPLACE                              ' +#13#10 +
                     '       , ''' + E_CORPNAME.Text          + '''  ' +#13#10 +
                     '       , ''' + E_CORPTEL.Text           + '''  ' +#13#10 +
                     '       , ''' + E_APPDATE.Text           + '''  ' +#13#10 +
                     '       , ''' + E_PLAYITEM.Text          + '''  ' +#13#10 +
                     '       , ''' + p_playamt                + '''  ' +#13#10 +
                     '       ,  0                                    ' +#13#10 +
                     '       ,  1                                    ' +#13#10 +
                     '       , ''' + E_APPDATE.Text           + '''  ' +#13#10 +
                     '       , ''' + E_APPDATE.Text           + '''  ' +#13#10 +
                     '       , ''' + E_APPDATE.Text           + '''  ' +#13#10 +
                     '       , ''' + FM_Mainform.FG_empno     + '''  ' +#13#10 +
                     '       ,to_char(sysdate,''YYYYMMDDHH24miss'')  ' +#13#10 +
                     ' FROM PIMPMAS A WHERE EMPNO = ''' + p_empno  + ''' ';
        Execute;
    end;
end;

procedure TFM_Batch.SpeedButton1Click(Sender: TObject);
begin
  Try
    MonthForm := TMonthForm.Create(Self);
    MonthForm.ShowModal;
    E_APPDATE.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
    MonthForm.Free;
  End;
end;

procedure TFM_Batch.E_APPDATEExit(Sender: TObject);
begin
  If ((DateCheck(TOnMaskEdit(Sender).Text+'01') = False) and (TOnMaskEdit(Sender).Text <> '' )) then
  begin
    MessageBox(handle,'날짜를 정확히 입력하세요.','입력오류',MB_ICONEXCLAMATION);
    TOnMaskEdit(Sender).SetFocus;
    System.exit;
  end;
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


