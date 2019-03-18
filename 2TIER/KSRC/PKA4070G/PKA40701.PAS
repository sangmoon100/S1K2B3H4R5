unit pka40701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, StdCtrls, Mask, Buttons, Gauges, ExtCtrls, Calen2, Kylib1,
  ComCtrls, Spin, pass, Ora;

type
  TFpka40701 = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel6: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Panel7: TPanel;
    Panel3: TPanel;
    BBrun: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    Pres: TPanel;
    Label2: TLabel;
    Panel9: TPanel;
    Presult: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Panel8: TPanel;
    Panel4: TPanel;
    Database1: TDatabase;
    Query1: TQuery;
    Label1: TLabel;
    Panel10: TPanel;
    Plastmonth: TPanel;
    SEyyyy: TSpinEdit;
    Gauge1: TGauge;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
  private
    { Private declarations }
    LSsysdate : String[15];   // system date
    DBErrMsg : Array[0..255] of char;    // Transaction Error Message
  public
    { Public declarations }
  end;

var
  Fpka40701: TFpka40701;

implementation

uses Func;

{$R *.DFM}

{-------------------------------- MAIN ----------------------------------------}
{화면활성시}
procedure TFpka40701.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     PhelpMsg.Caption := ' 작업자,작업일,작업기준년도설정 및 최종근태보관년월을 조회하고 있습니다...';

     Application.ProcessMessages;
     //초기값설정

     OraConnect;

     LSsysdate := Fn_GetDateTimeStr;

     Lsysdate.Caption := Fn_GetDateStr;
     Lempinfo.Caption := Pkorname + '(' + Pempno + ')';

     PhelpMsg.Caption := ' 작업기준년도,근태최종보관월 설정중.......';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

     SEyyyy.Value := StrToInt(Copy(LSsysdate,1,4)) - 1;

     Plastmonth.Caption := '';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.ADD('select nvl(max(duyymm), ''0'') a from pkhduhis ');
               Open;
               if FieldByName('a').AsString <> '0' then
               begin
                    Plastmonth.Caption := Copy(FieldByName('a').AsString,1,4) + '년 ' + Copy(FieldByName('A').AsString,5,2) + '월';
               end;
          end;
     Finally
          qq.Free;
     end;

     PhelpMsg.Caption := ' 작업자,작업일,작업기준년도,최종근태보관년월이 설정되었습니다. 작업을 진행하세요.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
end;

{생성}
procedure TFpka40701.BBrunClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     Presult.Caption := '';
     Gauge1.Progress := 0;
     SendMessage(Pres.handle,WM_PAINT,0,0);

     Phelpmsg.Caption := '  자료검사중 입니다.....';
     Gauge1.Progress := 10;
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
     SendMessage(Pres.handle,WM_PAINT,0,0);

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select duyymm from pkhduty  ');
                    SQL.Add(' where duyymm like :duyymm  ');
                    ParamByName('duyymm').AsString := IntToStr(SEyyyy.Value) + '%';
                    Open;

                    If RecordCount = 0 then
                    begin
                         MessageBox(handle,'기준년도에 등록된근태내역이 존재하지않습니다.', '자료오류',MB_ICONWARNING);
                         Gauge1.Progress := 0;
                         Phelpmsg.Caption := '';
                         SendMessage(Pres.handle,WM_PAINT,0,0);
                         SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                         exit;
                    end;

                    Gauge1.Progress := 20;
                    SendMessage(Pres.handle,WM_PAINT,0,0);
                    Close;
                    SQL.Clear;
                    SQL.Add('select duyymm from pkhduhis ');
                    SQL.Add(' wehre duyymm like :duyymm  ');
                    ParamByName('duyymm').AsString := IntToStr(SEyyyy.Value) + '%';
                    Open;

                    If RecordCount = 0 then
                    begin
                         MessageBox(handle,'기준년도로 등록된근태이력이 이미존재합니다.', '자료오류',MB_ICONWARNING);
                         Gauge1.Progress := 0;
                         Phelpmsg.Caption := '';
                         SendMessage(Pres.handle,WM_PAINT,0,0);
                         SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                         Exit;
                    end;

                    If Application.MessageBox('작업을 진행하면 당해년도 근태내역이 모두근태이력으로 옮겨집니다.'
                                             +#13+'작업을 진행하시겠습니까?','작업안내', MB_YesNo) = IDNO then
                    begin
                         Presult.Caption := '';
                         Gauge1.Progress := 0;
                         Phelpmsg.Caption := '';
                         SendMessage(Pres.handle,WM_PAINT,0,0);
                         SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                         Exit;
                    end;


                    {당년근태이력 갱신}
                    Gauge1.Progress := 30;
                    SendMessage(Pres.handle,WM_PAINT,0,0);
                    Presult.Caption := '';
                    Phelpmsg.Caption := ' 근태이력 갱신중 입니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pkhduhis                 ');
                    SQL.Add('       (select *                     ');
                    SQL.Add('          from pkhduty               ');
                    SQL.Add('         where duyymm like :duyymm)  ');
                    ParamByName('duyymm').AsString := IntToStr(SEyyyy.Value) + '%';
                    ExecSQL;

                    {작업일자,작업자 갱신}
                    Gauge1.Progress := 40;
                    Phelpmsg.Caption := '  작업일자,작업자 갱신중 입니다.';
                    SendMessage(Pres.handle,WM_PAINT,0,0);
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    Close;
                    SQL.Clear;
                    SQL.Add('update pkhduhis                   ');
                    SQL.Add('   set writetime = :LSsysdate,    ');
                    SQL.Add('       writeman  = :Pempno        ');
                    SQL.Add(' where duyymm like :duyymm        ');
                    ParamByName('LSsysdate').AsString := LSsysdate;
                    ParamByName('Pempno').AsString    := Pempno;
                    ParamByName('duyymm').AsString    := IntToStr(SEyyyy.Value) + '%';
                    ExecSQL;

                    {당년근태내역삭제}
                    Gauge1.Progress := 50;
                    Phelpmsg.Caption := '  근태내역자료 삭제중 입니다.....';
                    SendMessage(Pres.handle,WM_PAINT,0,0);
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from pkhduty        ');
                    SQL.Add(' where duyymm like :duyymm ');
                    ParamByName('duyymm').AsString    := IntToStr(SEyyyy.Value) + '%';
                    ExecSQL;

                    {이력작성건수}
                    Close;
                    SQL.Clear;
                    SQL.Add('select Count(*) a from pkhduhis   ');
                    SQL.Add(' where duyymm like :duyymm      ');
                    Open;

                    Presult.Caption := FieldByName('a').AsString;
                    Gauge1.Progress := 60;
                    SendMessage(Pres.handle,WM_PAINT,0,0);
               end;

          Except
               on E : EDataBaseError do
               begin
                    MessageBox(handle,StrPcopy(DBErrMsg,E.Message),'자료오류(개발부와 상의하세요)',MB_ICONERROR);
                    PhelpMsg.Caption := ' 자료오류로인해 진행중인작업을 복구하는중입니다... ';
                    SendMessage(phelpmsg.handle,WM_PAINT,0,0);
                    Phelpmsg.Caption := '  당해년도 근태이력갱신이 비정상종료되었습니다.....';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    qq.Free;
                    exit;
               end;
          end;
     Finally
          qq.Free;
     end;

     Phelpmsg.Caption := '  당해년도 근태이력갱신이 완료되었습니다.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
end;

{종료}
procedure TFpka40701.BBcloseClick(Sender: TObject);
begin
  If IDOK = Application.MessageBox('작업을 종료하시겠습니까?', '작업안내', mb_OKCancel) then Close;
end;

end.
