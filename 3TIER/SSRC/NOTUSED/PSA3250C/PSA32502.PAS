unit Psa32502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, MemDS, DBAccess, Ora,
  OnLineLabel, OnFocusButton, OnScheme, OnEditStdCtrl, OnEditBaseCtrl,
  Tmax_DataSetText;
type
  TFpsa32502 = class(TForm)
    PD: TOnEdit;
    PA: TOnEdit;
    PE: TOnEdit;
    PB: TOnMaskEdit;
    PG: TOnEdit;
    PC: TOnMaskEdit;
    MEdate_1: TOnMaskEdit;
    PF: TOnEdit;
    PI: TOnEdit;
    SF_Main: TOnSchemeForm;
    Panel4: TPanel;
    BitBtn3: TOnFocusButton;
    BitBtn2: TOnFocusButton;
    Shape2: TShape;
    OnSectionLabel4: TOnSectionLabel;
    TDml: TTMaxDataSet;
    PH: TOnEdit;
    TMaxDataSet1: TTMaxDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    sEMPNO   : String;   //사번
    sAPPDATE : String;   //대출신청일
    sREPCNT  : INTEGER;
  public
    { Public declarations }
    GSClose : integer;
  end;

var
  Fpsa32502: TFpsa32502;

implementation

uses Psa32501, kylib1, KeyEmpno;
{$R *.DFM}

procedure TFpsa32502.FormActivate(Sender: TObject);
begin
  sEMPNO   := '';
  sAPPDATE := '';
  sREPCNT  := 0;

  sEMPNO   := FPsa32501.Eempno.Text;
  sAPPDATE := fsAPPDATE;

  with TMaxDataSet1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    SQL.Clear;
    Sql.Text := ' SELECT LOANDATE, LOANAMT, REPTODATE, ' +
                '        JANAMT,(LOANAMT-JANAMT) REPAMT, REPCNT, ' +
                '        ''F7'', ''F8'', ''F9'', ''F10'' ' +
                ' FROM PSNLOAN ' +
                ' WHERE EMPNO   = '''+sEMPNO+''' ' +
                '   AND APPDATE = '''+sAPPDATE+''' ';

    ClearFieldInfo;
    AddField('LOANDATE'  ,ftString, 100);
    AddField('LOANAMT'   ,ftFloat , 100);
    AddField('REPTODATE' ,ftString, 100);
    AddField('JANAMT'    ,ftFloat , 100);
    AddField('REPAMT'    ,ftFloat , 100);
    AddField('REPCNT'    ,ftFloat , 100);
    AddField('F7'        ,ftString, 100);
    AddField('F8'        ,ftString, 100);
    AddField('F9'        ,ftString, 100);
    AddField('F10'       ,ftString, 100);
    Open;

    PA.Text := FPsa32501.Eempno.Text;
    PD.Text := FPsa32501.Pankorname.Text;
    PB.Text := FieldByName('LOANDATE').AsString;
    PE.Text := Format('%13.0n', [FieldByName('LOANAMT').AsFloat]);
    PC.Text := FieldByName('REPTODATE').AsString;
    PF.Text := Format('%13.0n', [FieldByName('JANAMT').AsFloat]);
    PG.Text := Format('%13.0n', [FieldByName('REPAMT').AsFloat]);
    PH.Text := FieldByName('REPCNT').AsString; 
    MEdate_1.Text := FormatDateTime('YYYYMMDD',now);

  end;
end;

procedure TFpsa32502.BitBtn3Click(Sender: TObject);
var
  sLASTCNT, Msg, SQLStr : String;
begin
  if Length(Trim(MEdate_1.Text)) = 8 then
  begin
    if DateCheck(Copy(MEdate_1.Text,1,4),Copy(MEdate_1.Text,5,2),Copy(MEdate_1.Text,7,2))= -1 then
    begin
      MessageBox(Handle,'일시상환일자 확인바랍니다', '일자오류', mb_iconwarning);
      MEdate_1.SetFocus;
      Exit;
    end;

    sLASTCNT := '';
    sLASTCNT := IntToStr(sREPCNT + 1);

    Msg := '[일시상환 정보] ' + #13 +
           '○일시상환일자 : ' + Copy(MEdate_1.Text,1,4) + '-' + Copy(MEdate_1.Text,5,2) + '-' + Copy(MEdate_1.Text,7,2) + ' ' + #13 +
           '○일시상환원금 : ' + PF.Text + ' ' + #13 +
           '○일시상환이자 : ' + PI.Text + ' ' + #13 +
           '○최종상환회차 : ' + sLASTCNT + '회차' + #13 +
           '○상환 후 잔액  : 0 '+ #13 ;
    if MessageDlg('아래 정보로 일시상환처리 하시겠습니까?' + #13+#13 + Msg, mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;
       Application.processmessages;

    with TDml do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;

      SQL.Text := ' UPDATE PSNLOAN ' +
                  ' SET JANAMT    = 0, ' +
                  '     REPCNT    = '   + sLASTCNT + ', ' +
                  '     REPLDATE  = ''' + Copy(MEdate_1.Text,1,6) +''', ' +
                  '     ENDYN     = ''Y'', ' +
                  '     WRITETIME = '''+FPsa32501.GSsysdate+''', ' +
                  '     WRITEMAN  = '''+FPsa32501.GSpEMP+''' ' +
                  ' WHERE EMPNO   = '''+sEMPNO+''' ' +
                  '   AND APPDATE = '''+sAPPDATE+''' ';

      if not Execute then
      begin
        MessageDlg('실행중(Mas) 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                    Chr(13) + Chr(10) , mtError, [mbOK], 0);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
        Exit;
      End;
    End;

    with TDml do
    begin
      ServiceName := 'PEA1060A_dml';
      Close;
      Sql.Clear;

      SQL.Text := ' INSERT INTO PSNREPAY ' +
                  ' (EMPNO, REPLDATE, APPDATE, REPLDATE2, REPCNT, REPAMT, REPINT, WRITETIME, WRITEMAN) ' +
                  ' SELECT ' +
                  ' EMPNO, REPLDATE, APPDATE,     '''+ MEdate_1.Text +''', REPCNT, ' +
                  ' '+ PF.Text  +',    '+ PI.Text  +',' +
                  ' '''+ FPsa32501.GSsysdate +''','''+ FPsa32501.GSpEMP +'''  ' +
                  ' FROM PSNLOAN ' +
                  ' WHERE EMPNO   = '''+sEMPNO+''' ' +
                  '   AND APPDATE = '''+sAPPDATE+''' ';

      if not Execute then
      begin
        MessageDlg('실행중(His) 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                  Chr(13) + Chr(10), mtError, [mbOK], 0);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
        Exit;
      End;
    End;
    GSClose := 1; //일시상환완료
    Close;
  end
  Else
  begin
    MessageBox(Handle,'일시상환일자 확인바랍니다', '일자오류', mb_iconwarning);
    MEdate_1.SetFocus;
    Exit;
  end;
end;

procedure TFpsa32502.BitBtn2Click(Sender: TObject);
begin
  GSClose := -1;
  Close;
end;

end.
