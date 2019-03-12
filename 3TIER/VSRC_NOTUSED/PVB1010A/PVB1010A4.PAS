unit pvb1010a4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ComCtrls, OnLineLabel, ExtCtrls, OnEditCombo,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, Db,
  Tmax_DataSetText;

type
  TCopyForm = class(TForm)
    ED_off_indatefr: TOnDateEdit;
    ED_off_intimefr1: TOnComboEdit;
    Label3: TLabel;
    ED_off_intimefr2: TOnComboEdit;
    Label4: TLabel;
    ED_off_indateto: TOnDateEdit;
    ED_off_intimeto1: TOnComboEdit;
    Label1: TLabel;
    ED_off_intimeto2: TOnComboEdit;
    Label2: TLabel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    SB_Help: TStatusBar;
    BT_Save: TOnFocusButton;
    BT_close: TOnFocusButton;
    Shape2: TShape;
    Shape1: TShape;
    TDS_copy: TTMaxDataSet;
    procedure BT_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_closeClick(Sender: TObject);
    procedure ED_off_indatefrDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SaveYN : Boolean;
  end;

var
  CopyForm: TCopyForm;

implementation

uses pvb1010a1, pvb1010a3;

{$R *.DFM}

procedure TCopyForm.BT_SaveClick(Sender: TObject);
begin
{//저장루틴 주석처리 jissi. 2014.06.30
발신자 : 전지영(JEON JI YOUNG)/IT기획팀/SKB <kcjane@sk.com>
수신자 : 강륜종 Z113/브로드밴드SM/브로드밴드SM(02-6400-6618)
수신일 : 2014-06-30 11:28:30
제 목: RE: 방문자예약 등록내역.

관련해서 우선 기존 등록건에 대한 자료는 그대로 두시구요~
신규 입력만 불가토록(가능하면 입력시 “브로드넷 메인화면내 [방문예약시스템]에서 등록하시기 바랍니다.” Message Popup 부탁드립니다. ) ~
기존건에 대한 조회는 가능토록 해주세요~
}
  if FM_PVB1010A.FG_Sysdate > '20140630' then
  begin
       MessageDlg('브로드넷 메인화면내 [방문예약시스템]에서 등록하시기 바랍니다..', mtWarning, [mbOK], 0);
       System.Exit;
  end;

  if ED_off_indatefr.NoformatDate = '00000000' then
    begin
      MessageDlg('출입요청일시 From을 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_indatefr.SetFocus;
      System.Exit;
    end;

  if ED_off_indateto.NoformatDate = '00000000' then
    begin
      MessageDlg('출입요청일시 To를 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_indateto.SetFocus;
      System.Exit;
    end;

  if ( (ED_off_indatefr.NoformatDate+ED_off_intimefr1.Text+ED_off_intimefr2.Text) >=
       (ED_off_indateto.NoformatDate+ED_off_intimeto1.Text+ED_off_intimeto2.Text) ) then
    begin
      MessageDlg('출입요청일시 To가 From보다 작을수 없습니다...', mtInformation, [mbOK], 0);
      ED_off_indateto.SetFocus;
      System.Exit;
    end;  

  if ED_off_intimefr1.Text = '' then
    ED_off_intimefr1.Text := '00';
  if ED_off_intimefr2.Text = '' then
    ED_off_intimefr2.Text := '00';
  if ED_off_intimeto1.Text = '' then
    ED_off_intimeto1.Text := '00';
  if ED_off_intimeto2.Text = '' then
    ED_off_intimeto2.Text := '00';

  with TDS_copy do
    begin
      ServiceName := 'PVB1010A_copy';
      Close;
      ClearParamInfo;
      AddParam('V_ID',           15,  FM_SubForm2.QR_book.FieldByName('v_id').AsString);
      AddParam('OFF_INDATEFR',   8,   ED_off_indatefr.NoformatDate);
      AddParam('OFF_INTIMEFR',   6,   ED_off_intimefr1.Text+ED_off_intimefr2.Text);
      AddParam('OFF_INDATETO',   8,   ED_off_indateto.NoformatDate);
      AddParam('OFF_INTIMETO',   6,   ED_off_intimeto1.Text+ED_off_intimeto2.Text);
      AddParam('WRITEMAN',       4,   FM_PVB1010A.FG_pempno);

      if not TDS_copy.Execute then
        begin
          MessageDlg('자료를 저장 하는 중 에러가 발생했습니다.', mtError, [mbOK],0);
          Exit;
        end;
    end;

  MessageDlg('방문예약정보가 저장 되었습니다',mtInformation, [mbOk ],0) ;
  SaveYN := True;
  Close;
end;

procedure TCopyForm.FormShow(Sender: TObject);
var
  FL_Rect : TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
  Self.SetBounds(FL_Rect.Top + 300, FL_Rect.Left + 200, Self.Width, Self.Height);
  SaveYN := False;

  ED_off_indatefr.Text         := '';
  ED_off_indateto.Text         := '';
  ED_off_intimefr1.Text        := '09';
  ED_off_intimeto1.Text        := '18';
  ED_off_intimefr2.Text        := '00';
  ED_off_intimeto2.Text        := '00';

  SB_Help.Panels[1].Text := '출입요청일시 From, To를 입력후 [저장] 버튼을 누르시면 방문예약정보가 복사됩니다.';
end;

procedure TCopyForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TCopyForm.ED_off_indatefrDateChange(Sender: TObject);
begin
  ED_off_indateto.NoFormatDate := ED_off_indatefr.NoFormatDate;
end;

end.
