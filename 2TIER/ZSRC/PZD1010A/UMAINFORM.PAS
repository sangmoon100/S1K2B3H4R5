unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, OnGrDBGrid, Func,
  Buttons, Db, MemDS, DBAccess, Ora, Mask, Calen1;

type
  TMainform = class(TForm)
    SF_Main: TOnSchemeForm;
    Label1: TLabel;
    QCard: TOnGrDbGrid;
    Shape1: TShape;
    Image1: TImage;
    L_UserName: TLabel;
    Label2: TLabel;
    BB_Print: TBitBtn;
    BB_close: TBitBtn;
    BB_Search: TBitBtn;
    L_Date: TLabel;
    Qcardapp: TOraQuery;
    DataSource1: TDataSource;
    QGroup: TOraQuery;
    BB_manager: TBitBtn;
    Panel5: TPanel;
    SB_FrDate: TSpeedButton;
    Label3: TLabel;
    SB_ToDate: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RB_N: TRadioButton;
    RB_Y: TRadioButton;
    Panel6: TPanel;
    RB_Order1: TRadioButton;
    RB_Order2: TRadioButton;
    RB_Order3: TRadioButton;
    Panel4: TPanel;
    ME_FrDate: TMaskEdit;
    ME_TODate: TMaskEdit;
    procedure BB_PrintClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure BB_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ME_FrDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SB_FrDateClick(Sender: TObject);
    procedure SB_ToDateClick(Sender: TObject);
    procedure Open_Grid;
    procedure FormShow(Sender: TObject);
    procedure BB_managerClick(Sender: TObject);
  private
    { Private declarations }
  public
    PGroupId  : String;
    { Public declarations }
  end;

var
  Mainform: TMainform;
  CurDate       : String[20];


implementation

uses UMain;

{$R *.DFM}

procedure TMainform.BB_PrintClick(Sender: TObject);
begin
  FrmMain.FG_Gubun := 'main';
  FrmMain  := TFrmMain.Create(Self);
  FrmMain.V_appdate     :=  QCard.Fields[0].AsString;
  FrmMain.E_Search.Text :=  QCard.Fields[1].AsString;
  FrmMain.FindEmp('조회');
  FrmMain.ShowModal;
  Open_Grid;
end;

procedure TMainform.BB_closeClick(Sender: TObject);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo+MB_ICONQUESTION) then
        Close;
end;

procedure TMainform.Open_Grid;
var
  Tem : String;
begin
  if not fn_IsDate(ME_FrDate.Text) then
  begin
       Application.MessageBox('날짜가 올바르지 않습니다.','입력오류',MB_OK+MB_ICONWARNING);
       ME_FrDate.SetFocus;
  end;

  if not fn_IsDate(ME_ToDate.Text) then
  begin
       Application.MessageBox('날짜가 올바르지 않습니다.','입력오류',MB_OK+MB_ICONWARNING);
       ME_ToDate.SetFocus;
  end;

  Tem := 'Select APPDATE,EMPNO, KORNAME, APPSAYU,   TEL,      APPEMP,         '+#13+
         '       (Select Korname from pimpmas where empno = a.APPEMP) APPNAME,'+#13+
         '       PRINTYN, PRINTDATE                                           '+#13+
         '       from PZCardApp a                                             '+#13+
         ' Where APPDATE >= '''+ ME_FrDate.text + '''                         '+#13+
         '   and APPDATE <= '''+ ME_ToDate.text + '''                         ';

  if      RB_N.Checked then tem := tem + 'and PRINTYN = ''N''  '
  else if RB_Y.Checked then tem := tem + 'and PRINTYN = ''Y''  ';

  if      RB_Order1.Checked then tem := tem + 'Order by APPDATE     '
  else if RB_Order2.Checked then tem := tem + 'Order by PRINTDATE   '
  else if RB_Order3.Checked then tem := tem + 'Order by EMPNO       ';

  with QCardApp do
  begin
       Close;
       Sql.Clear;
       Sql.Text := Tem;
       Open;
       FieldByName('APPDATE'  ).EditMask := '!9999-99-99;0;_';
       FieldByName('PRINTDATE').EditMask := '!9999-99-99;0;_';
       if   ((QCardApp.RecordCount < 1) or (RB_Y.Checked))  then BB_Print.Enabled := false
       else                                                      BB_Print.Enabled := true;
  end;
end;

procedure TMainform.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  OraConnect;

  CurDate             := fn_GetDateTimeStr;
  L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' + Copy(CurDate,7,2);
  L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
  Application.ProcessMessages;

  with QGroup do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' Select GroupID from pymenuuser  ');
       Sql.Add('  where empno = '''+Pempno+'''   ');
       Open;
       PGroupId := QGroup.FieldByName('GroupID').AsString;
  end;

  with QGroup do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' Select to_Char(Sysdate-7,''YYYYMMDD'') frdate,           ');
       Sql.Add('        to_Char(Sysdate,  ''YYYYMMDD'') todate from dual  ');
       Open;
       ME_FrDate.Text := QGroup.FieldByName('frdate').AsString;
       ME_ToDate.Text := QGroup.FieldByName('todate').AsString;
  end;
end;

procedure TMainform.ME_FrDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Open_Grid;
end;

procedure TMainform.BB_SearchClick(Sender: TObject);
begin
  Open_Grid;
end;

procedure TMainform.SB_FrDateClick(Sender: TObject);
begin
  Try
       Calendar := TCalendar.Create(Self);
       Calendar.ShowModal;
       ME_FrDate.Text := Calendar.DayCaption;
  Finally
       Calendar.Free;
  End;
end;

procedure TMainform.SB_ToDateClick(Sender: TObject);
begin
  Try
       Calendar := TCalendar.Create(Self);
       Calendar.ShowModal;
       ME_ToDate.Text := Calendar.DayCaption;
  Finally
       Calendar.Free;
  End;
end;

procedure TMainform.FormShow(Sender: TObject);
begin
  if not ((PGroupId = 'G001') or (PGroupId = 'G011') or (PGroupId = 'G042')) then
  begin
       ShowMessage('사용권한이 부족합니다.  프로그램을 종료합니다.');
       Mainform.Close;
  end
  else
  if  (PGroupId = 'G001') or (PGroupId = 'G011') or (PGroupId = 'G042') then
       BB_manager.Visible := true;
end;

procedure TMainform.BB_managerClick(Sender: TObject);
begin
  FrmMain.FG_Gubun := 'main';
  FrmMain  := TFrmMain.Create(Self);
  FrmMain.V_appdate     :=  copy(CurDate,1,8);
  FrmMain.E_Search.Text :=  pempno;
  FrmMain.FindEmp('조회');
  FrmMain.ShowModal;
  Open_Grid;
end;

end.
