unit Psa30502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, MemDS, DBAccess, Ora;
type
  TFpsa30502 = class(TForm)
    Shape7: TShape;
    Label1: TLabel;
    Label2: TLabel;
    PA: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    PD: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    PB: TPanel;
    PC: TPanel;
    PE: TPanel;
    Panel7: TPanel;
    MEdate_1: TMaskEdit;
    BitBtn3: TBitBtn;
    Panel9: TPanel;
    PI: TNumberEdit;
    OraQuery1: TOraQuery;
    PF: TNumberEdit;
    Panel8: TPanel;
    PG: TPanel;
    PH: TPanel;
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
  Fpsa30502: TFpsa30502;

implementation

uses Psa30501, kylib1, KeyEmpno;
{$R *.DFM}

procedure TFpsa30502.FormActivate(Sender: TObject);
begin
  sEMPNO   := '';
  sAPPDATE := '';
  sREPCNT  := 0;

  sEMPNO   := FPsa30501.Eempno.Text;
  sAPPDATE := FPsa30501.OraQuery3APPDATE.AsString;
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT LOANDATE, LOANAMT, REPTODATE,  ');
    Sql.Add('JANAMT,(LOANAMT-JANAMT) REPAMT, REPCNT');
    Sql.Add('FROM PSMLOAN                          ');
    Sql.Add(' WHERE EMPNO = '''+sEMPNO+'''         ');
    Sql.Add(' AND APPDATE = '''+sAPPDATE+'''       ');

(* 대출만기자 제외
    Sql.Add('UNION                                 ');
    Sql.Add('SELECT LOANDATE, LOANAMT, REPTODATE,  ');
    Sql.Add('JANAMT,(LOANAMT-JANAMT) REPAMT, REPCNT');
    Sql.Add('FROM PSHLOAN                          ');
    Sql.Add(' WHERE EMPNO = '''+pEMPNO+'''         ');
    Sql.Add(' AND APPDATE = '''+pAPPDATE+'''      ');
*)
    Open;
  end;

  PA.Caption := FPsa30501.Eempno.Text;
  PD.Caption := FPsa30501.Pankorname.Caption;
  PB.Caption := Copy(OraQuery1.Fields[0].AsString, 1, 4) + '-' +
                Copy(OraQuery1.Fields[0].AsString, 5, 2) + '-' +
                Copy(OraQuery1.Fields[0].AsString, 7, 2);
  PE.Caption := Format('%12.0n',[OraQuery1.Fields[1].AsFloat]);
  PC.Caption := Copy(OraQuery1.Fields[2].AsString, 1, 4) + '-' +
                Copy(OraQuery1.Fields[2].AsString, 5, 2);
  PF.Text    := Format('%12.0n',[OraQuery1.Fields[3].AsFloat]);
  PF.Value   := OraQuery1.Fields[3].AsFloat;
  PG.Caption := Format('%12.0n',[OraQuery1.Fields[4].AsFloat]);

  PH.Caption := OraQuery1.Fields[5].AsString;
  sREPCNT    := StrToInt(OraQuery1.Fields[5].AsString);
  MEdate_1.Text := FormatDateTime('YYYYMMDD',now);
end;

procedure TFpsa30502.BitBtn3Click(Sender: TObject);
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

    with OraQuery1 do
    begin
      Try
        Close;
        Sql.Clear;
        Sql.Add('UPDATE PSMLOAN                                 ');
        Sql.Add('  SET JANAMT    = 0,                           ');
        Sql.Add('      REPCNT    = ' + sLASTCNT + ',            ');
        Sql.Add('      REPLDATE  = ''' + Copy(MEdate_1.Text,1,6) +''', ');
        Sql.Add('      ENDYN     = ''Y'',                       ');
        Sql.Add('      WRITETIME = '''+FPsa30501.GSsysdate+''', ');
        Sql.Add('      WRITEMAN  = '''+FPsa30501.GSpEMP+'''     ');
        Sql.Add('WHERE EMPNO = '''+sEMPNO+'''                   ');
        Sql.Add('AND APPDATE = '''+sAPPDATE+'''                 ');
        ExecSql;

      except on E:Exception do
        begin
          MessageDlg('실행중(Mas) 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                    Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
          PostMessage(Self.Handle, WM_CLOSE, 0, 0);
          Exit;
        end
      End;

      Try
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO PSDREPAY             ');
        Sql.Add('  (EMPNO, REPLDATE, APPDATE,     ');
        Sql.Add('   REPLDATE2, REPCNT, REPAMT,    ');
        Sql.Add('   REPINT, WRITETIME, WRITEMAN)  ');
        Sql.Add('SELECT                           ');
        Sql.Add('   EMPNO, REPLDATE, APPDATE,     ');
        Sql.Add('''' + MEdate_1.Text +''',        ');
        Sql.Add('   REPCNT,                       ');
        Sql.Add('   '+ FloatToStr(PF.Value)  +',  ');
        Sql.Add('   '+ FloatToStr(PI.Value)  +',  ');
        Sql.Add(' '''+ FPsa30501.GSsysdate +''',  ');
        Sql.Add(' '''+ FPsa30501.GSpEMP +'''      ');
        Sql.Add('  FROM PSMLOAN                   ');
        Sql.Add('WHERE EMPNO   = '''+sEMPNO+'''   ');
        Sql.Add('  AND APPDATE = '''+sAPPDATE+''' ');
        ExecSql;

      except on E:Exception do
        begin
          MessageDlg('실행중(His) 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                    Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
          PostMessage(Self.Handle, WM_CLOSE, 0, 0);
          Exit;
        end;
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

procedure TFpsa30502.BitBtn2Click(Sender: TObject);
begin
  GSClose := -1;
  Close;
end;

end.
