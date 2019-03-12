unit Psa32403;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, DBClient, Db, quickrpt, qrprntr,
  DBTables, Grids, DBGrids, ComCtrls, MemDS, DBAccess, Ora, OnLineLabel,
  OnEditStdCtrl, OnEditBaseCtrl, OnFocusButton, OnGrDBGrid, OnScheme;

type
  TFpsa32403 = class(TForm)
    pcPage1: TPageControl;
    tsSave: TTabSheet;
    tsShow: TTabSheet;
    tsFor: TTabSheet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Phelpmsg: TPanel;
    SB1: TSpeedButton;
    SpeedButton1: TSpeedButton;
    OraQuery1: TOraQuery;
    OraQuery1F_EMPNO: TStringField;
    OraQuery1F_KORNAME: TStringField;
    OraQuery1F_LOANAMT: TFloatField;
    OraQuery1F_LOANDATE: TStringField;
    OraQuery1F_REPFRDATE: TStringField;
    OraQuery1F_REPTODATE: TStringField;
    OraQuery1F_REPLDATE: TStringField;
    OraQuery2: TOraQuery;
    OraQuery2F_EMPNO: TStringField;
    OraQuery2F_KORNAME: TStringField;
    OraQuery2F_LOANAMT: TFloatField;
    OraQuery2F_LOANDATE: TStringField;
    OraQuery2F_REPFRDATE: TStringField;
    OraQuery2F_REPTODATE: TStringField;
    OraQuery2F_REPLDATE: TStringField;
    OraQuery3: TOraQuery;
    OraQuery4: TOraQuery;
    OraQuery1F_REPCNT: TIntegerField;
    OraQuery2F_REPCNT: TIntegerField;
    SF_Main: TOnSchemeForm;
    Lworkdate: TLabel;
    Lworkman: TLabel;
    DBGrid1: TOnGrDbGrid;
    btnSave: TOnFocusButton;
    DBGrid2: TOnGrDbGrid;
    btnShow: TOnFocusButton;
    btnFor: TOnFocusButton;
    Panel2: TPanel;
    RBemp: TRadioButton;
    RBapp: TRadioButton;
    Pcnt: TOnEdit;
    MEend: TOnMaskEdit;
    Psum: TOnEdit;
    OnEdit1: TOnEdit;
    btnClose: TOnFocusButton;
    Panel3: TPanel;
    RB1: TRadioButton;
    RadioButton2: TRadioButton;
    ME1: TOnMaskEdit;
    OnSectionLabel2: TOnSectionLabel;
    Shape4: TShape;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    DBGrid3: TOnGrDbGrid;
    OraQuery3F_EMPNO: TStringField;
    OraQuery3F_KORNAME: TStringField;
    OraQuery3F_LOANAMT: TFloatField;
    OraQuery3F_LOANDATE: TStringField;
    OraQuery3F_REPFRDATE: TStringField;
    OraQuery3F_REPLDATE: TStringField;
    OraQuery3F_JANAMT: TFloatField;
    OraQuery3REPTODATE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnForClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure RB2Click(Sender: TObject);
    procedure RBempClick(Sender: TObject);
    procedure RBappClick(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure pcPage1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StartUp : Boolean;
    procedure PreviewOfWant;
  end;

var
  Fpsa32403: TFpsa32403;

implementation

uses psa32401,FormMon1;// Calen2;
{$R *.DFM}


procedure TFpsa32403.FormCreate(Sender: TObject);
begin
//  StartUp := False;
end;

procedure TFpsa32403.FormActivate(Sender: TObject);
begin
  ME1.Text           := Copy(FPsa32401.GSsysdate, 1, 6);
  MEend.Text         := Copy(FPsa32401.GSsysdate, 1, 6);
  pcPage1.ActivePage := tsSave;
  Lworkdate.Caption  := FPsa32401.Lsysdate.Caption;
  Lworkman.Caption   := FPsa32401.Lempno.Caption;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출신청지급
       Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME F_KORNAME, A.LOANAMT F_LOANAMT,         ');
       Sql.Add('       A.LOANDATE F_LOANDATE, A.REPFRDATE F_REPFRDATE,                    ');
       Sql.Add('       A.REPTODATE F_REPTODATE, A.REPLDATE F_REPLDATE, A.REPCNT F_REPCNT  ');
       Sql.Add('  FROM PSNLOAN A, PSCMAN B                                                ');
       Sql.Add(' WHERE A.EMPNO = B.EMPNO(+) AND NVL(A.JANAMT,0) = 0 AND A.ENDYN = ''Y''   ');
       Sql.Add(' ORDER BY A.EMPNO, A.LOANDATE                                             ');
       Open;
  end;
  if OraQuery1.RecordCount <= 0 then
  begin
       Phelpmsg.Caption := '  만기자보관할 자료가 없습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end
  else
  begin
       Phelpmsg.Caption := '  만기자보관작업을 시작하세요.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end;
end;

procedure TFpsa32403.btnCloseClick(Sender: TObject);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출신청지급
       Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME F_KORNAME, A.LOANAMT F_LOANAMT,        ');
       Sql.Add('       A.LOANDATE F_LOANDATE, A.REPFRDATE F_REPFRDATE,                   ');
       Sql.Add('       A.REPTODATE F_REPTODATE, A.REPLDATE F_REPLDATE, A.REPCNT F_REPCNT ');
       Sql.Add('  FROM PSNLOAN A, PSCMAN B                                               ');
       Sql.Add(' WHERE A.EMPNO = ''개발자'' AND A.EMPNO = B.EMPNO                        ');
       Open;
  end;
  with OraQuery2 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출만기자
       Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME F_KORNAME, A.LOANAMT F_LOANAMT,        ');
       Sql.Add('       A.LOANDATE F_LOANDATE, A.REPFRDATE F_REPFRDATE,                   ');
       Sql.Add('       A.REPTODATE F_REPTODATE, A.REPLDATE F_REPLDATE, A.REPCNT F_REPCNT ');
       Sql.Add('  FROM PSELOAN A, PSCMAN B                                               ');
       Sql.Add(' WHERE A.EMPNO = ''개발자'' AND A.EMPNO = B.EMPNO                        ');
       Open;
  end;
  with OraQuery3 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출신청지급
       Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME F_KORNAME, A.LOANAMT F_LOANAMT,        ');
       Sql.Add('       A.LOANDATE F_LOANDATE, A.REPFRDATE F_REPFRDATE, A.REPTODATE F_REPTODATE, ');
       Sql.Add('       A.REPLDATE F_REPLDATE, A.JANAMT F_JANAMT                          ');
       Sql.Add('  FROM PSNLOAN A, PSCMAN B                                               ');
       Sql.Add(' WHERE A.EMPNO = ''개발자'' AND A.EMPNO = B.EMPNO                        ');
       Open;
  end;
  Close;
end;

procedure TFpsa32403.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True
end;

procedure TFpsa32403.btnSaveClick(Sender: TObject);
begin
  if OraQuery1.RecordCount <= 0 then
  begin
       Phelpmsg.Caption := '  만기자 보관할 자료가 없습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
       Exit;
  end;
  Phelpmsg.Caption := '  대출상환만기자테이블로 자료이송합니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);

  Try
    with OraQuery4 do
    begin
      Close;
      Sql.Clear;  //사내근로복지기금 대출만기자
      Sql.Add('INSERT INTO PSELOAN                                                ');
      Sql.Add('SELECT A.EMPNO, A.APPDATE, A.APPTIME, A.PAYCL, A.STDAMT,           ');
      Sql.Add('       A.REPMM1, A.MAXAMT, A.REPMM2, A.BANK, A.BANKACT, A.APPFLAG, ');
      Sql.Add('       A.YYMM, A.LOANDATE, A.LOANAMT, A.REPMAXMM, A.REPFRDATE,     ');
      Sql.Add('       A.REPTODATE, A.JANAMT, A.REPLDATE, A.REPCNT, A.ENDYN,       ');
      Sql.Add('       A.APPSARYU, A.WRITETIME, A.WRITEMAN, A.TELNO                ');
      Sql.Add('FROM PSNLOAN A                                                     ');
      Sql.Add('WHERE NVL(A.JANAMT,0) = 0 AND A.ENDYN = ''Y''                      ');
      ExecSql;
    end;
    with OraQuery4 do
    begin
      Close;
      Sql.Clear;  //사내근로복지기금 대출만기, 사내근로복지기금 대출신청지급
      Sql.Add('INSERT INTO PSOREPAY                                               ');
      Sql.Add('SELECT A.EMPNO, A.REPLDATE, A.APPDATE, A.REPLDATE2, A.REPCNT,      ');
      Sql.Add('       A.REPAMT, A.REPINT, A.WRITETIME, A.WRITEMAN                 ');
      Sql.Add('FROM PSNREPAY A, PSNLOAN B                                         ');
      Sql.Add('WHERE A.EMPNO = B.EMPNO AND A.APPDATE = B.APPDATE AND              ');
      Sql.Add('      NVL(B.JANAMT,0) = 0 AND B.ENDYN = ''Y''                      ');
      ExecSql;
    end;
    with OraQuery4 do
    begin
      Close;
      Sql.Clear; //사내근로복지기금 대출상환, 사내근로복지기금 대출신청지급
      Sql.Add('DELETE FROM PSNREPAY                     ');
      Sql.Add(' WHERE (EMPNO, APPDATE)                  ');
      Sql.Add('    IN (SELECT A.EMPNO, A.APPDATE        ');
      Sql.Add('          FROM PSNREPAY A, PSNLOAN B     ');
      Sql.Add('         WHERE NVL(B.JANAMT,0) = 0       ');
      Sql.Add('           AND B.ENDYN   = ''Y''         ');
      Sql.Add('           AND A.EMPNO   = B.EMPNO       ');
      Sql.Add('           AND A.APPDATE = B.APPDATE )   ');
      ExecSql;
    end;
    Phelpmsg.Caption := '  대출신청지급테이블의 자료를 삭제합니다.';
    SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
    with OraQuery4 do
    begin
      Close;
      Sql.Clear; //사내근로복지기금 대출신청지급
      Sql.Add('DELETE FROM PSNLOAN                           ');
      Sql.Add(' WHERE NVL(JANAMT,0) = 0 AND ENDYN = ''Y''    ');
      ExecSql;
    end;

  Except on  EDataBaseError do
    begin
      Phelpmsg.Caption := ('  작업을 진행할 수 없습니다!');
      Application.MessageBox(' 치명적 오류로 더 이상 작업을 진행할 수 없습니다'+
                             #13+#13+'    전산담당자 또는 개발자와 상의하십시요'+
                             #13+#13+'                     종료합니다',
                             '사우회 대출금상환등록', mb_OK);
      Close;
      Exit;
    end;
  end;
  Phelpmsg.Caption := '  만기자보관작업이 완료되었습니다.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  FormActivate(Sender);
end;

procedure TFpsa32403.btnShowClick(Sender: TObject);
begin
  Phelpmsg.Caption := '  조회중입니다. 잠시만 기다려 주세요.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  with OraQuery2 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출만기자, 상조회 상조회원
       Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME F_KORNAME, A.LOANAMT F_LOANAMT,       ');
       Sql.Add('       A.LOANDATE F_LOANDATE, A.REPFRDATE F_REPFRDATE,                  ');
       Sql.Add('       A.REPTODATE F_REPTODATE,A.REPLDATE F_REPLDATE, A.REPCNT F_REPCNT ');
       Sql.Add('  FROM PSELOAN A, PSCMAN B                                              ');
       Sql.Add(' WHERE A.EMPNO = B.EMPNO(+) AND                                         ');
       if RB1.Checked then
            Sql.Add('  A.LOANDATE LIKE '''+ME1.Text+'%''                                ')
       else
            Sql.Add('  A.REPLDATE = '''+ME1.Text+'''                                    ');
       Sql.Add(' ORDER BY  A.EMPNO, A.LOANDATE                                          ');
       Open;
  end;
  if OraQuery2.RecordCount <= 0 then
  begin
       Phelpmsg.Caption := '  만기자이력조회할 자료가 없습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end
  else
  begin
       Phelpmsg.Caption := '  만기자이력조회가 완료되었습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end;
end;

procedure TFpsa32403.PreviewOfWant;
begin
  with OraQuery3 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출신청지급
       Sql.Add('SELECT A.EMPNO F_EMPNO, B.KORNAME F_KORNAME, A.LOANAMT F_LOANAMT,  ');
       Sql.Add('       A.LOANDATE F_LOANDATE, A.REPFRDATE F_REPFRDATE, A.REPTODATE F_REPTODATE, ');
       Sql.Add('       A.REPLDATE F_REPLDATE, A.JANAMT F_JANAMT                    ');
       Sql.Add('  FROM PSNLOAN A, PSCMAN B                                         ');
       Sql.Add(' WHERE A.EMPNO     = B.EMPNO(+)                                    ');
       Sql.Add('   AND A.REPTODATE = '''+MEend.Text+'''                            ');
       Sql.Add('   AND NVL(A.JANAMT,0) <> 0 AND A.JANAMT IS NOT NULL               ');
       Sql.Add('   AND A.ENDYN     = ''N''                                         ');
       if RBemp.Checked then
            Sql.Add('  ORDER BY A.EMPNO, A.LOANDATE                                ')
       else
            Sql.Add('  ORDER BY A.LOANDATE, A.EMPNO                                ');
       Open;
       if RecordCount > 0 then
            Pcnt.Text := Format('%4.0n', [StrToFloat(IntToStr(RecordCount))])
       else
            Pcnt.Text := '0';
  end;
end;

procedure TFpsa32403.btnForClick(Sender: TObject);
begin
  Phelpmsg.Caption := '  조회중입니다. 잠시만 기다려 주세요.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  PreviewOfWant;
  with OraQuery4 do
  begin
       Close;
       Sql.Clear; //사내근로복지기금 대출신청지급
       Sql.Add('SELECT SUM(JANAMT)                    ');
       Sql.Add('  FROM PSNLOAN                        ');
       Sql.Add(' WHERE NVL(JANAMT,0) <> 0             ');
       Sql.Add('   AND JANAMT IS NOT NULL             ');
       Sql.Add('   AND ENDYN     = ''N''              ');
       Sql.Add('   AND REPTODATE = '''+MEend.Text+''' ');
       Open;
       if RecordCount > 0 then     Psum.Text := Format('%12.0n', [Fields[0].AsFloat])
       else                        Psum.Text := '0';
  end;
  if OraQuery3.RecordCount <= 0 then
  begin
       Phelpmsg.Caption := '  만기자예정조회할 자료가 없습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end
  else
  begin
       Phelpmsg.Caption := '  만기자예정조회가 완료되었습니다.';
       SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
  end;
end;

procedure TFpsa32403.RB1Click(Sender: TObject);
begin
  btnShowClick(Self);
end;

procedure TFpsa32403.RB2Click(Sender: TObject);
begin
  btnShowClick(Self);
end;

procedure TFpsa32403.RBempClick(Sender: TObject);
begin
  PreviewOfWant;
end;

procedure TFpsa32403.RBappClick(Sender: TObject);
begin
  PreviewOfWant;
end;

procedure TFpsa32403.SB1Click(Sender: TObject);
begin
  Try
      MonthForm := TMonthForm.Create(Self);
      MonthForm.ShowModal;
      if MonthForm.DayCaption <> '' then
      ME1.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
      MonthForm.Free;
  End;
end;

procedure TFpsa32403.SpeedButton1Click(Sender: TObject);
begin
  Try
      MonthForm := TMonthForm.Create(Self);
      MonthForm.ShowModal;
      if MonthForm.DayCaption <> '' then
      MEend.Text := Copy(MonthForm.DayCaption,1,6);
  Finally
      MonthForm.Free;
  End;
end;

procedure TFpsa32403.pcPage1Change(Sender: TObject);
begin
  if pcPage1.ActivePage = tsSave then
  begin
       if OraQuery1.RecordCount <= 0 then     Phelpmsg.Caption := '  만기자 보관할 자료가 없습니다.'
       else                                   Phelpmsg.Caption := '  만기자보관작업을 시작하세요.';
  end;
  if pcPage1.ActivePage = tsShow then
  begin
     btnShowClick(Sender);
     Phelpmsg.Caption := '  만기자이력조회를 시작하세요.';
  end;
  if pcPage1.ActivePage = tsfor  then     Phelpmsg.Caption := '  만기자예정조회를 시작하세요.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

end.




