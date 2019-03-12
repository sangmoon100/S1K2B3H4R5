{-------------------------------------------------------------------------------
  PROGRAM-NAME   : 사우회 대출상환 급여이체
  SYSTEM-NAME    : 종합인사정보시스템
  SUBSYSTEM-NAME : 복리후생(사우회)
  PROGRAMMER     : 차정훈
  VERSION        : 1.00
  DATE           : 1997.10.31
  UPDATE CONTENTS
   1.00  97.10.31     차정훈        신규프로그램개발           상세처리명세서
-------------------------------------------------------------------------------}
unit Psa31001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Db, DBTables, Gauges;

type
  TFpsa31001 = class(TForm)
    Panel19: TPanel;
    Shape7: TShape;
    Phelpmsg: TPanel;
    Panel8: TPanel;
    Lworkman: TLabel;
    Lworkdate: TLabel;
    Panel9: TPanel;
    BBRun: TBitBtn;
    BBclose: TBitBtn;
    Panel11: TPanel;
    Panel12: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel14: TPanel;
    Bevel1: TBevel;
    Pcount: TPanel;
    Database1: TDatabase;
    Query1: TQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Pmoney: TPanel;
    MEdate: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Gauge: TGauge;
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
    vStartUp  : boolean;
    vEmpno    : string;
    vKorname  : string;
    vPass     : string;
    vGrade    : string;
    vUserid   : string;
    vWord     : string;
    vSysdate  : string;
    vSDFM     : string;

    procedure FindComp(parameter : integer);
  public
    { Public declarations }
    procedure SetNow;
  end;

  function Query_Gen(parameter : widestring): boolean;
  function Modify_Gen(parameter : widestring): boolean;
  function CheckOfPayDate(parameter : widestring): string;
var
  Fpsa31001: TFpsa31001;

implementation

uses Pass, kylib1, Calen1;  //UserHelp,
{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// 사용자 함수 ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

function Query_Gen(parameter : widestring): boolean;
begin
  with Fpsa31001.Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(parameter);
       Open;
  end;
  if Fpsa31001.Query1.RecordCount > 0 then     Query_Gen := True
  else                                         Query_Gen := False;
end;

function Modify_Gen(parameter : widestring): boolean;
begin
  with Fpsa31001.Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(parameter);
       ExecSql;
  end;
  Modify_Gen := True;
end;

function CheckOfPayDate(parameter : widestring): string;
var
     par : widestring;
begin
  par := 'select payib'+Copy(parameter,6,1)+' from psmpayib '+
         ' where year = '''+Copy(parameter,1,4)+'''         ';
  if Query_Gen(par) then
       CheckOfPayDate := Fpsa31001.Query1.Fields[0].AsString
  else
       CheckOfPayDate := '';
end;

procedure TFpsa31001.SetNow;
var
     par : widestring;
begin
  par := ' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D '+
         '   FROM DUAL                                     ';
  Query_Gen(par);
  vSysdate := Query1.FieldByName('D').AsString;
end;

procedure TFpsa31001.FindComp(parameter : integer);
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

procedure TFpsa31001.FormCreate(Sender: TObject);
begin
//  GRDefault := @GRDefaultAll;
  vStartUp := False;
end;

procedure TFpsa31001.FormActivate(Sender: TObject);
var
     i : Integer;
begin
  if vStartUp = True then     Exit;

  vStartUp  := True;

  vEmpno    := PassEmp(cmdline,1);
  vKorname  := PassEmp(cmdline,2);
  vPass     := PassEmp(cmdline,3);
  vGrade    := Copy(PassEmp(cmdline,4),4,1);
  vUserid   := PassEmp(CmdLine,5);
  vWord     := PassEmp(CmdLine,6);

  DataBase1.Connected := False;
  for i := 0 to DataBase1.Params.count -1 do
  begin
       if System.Pos('SERVER NAME',DataBase1.Params[i]) > 0 then
            DataBase1.Params[i]  := 'SERVER NAME='+PassEmp(cmdline,13);
       if System.Pos('USER NAME',DataBase1.Params[i]) > 0 then
            DataBase1.Params[i]  := 'USER NAME='+vUserid;
       if System.Pos('PASSWORD',DataBase1.Params[i]) > 0 then
            DataBase1.Params[i] := 'PASSWORD='+vWord;
  end;
  DataBase1.Connected := True;

//  GRDefault^.SDFM := SystemDateFormatMask;
  SetNow;
  Application.ProcessMessages;
  Lworkdate.Caption := Copy(vsysdate, 1, 4)+'/'+
                       Copy(vsysdate, 5, 2)+'/'+
                       Copy(vsysdate, 7, 2);
  Lworkman.Caption  := vkorname + '(' + vempno + ')';

  Gauge.Progress    := 0;
//  MEdate.Text := CheckOfPayDate(GRDefault^.sysdate);
  FindComp(1);
  Phelpmsg.Caption  := '  대출상환일(급여일)을 입력하고 실행버튼을 누르십시오.';
  SendMessage(Phelpmsg.Handle, WM_Paint , 0, 0);
end;

procedure TFpsa31001.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa31001.BBRunClick(Sender: TObject);
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
  try
       par := 'delete from pssangamt where repldate = '''+Copy(Trim(MEdate.Text),1, 6)+''' ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 20;
       par := 'insert into pssangamt                                           '+#13+
              '      (select a.repldate, a.empno, b.korname,                   '+#13+
              '              sum(nvl(a.repamt,0)+nvl(a.repint,0)),             '+#13+
              '              '''+Copy(vsysdate,1,15)+''',            '+#13+
              '              '''+vEmpno+'''                          '+#13+
              '         from psdrepay a, pscman b                              '+#13+
              '        where a.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''''+#13+
              '          and a.repldate2 = '''+Trim(MEdate.Text)+'''           '+#13+
              '          and a.empno     = b.empno                             '+#13+
              '        group by a.repldate, a.empno, b.korname)                ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 40;
       par := 'delete from pssangamt                                                     '+
              ' where repldate = '''+Copy(Trim(MEdate.Text),1, 6)+'''                    '+
              '   and empno in (select a.empno from pshrepay a                           '+
              '                  where a.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''''+
              '                    and a.repldate2 = '''+Trim(MEdate.Text)+''')          ';
       Modify_Gen(par);
       Application.ProcessMessages;
       Gauge.Progress := 60;
       par := 'insert into pssangamt                                     '+
              '(select a.repldate, a.empno, c.korname,                   '+
              '        sum(nvl(a.repamt,0)+nvl(a.repint,0))+             '+
              '        sum(nvl(b.repamt,0)+nvl(b.repint,0)),             '+
              '        '''+Copy(vsysdate,1,15)+''',            '+
              '        '''+vEmpno+'''                          '+
              '  from psdrepay a, pshrepay b, pscman c                   '+
              ' where a.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''' '+
              '   and a.repldate2 = '''+Trim(MEdate.Text)+'''            '+
              '   and b.repldate  = '''+Copy(Trim(MEdate.Text),1, 6)+''' '+
              '   and b.repldate2 = '''+Trim(MEdate.Text)+'''            '+
              '   and a.empno     = b.empno                              '+
              '   and a.empno     = c.empno                              '+
              ' group by a.repldate, a.empno, c.korname)                 ';
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
  par := 'select count(*), sum(nvl(sangamt,0)) from pssangamt where repldate = '''+Copy(Trim(MEdate.Text),1, 6)+''' ';
  if not Query_Gen(par) then
       FindComp(2)
  else
  begin
       Pcount.Caption := FormatFloat('#,##0', Query1.Fields[0].AsFloat);
       Pmoney.Caption := FormatFloat('#,##0', Query1.Fields[1].AsFloat);
  end;
  Application.ProcessMessages;
  Gauge.Progress   := 100;
  PhelpMsg.Caption := '   대출상환인원과 대출상환 총금액을 확인하십시오.';
  SendMessage(Phelpmsg.Handle, wm_paint, 0, 0);
end;

procedure TFpsa31001.MEdateEnter(Sender: TObject);
begin
  FindComp(2);
end;

procedure TFpsa31001.SpeedButton1Click(Sender: TObject);
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

procedure TFpsa31001.MEdateChange(Sender: TObject);
begin
  Gauge.Progress := 0;
end;

end.
