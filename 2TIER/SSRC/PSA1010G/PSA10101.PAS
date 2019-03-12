{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 신규회원 추출/갱신
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
-------------------------------------------------------------------------------}
unit Psa10101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, DBClient, Db, quickrpt, qrprntr,
  DBTables, MemDS, DBAccess, Ora, Pass, Func;

type
  TFpsa10101 = class(TForm)
    Panel19: TPanel;
    Shape7: TShape;
    Phelpmsg: TPanel;
    Panel8: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel9: TPanel;
    BBRun: TBitBtn;
    BBclose: TBitBtn;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel14: TPanel;
    Panel15: TPanel;
    CBUpdate: TCheckBox;
    CBprint: TCheckBox;
    Panel1: TPanel;
    RBmoniter: TRadioButton;
    RBprinter: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    PrintDialog1: TPrintDialog;
    SetDateOf: TPanel;
    OraQuery1: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure CBUpdateClick(Sender: TObject);
    procedure CBprintClick(Sender: TObject);
    procedure BBRunClick(Sender: TObject);
    procedure RBprinterClick(Sender: TObject);
    procedure RBmoniterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StartUp : Boolean;
    GSempno, GSkorname, GSpass, GSgrade, userid, word : String;
    SetDateW, SetToday, SelectPrint : String;
    procedure QueryOfComm(Parameter : String);
  end;

var
  Fpsa10101: TFpsa10101;
  CodeCodeString: TStringList;
  CodeDataString: TStringList;
  sqlstr : WideString;

implementation

uses Psa10102; //InsaDll, 
{$R *.DFM}

procedure TFpsa10101.FormCreate(Sender: TObject);
begin
  Phelpmsg.Caption := ' 초기화 설정중입니다 잠시만 기다려 주세요.'; //SB_Help.Panels[1].Text := 
  Application.ProcessMessages;

  OraConnect;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  SetToday         := Copy(Fn_GetDateTimeStr, 1, 8);
  Pgrade           := copy(Pgrade,3,1);
end;

procedure TFpsa10101.FormShow(Sender: TObject);
var
  qq : TOraQuery;
  i  : Integer;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.Add('select max(substr(writetime,1,8)) d');
            SQL.Add('  from pscman                      ');
            SQL.Add(' where retdate is null             ');
            Open;
            SetDateW := Fields[0].AsString;
       end;
  finally
       qq.Free;
  end;

  if   SetDateW = '' then SetDateOf.Caption := '   년  월  일'
  else
  begin
       SetDateOf.Caption := Copy(SetDateW, 1, 4) + '년';
       if   Length(Trim(Copy(SetDateW, 5, 2))) = 1 then
            SetDateOf.Caption := SetDateOf.Caption + '0' + Trim(Copy(SetDateW, 5, 2)) + '월'
       else
            SetDateOf.Caption := SetDateOf.Caption + Copy(SetDateW, 5, 2) + '월';

       if   Length(Trim(Copy(SetDateW, 7, 2))) = 1 then
            SetDateOf.Caption := SetDateOf.Caption + '0' + Trim(Copy(SetDateW, 7, 2)) + '일'
       else SetDateOf.Caption := SetDateOf.Caption + Copy(SetDateW, 7, 2) + '일';
  end;
  SelectPrint     := '0';

  Phelpmsg.Caption := '  신규회원 추출/갱신작업을 하세요.';
  RBmoniter.Enabled := False;
  RBprinter.Enabled := False;
end;

procedure TFpsa10101.BBcloseClick(Sender: TObject);
begin
  CodeCodeString.Free;
  CodeDataString.Free;
  Close;
end;

procedure TFpsa10101.CBUpdateClick(Sender: TObject);
begin
  if CBprint.Checked then
  begin
       RBmoniter.Enabled := True;
       RBprinter.Enabled := True;
  end
  else
  begin
       RBmoniter.Enabled := False;
       RBprinter.Enabled := False;
  end;
end;

procedure TFpsa10101.CBprintClick(Sender: TObject);
begin
  CBUpdateClick(Sender);
end;

procedure TFpsa10101.BBRunClick(Sender: TObject);
var 
    StringOfCode : String;
    qq : TOraQuery;
begin
  with PrintDialog1 do
  begin
       Copies     := 0;
       FromPage   := 0;
       MinPage    := 0;
       PrintRange := prAllPages;
  end;

  if (not CBupdate.Checked) and (not CBprint.Checked) then
  begin
       MessageBeep(0);
       Phelpmsg.Caption := '  작업선택을 하세요.';
       Exit;
  end;

  if CBupdate.Checked  then
  begin
       Phelpmsg.Caption := '  신규 사우회원 추출/갱신 작업중입니다.';
       Application.ProcessMessages;

       qq := TOraQuery.Create(nil);
       qq.Session := Ora_Session;
       try
            with qq do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('insert into pscman                             ');
                 SQL.Add('      (empno,   korname,  begindate,           ');
                 SQL.Add('       prodate, writeman, writetime )          ');
                 SQL.Add('select empno, korname, empdate,                ');
                 SQL.Add('       to_char(sysdate,''yyyymmdd''),          ');
                 SQL.Add('       :Pempno,                                ');
                 SQL.Add('       to_char(sysdate,''yyyymmddhh24missd'')  ');
                 SQL.Add('  from pimpmas                                 ');
                 SQL.Add(' where empno not like ''Y''||''%''             ');
                 SQL.Add('   and empno not like ''I''||''%''             ');   //2007.06.20 I사번 추출 제외 추가///
                 SQL.Add('   and payra <> ''A11''                        ');   // 고문제외
                 SQL.Add('   and empno not in (select empno from pscman) ');
                 ParamByName('Pempno').AsString := Pempno;
                 ExecSql;

                 //// 인사 테이블에서 퇴사일을 가져온다 ///////////////////////////////
                 /// /나중에 배당프로그램에서 처리하므로 다음번에 업데이트는 제외된다./
                 SQL.Clear;
                 SQL.Add('update pscman a                                                      ');
                 SQL.Add('   set retdate   = (select b.retdate                                 ');
                 SQL.Add('                      from pimpmas b                                 ');
                 SQL.Add('                     where a.empno = b.empno),                       ');
                 SQL.Add('       writeman  = :Pempno,                                          ');
                 SQL.Add('       writetime = to_char(sysdate,''yyyymmddhh24missd'')            ');
                 SQL.Add(' where retdate is null                                               ');
                 SQL.Add('   and empno in (select empno from pimpmas where retdate is not null)');
                 ParamByName('Pempno').AsString := Pempno;
                 ExecSql;
            end;
       finally
            qq.Free;
       end;

       if CBprint.Checked then
       begin
            Phelpmsg.Caption := '  갱신된 자료 출력작업중입니다.';
            Application.ProcessMessages;
            QueryOfComm(SetToday);
            if RBmoniter.Checked then
            begin
                 Fpsa10102.QuickReport1.Preview;
                 Phelpmsg.Caption := '  출력작업이 완료되었습니다.';
            end;
       end
       else if RBprinter.Checked then
       begin
            if PrintDialog1.Execute then
            begin
                 Fpsa10102.QuickReport1.Print;
                 Phelpmsg.Caption := '  출력작업이 완료되었습니다.';
            end
            else Phelpmsg.Caption := '  출력작업이 취소되었습니다.';
            QRPrinter.Cleanup;
       end
       else Phelpmsg.Caption := '  신규 사우회원 추출/갱신 완료되었습니다.';
  end
  else if CBprint.Checked then
  begin
       Phelpmsg.Caption := '  추출/출력 작업중입니다.';
       Application.ProcessMessages;
       QueryOfComm(SetToday);
       if RBmoniter.Checked then
       begin
            Fpsa10102.QuickReport1.Preview;
            Phelpmsg.Caption := '  출력작업이 완료되었습니다.';
       end
       else if RBprinter.Checked then
       begin
            if PrintDialog1.Execute then
            begin
                 Fpsa10102.QuickReport1.Print;
                 Phelpmsg.Caption := '  출력작업이 완료되었습니다.';
            end
            else Phelpmsg.Caption := '  출력작업이 취소되었습니다.';
            QRPrinter.Cleanup;
       end;
  end;
end;

procedure TFpsa10101.QueryOfComm(Parameter : String);
begin
  OraQuery1.Session := Ora_Session;
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('select a.empno,     a.korname,                                  ');
       Sql.Add('       a.begindate, nvl(a.retdate,'' '') retdate,               ');
       Sql.Add('       b.orgnum,    b.deptcode, b.payra,                        ');
       Sql.Add('       (select deptabbr from pycdept                            ');
       Sql.Add('         where b.orgnum   = orgnum                              ');
       Sql.Add('           and b.deptcode = deptcode) deptabbr                  ');
       Sql.Add('  from pscman a, pimpmas b                                      ');
       Sql.Add(' where a.empno    = b.empno                                     ');
       Sql.Add('   and (a.prodate = :pDate  or substr(a.writetime,1,8) = :Pdate)');
       Sql.Add(' order by retdate, empno, begindate	                        ');

       ParamByName('pDate').AsString :=  parameter;
       Open;
  end;
end;

procedure TFpsa10101.RBprinterClick(Sender: TObject);
begin
  SelectPrint := '1';
end;

procedure TFpsa10101.RBmoniterClick(Sender: TObject);
begin
  SelectPrint := '0';
end;

end.
