{=============================== Program Header ================================
 PROGRAM-NAME   : PSA3220A(사내근로복지기금 대출 지급등록)
 SYSTEM-NAME    : 복리후생
 SUBSYSTEM-NAME : 사내근로복지기금 대출
 Programmer     : 사내근로복지기금 대출 신청
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2012.6.08     이희용   신규개발                    노사협력팀 요청
================================================================================}

unit Psa32101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, DBTables, Gauges,
  OnFocusButton, OnLineLabel, OnScheme, OnEditStdCtrl, OnEditNumCtl,
  OnEditBaseCtrl;

type
  RDefault = ^RDefaultVal;
  RDefaultVal = record
    StartUp  : boolean;
    Empno    : string[4];
    Korname  : string[15];
    Pass     : string[15];
    Grade    : string[1];
    Userid   : string[15];
    Word     : string[15];
    Sysdate  : string[15];
    SDFM     : string[10];
    end;

type
  TFpsa32101 = class(TForm)
    Phelpmsg: TPanel;
    Database1: TDatabase;
    Query1: TQuery;
    SpeedButton1: TSpeedButton;
    Gauge: TGauge;
    SF_Main: TOnSchemeForm;
    Shape4: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Lworkman: TLabel;
    Lworkdate: TLabel;
    Panel4: TPanel;
    BBRun: TOnFocusButton;
    BBclose: TOnFocusButton;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OnSectionLabel1: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Pcount: TOnNumberEdit;
    Pmoney: TOnNumberEdit;
    OnEdit6: TOnEdit;
    Shape2: TShape;
    OnSectionLabel4: TOnSectionLabel;
    MEdate: TOnMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBRunClick(Sender: TObject);
    procedure MEdateEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEdateChange(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : array[0..255] of char;
    GRDefault : RDefault;
    GRDefaultAll : RDefaultVal;
    procedure FindComp(parameter : integer);
  public
    { Public declarations }
    procedure SetNow;
  end;

  function Query_Gen(parameter : widestring): boolean;
  function Modify_Gen(parameter : widestring): boolean;
var
  Fpsa32101: TFpsa32101;

implementation

uses Pass, kylib1, Calen1;  //UserHelp,
{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// 사용자 함수 ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

function Query_Gen(parameter : widestring): boolean;
begin
  with Fpsa32101.Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(parameter);
       Open;
  end;
  if Fpsa32101.Query1.RecordCount > 0 then     Query_Gen := True
  else                                         Query_Gen := False;
end;

function Modify_Gen(parameter : widestring): boolean;
begin
  with Fpsa32101.Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(parameter);

       ExecSql;
  end;
  Modify_Gen := True;
end;

procedure TFpsa32101.SetNow;
var
     par : widestring;
begin
  par := ' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D '+
         '   FROM DUAL                                     ';
  Query_Gen(par);
  GRDefault^.Sysdate := Query1.FieldByName('D').AsString;
end;

procedure TFpsa32101.FindComp(parameter : integer);
var
     i : smallint;
begin
  with Self do
  begin
       for i := 0 to ControlCount - 1 do
       begin
            if Controls[i].tag = 99 then
                 case parameter of
                      1: TPanel(Controls[i]).Caption := '0';
                      2: TPanel(Controls[i]).Caption := '';
                 end;
                 FindNextControl(Self, True, True, True);
       end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// 폼 이벤트 //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TFpsa32101.FormCreate(Sender: TObject);
begin
  GRDefault := @GRDefaultAll;
  GRDefault^.StartUp := False;
end;

procedure TFpsa32101.FormActivate(Sender: TObject);
var
     i : Integer;
begin
  if GRDefault^.StartUp = True then     Exit;

  GRDefault^.StartUp  := True;

  GRDefault^.Empno    := PassEmp(cmdline,1);
  GRDefault^.Korname  := PassEmp(cmdline,2);
  GRDefault^.Pass     := PassEmp(cmdline,3);
  GRDefault^.Grade    := Copy(PassEmp(cmdline,4),4,1);
  GRDefault^.Userid   := PassEmp(CmdLine,5);
  GRDefault^.Word     := PassEmp(CmdLine,6);

  DataBase1.Connected := False;
  for i := 0 to DataBase1.Params.count -1 do
  begin
       if System.Pos('SERVER NAME',DataBase1.Params[i]) > 0 then
            DataBase1.Params[i]  := 'SERVER NAME='+PassEmp(cmdline,13);
       if System.Pos('USER NAME',DataBase1.Params[i]) > 0 then
            DataBase1.Params[i]  := 'USER NAME='+GRDefault^.Userid;
       if System.Pos('PASSWORD',DataBase1.Params[i]) > 0 then
            DataBase1.Params[i] := 'PASSWORD='+GRDefault^.Word;
  end;
  DataBase1.Connected := True;

  SetNow;
  Application.ProcessMessages;
  Lworkdate.Caption := Copy(GRDefault^.sysdate, 1, 4)+'/'+
                       Copy(GRDefault^.sysdate, 5, 2)+'/'+
                       Copy(GRDefault^.sysdate, 7, 2);
  Lworkman.Caption  := GRDefault^.korname + '(' + GRDefault^.empno + ')';

  Gauge.Progress    := 0;
  FindComp(1);
  Phelpmsg.Caption  := '  대출상환일(급여일)을 입력하고 실행버튼을 누르십시오.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa32101.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa32101.BBRunClick(Sender: TObject);
label AA;
var
     par : widestring;
begin
  if Length(Trim(MEdate.Text)) = 8 then
  begin
       if DateCheck(Copy(Trim(MEdate.Text),1,4),
                    Copy(Trim(MEdate.Text),5,2),
                    Copy(Trim(MEdate.Text),7,2)) = -1 then
            goto AA;
  end
  else
  begin
      AA:
      MessageBox(handle, '대출상환일(급여일)확인바랍니다', '주의',
                 MB_SYSTEMMODAL + MB_ICONWARNING + MB_OK);
      MEdate.SetFocus;
      System.Exit;
  end;
  SetNow;
  DataBase1.StartTransaction;
  try  //사내복지기금 대출상환(급여)
       par := 'delete from PSNANGAMT where repldate = '''+Copy(Trim(MEdate.Text),1, 6)+''' ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 20;
       par := 'insert into PSNANGAMT '+  //대출상환(급여)
              '      (select a.repldate, a.empno, b.korname, '+
              '              sum(nvl(a.repamt,0)+nvl(a.repint,0)),  '+
              '              '''+Copy(GRDefault^.sysdate,1,15)+''', '+
              '              '''+GRDefault^.Empno+''' '+
              '         from PSNREPAY a, pscman b     '+                  //사내근로복지기금 대출상환, 상조회 상조회원
              '        where a.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''''+
              '          and a.repldate2 = '''+Trim(MEdate.Text)+''' '+
              '          and a.empno     = b.empno              '+
              '        group by a.repldate, a.empno, b.korname) ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 40;
       par := 'delete from PSNANGAMT '+  //대출상환(급여)
              ' where repldate = '''+Copy(Trim(MEdate.Text),1, 6)+''' '+
              '   and empno in (select a.empno from PSOREPAY a        '+  //사내근로복지기금 대출만기
              '                  where a.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''''+
              '                    and a.repldate2 = '''+Trim(MEdate.Text)+''') ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 60;
       par := 'insert into PSNANGAMT '+  //대출상환(급여)
              '(select a.repldate, a.empno, c.korname, sum(nvl(a.repamt,0)+nvl(a.repint,0))+ '+
              '        sum(nvl(b.repamt,0)+nvl(b.repint,0)), '''+Copy(GRDefault^.sysdate,1,15)+''','+
              '        '''+GRDefault^.Empno+''' '+
              '  from PSNREPAY a, PSOREPAY b, pscman c '+                  //사내근로복지기금 대출상환, 대출만기, 상조회 상조회원
              ' where a.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''' '+
              '   and a.repldate2 = '''+Trim(MEdate.Text)+''' '+
              '   and b.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''' '+
              '   and b.repldate2 = '''+Trim(MEdate.Text)+''' '+
              '   and a.empno     = b.empno '+
              '   and a.empno     = c.empno '+
              ' group by a.repldate, a.empno, c.korname) ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 80;
  except on E:EDataBaseError do
       begin
            MessageBox(Handle,StrPCopy(DBErrMsg, E.Message),'자료오류(개발부와 상의하세요)',
                       mb_iconerror);
            PhelpMsg.Caption := '   자료오류로 인해 진행중인작업을 복구하는 중입니다.';
            SendMessage(PhelpMsg.Handle, wm_paint, 0, 0);
            DataBase1.RollBack;
            FindComp(2);
            Gauge.Progress := 0;
            PhelpMsg.Caption := '   실행중 오류가 발생했습니다.';
            SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
            Exit;
       end;
  end; // try
  Database1.Commit;
  par := 'select count(*), sum(nvl(sangamt,0)) from PSNANGAMT where repldate = '''+Copy(Trim(MEdate.Text),1, 6)+''' ';
  if not Query_Gen(par) then
       FindComp(2)
  else
  begin
       Pcount.Text := FormatFloat('#,##0', Query1.Fields[0].AsFloat);
       Pmoney.Text := FormatFloat('#,##0', Query1.Fields[1].AsFloat);
  end;
  Application.ProcessMessages;
  Gauge.Progress   := 100;
  PhelpMsg.Caption := '   대출상환인원과 대출상환 총금액을 확인하십시오.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa32101.MEdateEnter(Sender: TObject);
begin
  FindComp(2);
end;

procedure TFpsa32101.SpeedButton1Click(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  try
       Calendar.ShowModal;
       if Calendar.DayCaption <> '' then
            MEdate.Text := Calendar.DayCaption;
  finally
       Calendar.Free;
  end;
end;

procedure TFpsa32101.MEdateChange(Sender: TObject);
begin
  Gauge.Progress := 0;
end;

end.
