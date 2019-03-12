unit UbatchForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  OnTmaxPersonEdit, CheckLst, OnListbox, OnEditMdate, OnEditCombo,
  OnTmaxDeptEdit, kpaylib;

type
  TBatchForm = class(TForm)
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    OKBtn: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    E_SrcFrDate: TOnMaskEdit;
    E_SrcToDate: TOnMaskEdit;
    E_TarFrDate: TOnMaskEdit;
    E_TarToDate: TOnMaskEdit;
    Label2: TLabel;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    StaticText3: TStaticText;
    StaticText1: TStaticText;
    StaticText5: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure E_TarFrDateExit(Sender: TObject);
//    procedure E_TarFrDateKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure E_TarToDateExit(Sender: TObject);
//    procedure E_TarToDateKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure SB_TarFrDateClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
//    procedure SB_TarToDateClick(Sender: TObject);
  private
    { Private declarations }
  public
    gbOk, gbCheck, gbStart: Boolean;
    gsEmpno, gsOutFrDate, gsOutToDate, gsInFrDate, gsInToDate: String;
    { Public declarations }
  end;

var
  BatchForm: TBatchForm;

implementation

uses
  //Hinsa_TmaxDM;
  URegForm, UpitLib, UMainForm;
{$R *.DFM}


//=============================================================================//
// Button 관련 Event...
//=============================================================================//
procedure TBatchForm.E_TarFrDateExit(Sender: TObject);
var
  frDate: Double;
begin
    gbCheck := False;

    MainForm.fnSetVariable(2);
    if Length(Trim(E_TarFrDate.Text)) < 6 then
    begin
        MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
        E_TarFrDate.SetFocus;
        Exit;
    end;

    if copy(MainForm.pSysdate,1,6) <  Trim(E_TarFrDate.Text) then
    begin
        MessageDlg('종료월이 현재월보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
        E_TarFrDate.SetFocus;
        Exit;
    end;

  TRY
    frDate := kpaylib.to_date(E_TarFrDate.Text,'YYYYMM');
  EXCEPT
    MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
    E_TarFrDate.SetFocus;
    Exit;
  END;

    gbCheck := True;
end;
{
procedure TBatchForm.E_TarFrDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
         SB_TarFrDate.Click;
end;
}
procedure TBatchForm.E_TarToDateExit(Sender: TObject);
var
  toDate: Double;
begin
    gbCheck := False;

    MainForm.fnSetVariable(2);

    if copy(MainForm.PSysdate,1,6) <  Trim(E_TarToDate.Text) then
    begin
        MessageDlg('종료월이 현재월보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
        E_TarToDate.SetFocus;
        Exit;
    end;

    if Trim(E_TarToDate.Text) <> '' then
    begin
        if Length(Trim(E_TarToDate.Text)) < 6 then
        begin
            MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
            E_TarToDate.SetFocus;
            Exit;
        end;

        if (E_TarFrDate.Text > E_TarToDate.Text) then
        begin
            MessageDlg('시작월이 종료월보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
            E_TarToDate.SetFocus;
            Exit;
        end;

      TRY
        toDate := kpaylib.to_date(E_TarToDate.Text,'YYYYMM');
      EXCEPT
        MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
        E_TarToDate.SetFocus;
        Exit;
      END;
    end;

    gbCheck := True;
end;
{
procedure TBatchForm.E_TarToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
         SB_TarToDate.Click;
end;
}{
procedure TBatchForm.SB_TarFrDateClick(Sender: TObject);
var
  MonthForm : TMonthForm;
  TempDate : TPePanelEdit;
begin
    if TComponent(Sender).Tag = 1 then
        TempDate := E_TarFrDate
    else
        TempDate := E_TarToDate;
  Try
    MonthForm := TMonthForm.Create(Self);
    if Length(TempDate.Text) = 6 then
        MonthForm.rDayCaption := TempDate.Text
    else
        MonthForm.rDayCaption := FormatDateTime('YYYYMM',date);
    MonthForm.ShowModal;

    TempDate.Text := MonthForm.DayCaption;

  Finally
    MonthForm.Free;
  End;
end;
}
procedure TBatchForm.OKBtnClick(Sender: TObject);
var
   iTemp: Integer;
   SQLText: String;
begin
    gbCheck := False;
    E_TarFrDateExit(E_TarFrDate);
    E_TarToDateExit(E_TarToDate);
    if gbCheck = False then System.Exit;

    if Trim(E_TarFrDate.Text) = '' then
    begin
        MessageDlg('시작일이 없습니다.',mtError,[mbOK],0);
        Exit;
    end;

    // 기간중복여부
    SQLText:= Format(
          'SELECT count(empno) cnt FROM pishrmas                              '+
          'WHERE empno = ''%s''                                               '+
          '  AND (''%s'' BETWEEN frdutydate AND NVL(todutydate,''999912'')    '+
          '       OR                                                          '+
          '       NVL(''%s'',''999912'')  BETWEEN frdutydate AND NVL(todutydate,''999912'')) '+
          '  AND NOT (frdutydate = ''%s''                                     '+ // 자신제외
          '           AND NVL(''%s'',''999912'') = NVL(todutydate,''999912''))',
          [gsEmpno,
           E_TarFrDate.Text, E_TarToDate.Text,
           E_SrcFrDate.Text, E_SrcToDate.Text]);

    MainForm.TCsel.Close;
    MainForm.TCsel.ClearFieldInfo;
    MainForm.TCsel.AddField('CNT', ftString, 300);
    MainForm.TCsel.SQL.Clear;
    MainForm.TCsel.SQL.Text := SQLText;
    MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
    MainForm.TCsel.Open;

    iTemp := StrToInt(MainForm.TCsel.FieldByName('CNT').AsString);
    MainForm.TCsel.Close;

    if iTemp > 0 then
    begin
        MessageDlg('기간중복되는 자료가 있습니다.',mtError,[mbOK],0);
        Exit;
    end;

    gbOk := True;
    gsOutFrDate := E_TarFrDate.Text;
    gsOutToDate := E_TarToDate.Text;

    Close;
end;

procedure TBatchForm.ExitBtnClick(Sender: TObject);
begin
    gbOk := False;

    Close;
end;
{
procedure TBatchForm.SB_TarToDateClick(Sender: TObject);
var
  MonthForm : TMonthForm;
  TempDate : TPePanelEdit;
begin
    if TComponent(Sender).Tag = 1 then
        TempDate := E_TarFrDate
    else
        TempDate := E_TarToDate;
  Try
    MonthForm := TMonthForm.Create(Self);
    if Length(TempDate.Text) = 6 then
        MonthForm.rDayCaption := TempDate.Text
    else
        MonthForm.rDayCaption := FormatDateTime('YYYYMM',date);
    MonthForm.ShowModal;

    TempDate.Text := MonthForm.DayCaption;

  Finally
    MonthForm.Free;
  End;

end;
}
//=============================================================================//
// Form 관련 Event...
//=============================================================================//
procedure TBatchForm.FormCreate(Sender: TObject);
begin
    gbStart := True;
end;

procedure TBatchForm.FormPaint(Sender: TObject);
begin
    if gbStart = False Then Exit;
    gbStart := False;
    Application.ProcessMessages;

    gbOk := False;
    gsOutFrDate := '';
    gsOutToDate := '';
    E_SrcFrDate.Text := gsInFrDate;
    E_SrcToDate.Text := gsInToDate;
    E_TarFrDate.Text := gsInFrDate;
    E_TarToDate.Text := gsInToDate;

    E_TarFrDate.SetFocus;
end;
//=============================================================================//
// procedure & function
//=============================================================================//


//=============================================================================//
end.
 