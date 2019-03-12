unit UCodeForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  OnTmaxPersonEdit, CheckLst, OnListbox, OnEditMdate, OnEditCombo,
  OnTmaxDeptEdit  ;

type
  TCodeForm = class(TForm)
    Panel1: TPanel;
    MailBtn: TOnFocusButton;
    Bt_OK: TOnFocusButton;
    CloseBtn: TOnFocusButton;
    SG_Main: TStringGrid;
    SGM: TStringGrid;
    SG: TStringGrid;
    procedure CloseBtnClick(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure Bt_OKClick(Sender: TObject);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure ttxCODEBeforeCall(DataSet: TDataSet; var Buffer: PChar);
    procedure SGMClick(Sender: TObject);
    procedure MailBtnClick(Sender: TObject);
    procedure SG_MainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    START, SELECT_YN : Boolean;

    //  Tuxedo Component BeforeCall Event 처리변수
    CDS_Pmax : String;
    CDS_Prfd : String;
    CDS_Psfd : array of String;

    CODE_ID  : String;

    pMainId, pMainNm, pSubId, pSubNm,  pDetId, pDetNm : String;

    procedure DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
    procedure SetGrid(mGrid: TStringGrid; mKeyWord: String);
  end;

var
  CodeForm: TCodeForm;

implementation

//==============================================================================//
// 03.09    2002.04.02      손종운      Notes 기능 삭제
//==============================================================================//
//uses tuxCommonDM, UMainForm, URegForm, HanaroMailForm;
uses UMainForm, URegForm;
//==============================================================================//

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
// User Defined
////////////////////////////////////////////////////////////////////////////////

procedure TCodeForm.DeleteRow(yourStringGrid: TStringGrid; ARow: Integer);
var i: Integer;
begin
  with yourStringGrid do
  begin
    for i := ARow to RowCount-1 do
      Rows[i].Assign(Rows[i+1]);
    if RowCount = 1  then
      Rows[1].Text := ''
    else
      RowCount := RowCount - 1;
  end;
end;

procedure TCodeForm.SetGrid(mGrid: TStringGrid; mKeyWord: String);
var
  SQLText : String;
  Cnt : Integer;
begin
    // 구 분        CODESUPER     CODEMAINON
    // 대분류 (0)           0               0
    // 중분류 (1)           0               1
    // 세부   (2)           1               1

    if mGrid.Tag = 0 then
      SQLText:= Format(
             'SELECT                             ' +
             'nvl(  codeno   ,'' '') codeid,           ' +
             'nvl(  codename ,'' '')             ' +
             'FROM pishrcode                     ' +
             'WHERE codeid = ''%s''              ' +
             '  AND codesuper = ''0''            ' +
             '  AND codemainon = ''0''           ' +
             '  AND UPPER(codeno)  LIKE ''%s''   ' +
             'ORDER BY codeid                    ' , [CODE_ID, UpperCase(mKeyWord)+'%'])
    else if mGrid.Tag = 1 then
      SQLText:= Format(
             'SELECT  ' +
             'nvl(  codeno   ,'' '') codeid,' +
             'nvl(  codename ,'' '')  ' +
             'FROM pishrcode                     ' +
             'WHERE codeid = ''%s''              ' +
             '  AND codesuper = ''0''            ' +
             '  AND codemainon = ''1''           ' +
             '  AND UPPER(codeno)  LIKE ''%s''   ' +
             'ORDER BY codeid                    ' , [CODE_ID, UpperCase(mKeyWord)+'%'])
    else
      SQLText:= Format(
             'SELECT  ' +
             'nvl(  codeno   ,'' '') codeid,' +
             'nvl(  codename ,'' '')  ' +
             'FROM pishrcode                     ' +
             'WHERE codeid = ''%s''              ' +
             '  AND codesuper = ''1''            ' +
             '  AND codemainon = ''1''           ' +
             '  AND UPPER(codeno)  LIKE ''%s''   ' +
             'ORDER BY codeid                    ' , [CODE_ID, UpperCase(mKeyWord)+'%']);

    With MainForm.TCODE do begin
        Close;
        ClearFieldInfo;
        AddField('CODE'         , ftString,  40);
        AddField('CODENAME'     , ftString,  80);

        Sql.Clear;
        Sql.text := SQLText;
        ServiceName := 'PIT1030A_SEL7';
        Open;
//        ServiceName := 'SPIT1050S3';

        SendMessage(mGrid.Handle, WM_SETREDRAW, 0, 0);
        mGrid.RowCount := 2;
        mGrid.Cells[0,1] := '';
        mGrid.Cells[1,1] := '';
        Cnt := 1;
        while not Eof do
        begin
            if Cnt > 1 then mGrid.RowCount := mGrid.RowCount + 1;
            mGrid.Cells[0,Cnt] := FieldByName('CODE').AsString;
            mGrid.Cells[1,Cnt] := FieldByName('CODENAME').AsString;
            Inc(Cnt);
            Next;
        end;
        Close;

        SendMessage(mGrid.Handle, WM_SETREDRAW, 1, 0);
        mGrid.Refresh;

    end; // End -- with ttxCODE
end;

////////////////////////////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////////////////////////////
{
procedure TCodeForm.ttxCODEBeforeCall(DataSet: TDataSet;
  var Buffer: PChar);
begin
  with ttxCODE do
  begin
    ReflectFields := CDS_Prfd;
    InitService(1, tpString, False, 30);
    SetHeader(ServiceName, '0', CDS_Pmax, '', RecordCount, shBUFFSIZE);
    SetFieldValues (0, CDS_Psfd);
  end;
end;
}
procedure TCodeForm.FormCreate(Sender: TObject);
begin
    START := True;
end;

procedure TCodeForm.FormPaint(Sender: TObject);
begin
    if START = False Then Exit;

    Application.ProcessMessages;
    START := False;

    if CODE_ID = 'I711' then
    begin
       self.Caption := '[취급장비 열람]';
       SG_Main.Cols[0].Text  := '코드';       SG_Main.Cols[1].Text  := '대분류(기  능)';
       SGM.Cols[0].Text      := '코드';       SGM.Cols[1].Text      := '중분류(장비명)';
       SG.Cols[0].Text       := '코드';       SG.Cols[1].Text       := '세분류(제품명)';
    end
    else
    begin
       self.Caption := '[취급프로그램 열람]';
       SG_Main.Cols[0].Text  := '코드';       SG_Main.Cols[1].Text  := '프로그램(대분류)';
       SGM.Cols[0].Text      := '코드';       SGM.Cols[1].Text      := '프로그램(중분류)';
       SG.Cols[0].Text       := '코드';       SG.Cols[1].Text       := '프로그램(세분류)';
    end;

    SetGrid(SG_Main, '');
    SetGrid(SGM, '');
    SetGrid(SG, SGM.Cells[0,SGM.Row]);
end;

procedure TCodeForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  CloseBtn.Click;
end;

procedure TCodeForm.SGDblClick(Sender: TObject);
begin
    Bt_OK.Click;
end;

procedure TCodeForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
        if ARow = 0 then
            Font.Style := [fsBold]
        else
            Font.Style := [];

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        Loc := DT_LEFT or DT_WORDBREAK;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TCodeForm.SG_MainClick(Sender: TObject);
begin
    if SGM.Cells[0,SG_Main.Row] <> '' then
    begin
        SetGrid(SGM, SG_Main.Cells[0,SG_Main.Row]);
        SetGrid(SG, SGM.Cells[0,SGM.Row]);
    end;
end;

procedure TCodeForm.SGMClick(Sender: TObject);
begin
    if SGM.Cells[0,SGM.Row] <> '' then
        SetGrid(SG, SGM.Cells[0,SGM.Row]);
end;

procedure TCodeForm.SGKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (SG.Cells[0,SG.Row] <> '') then
    begin
        Key := #0;
        Bt_OK.Click;
    end;
end;

//==============================================================================//
// 03.09    2002.04.02      손종운      Notes 기능 삭제
//==============================================================================//
procedure TCodeForm.MailBtnClick(Sender: TObject);
//var
//  Temp,
//  mEmpno,
//  mKorname,
//  mTelNum,
//  Msg : String;
//
//  Fm_MailForm    : TFm_MailForm;
begin
//  Temp:= 'SELECT  ' +
//         'nvl(  value1   ,'' '') || '';'' || ' +
//         'nvl(  value2   ,'' '') || '';'' || ' +
//         'nvl(  value3   ,'' '')              ' +
//         'FROM pishrvari                      ' +
//         'WHERE gubun = ''00'' and sgubun = ''0001''' ;
//
//   tuxCDM.Csel_SQL := Temp;
//   tuxCDM.Csel_Open;
//   if not tuxCDM.Csel_ret then
//   begin
//     Messagedlg('APP-Server Error : ' + tuxCDM.Csel.ServiceName + #13 +
//                '[' + tuxCDM.Csel.HeaderInfo.ErrCode + '] ' + tuxCDM.Csel.HeaderInfo.ErrMsg
//                ,mtError,[mbOK],0);
//     Exit;
//   end;
//
//   mEmpno   := TuxCDM.Csel_gfd(1);
//   mKorname := TuxCDM.Csel_gfd(2);
//   mTelNum  := TuxCDM.Csel_gfd(3);
//
//   tuxCDM.Csel.Close;
//
//   MessageDlg('다음에 보여질 비빌번호 입력창은 ' + #$D#$A+
//              '종합인사정보시스템 비밀번호가 아닌 ' + #$D#$A+
//              '본인의 "HINT" 비밀번호 입니다. '+ #$D#$A+#$D#$A+
//              '꼭 "HINT" 비밀번호를 기입하시기 바랍니다.', mtInformation,[mbOK],0);
//
//    if CODE_ID = 'I711' then
//      Msg   := '이곳에 추가하시고 싶은 장비를 작성하시고 메일발송을 Click하시면 담당자에게 요청메일을 보냅니다.' + #$D#$A#$D#$A+
//               '대분류(기  능)  : ' + #$D#$A+
//               '중분류(장비명)  : ' + #$D#$A+
//               '세분류(제품명)  : ' + #$D#$A+
//               '연락가능 전화번호 : ' + #$D#$A+#$D#$A+
//               '(예) 대분류(기  능)  : 교환기'     + #$D#$A+
//               '     중분류(장비명)  : PSTN교환기' + #$D#$A+
//               '     세분류(제품명)  : STAREX-TA1A'
//    else
//      Msg   := '이곳에 추가하시고 싶은 프로그램을 작성하시고 메일발송을 Click하시면 담당자에게 요청메일을 보냅니다.' + #$D#$A#$D#$A+
//               '프로그램(대분류)  : ' + #$D#$A+
//               '프로그램(중분류)  : ' + #$D#$A+
//               '프로그램(소분류)  : ' + #$D#$A+
//               '연락가능 전화번호 : '   + #$D#$A+#$D#$A+
//               '(예) 프로그램(대분류)  : OA' + #$D#$A+
//               '     프로그램(중분류)  : 사무용' + #$D#$A+
//               '     프로그램(세분류)  : 한글워드프로세서';
//
//    Msg := Msg + #$D#$A#$D#$A + '※ 메일발송 실패시 담당자(전화번호) : ' +mKorname+'(' + mTelNum + ')';
//
//   Fm_MailForm      := TFm_MailForm.Create(Self);
//   Try
//    Fm_MailForm.Pempno       := MainForm.pEmpno;
//    Fm_MailForm.Pkorname     := MainForm.pKorname;
//    Fm_MailForm.E_title.Text := '신규코드 등록 요청서';
////    Fm_MailForm.PdefaultMemo := '';
////    Fm_MailForm.Pstate := False;
//    Fm_MailForm.Ed_List.Items.Add(mEmpno+'/'+mKorname);
//    Fm_MailForm.E_memo.Text   := Msg;
//    Fm_MailForm.E_Empno.Visible := False;
//    Fm_MailForm.Bt_Add.Visible := False;
//    Fm_MailForm.Bt_Del.Visible := False;
//    Fm_MailForm.E_title.ReadOnly := True;
//    Fm_MailForm.ShowModal;
//  Finally
//    Fm_MailForm.Destroy;
//  End;
end;
//==============================================================================//

procedure TCodeForm.Bt_OKClick(Sender: TObject);
begin
    pMainId := SG_Main.Cells[0, SG_Main.Row];
    pMainNm := SG_Main.Cells[1, SG_Main.Row];
    pSubId  := SGM.Cells[0, SGM.Row];
    pSubNm  := SGM.Cells[1, SGM.Row];
    pDetId  := SG.Cells[0, SG.Row];
    pDetNm  := SG.Cells[1, SG.Row];
    SELECT_YN := True;

    Close;
end;

procedure TCodeForm.CloseBtnClick(Sender: TObject);
begin
    Close;
end;

end.
 