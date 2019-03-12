unit Psa32202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, OnFocusButton, OnScheme;

type
  TPSA3221 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    BB_app: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    RB4: TRadioButton;
    Lempno: TLabel;
    procedure BB_appClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PSA3221: TPSA3221;

implementation

uses Psa32201;
{$R *.DFM}

procedure TPSA3221.BB_appClick(Sender: TObject);
begin
  if      RB1.Checked then
  Begin
    If (PSA3220.SumAmt < (PSA3220.ExpandAmt + PSA3220.f_STDAMT)) Then
    begin
      MessageBox(Handle,'당월 총대출 가능액을 초과하였습니다.', '대출금액 확인', mb_iconwarning);
      Exit;
    end;
    PSA3220.BoxOfResult := 1
  End
  else if RB2.Checked then
  Begin
    If (PSA3220.SumAmt < (PSA3220.ExpandAmt + 5000000)) Then
    begin
      MessageBox(Handle,'당월 총대출 가능액을 초과하였습니다.', '대출금액 확인', mb_iconwarning);
      Exit;
    end;
    PSA3220.BoxOfResult := 2
  End
  else if RB3.Checked then PSA3220.BoxOfResult := 3
  else if RB4.Checked then
  Begin
    with PSA3220.OraQuery1 do  //상환진행중(대출금 <> 대출잔액)인 자료는 변경 불가.
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT EMPNO FROM PSNLOAN        ');
      Sql.Add('WHERE EMPNO   = '''+PSA3220.f_EMPNO+'''  ');
      Sql.Add('  AND APPDATE = '''+PSA3220.f_APPDATE+'''');
      Sql.Add('  AND APPTIME = '''+PSA3220.f_APPTIME+'''');
      Sql.Add('  AND APPFLAG = ''0''            ');
      Open;
    end;

    if PSA3220.OraQuery1.RecordCount = 0 then
    begin
      MessageBox(Handle,'대출자료가 아닙니다.', '자료확인', mb_iconwarning);
      Exit;
    end;

    PSA3220.BoxOfResult := 4;
  End;
  Close;
end;

procedure TPSA3221.BB_cancelClick(Sender: TObject);
begin
  PSA3220.BoxOfResult := 0;
  Close;
end;

procedure TPSA3221.FormShow(Sender: TObject);
begin
  Lempno.Caption := PSA3220.f_KORNAME + '(' + PSA3220.f_EMPNO+')';

  if       (PSA3220.f_APPFLAG = '신청') Then
  Begin
    if (PSA3220.f_STDAMT <> 5000000) Then RB1.Checked := True
    Else                                  RB2.Checked := True;
  end
  else if  (PSA3220.f_APPFLAG = '기각') Then RB3.Checked := True
  else if  (PSA3220.f_APPFLAG = '대출') Then RB4.Checked := True
  else     (RB1.Checked := True);
end;

end.

