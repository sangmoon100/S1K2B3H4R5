{-------------------------------------------------------------------------------
PROGRAM-NAME   : psc3040c.exe(우리사주 대부내역서 출력)
SYSTEM-NAME    : 종합인사정보
SUBSYSTEM-NAME : 복리후생(우리사주/대부 및 상환)
Programmer     : 김 한경
Version        : 1.00
Date           : 1997.10.31
Update Contents
  1.00    97.10.31       김한경     신규프로그램개발       상세처리명세서
-------------------------------------------------------------------------------}
unit psc30401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Spin, DBTables, Db, Pass, Qrctrls,
  qrprntr, quickrpt, userhelp, TimeFtp;

type
  TMainForm = class(TForm)
    Panel19: TPanel;
    BB_help: TBitBtn;
    BB_close: TBitBtn;
    BB_pset: TBitBtn;
    BB_prt: TBitBtn;
    p_help: TPanel;
    Shape7: TShape;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    RB_screen: TRadioButton;
    RB_printer: TRadioButton;
    SE_divseqnum: TSpinEdit;
    CB_stclass: TComboBox;
    Qry1: TQuery;
    DB1: TDatabase;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    Qry2: TQuery;
    Panel8: TPanel;
    Shape1: TShape;
    Label4: TLabel;
    Image1: TImage;
    L_empinfo: TLabel;
    L_sysdate: TLabel;
    Panel3: TPanel;
    Panel10: TPanel;
    CB_corpname: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure BB_psetClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure SE_divseqnumChange(Sender: TObject);
    procedure BB_prtClick(Sender: TObject);
    procedure CB_stclassChange(Sender: TObject);
    procedure BB_helpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ActiveFlag : Boolean;
  public
    { Public declarations }
  end;

var
  MainForm   : TMainForm;
  GSempno    : String[4];
  GSkorname  : String[12];
  GSPassword : String[10];
  GSgrade    : String[10];
  GSsysdate  : String[15];
implementation

uses psc30402,psc30403;

{$R *.DFM}

// 초기화.......................................................................
procedure TMainForm.FormActivate(Sender: TObject);
var
  i : Integer;
begin
  if not ActiveFlag then
     ActiveFlag := True
  else
     System.Exit;

  GSempno := PassEmp(cmdline,1);
  GSkorname := PassEmp(cmdline,2);
  GSPassword := PassEmp(cmdline,3);
  GSgrade := Copy((PassEmp(cmdline,4)),4,1);
  Application.ProcessMessages;

  for i := 0 to DB1.Params.Count - 1 do
  begin
    if System.Pos('SERVER NAME',DB1.Params[i]) > 0 then
      DB1.Params[i] := 'SERVER NAME=' + PassEmp(cmdline,13);
    if Pos('USER NAME',DB1.Params[i]) > 0 then
      DB1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if Pos('PASSWORD',DB1.Params[i]) > 0 then
     DB1.Params[i]  := 'PASSWORD='+PassEmp(CmdLine,6);
  end;
  DB1.connected := True;

  CB_CorpName.Text := '하나로';

  Qry2.Close;
  Qry2.sql.Clear;
  Qry2.sql.Add(' select Min(divseqnum) M1, Max(divseqnum) M2   ');
  Qry2.sql.Add(' from   pslmas                                 ');
  Qry2.sql.Add(' where  corpname = ''하나로''                  ');
  Qry2.Open;

  PrintForm.init_code(['K910']);
  SE_divseqnum.Value := Qry2.FieldByName('M2').AsInteger;

  GSsysdate := TimeDate(Qry1);

  L_empinfo.Caption := GSkorname + '(' + GSempno + ')';
  L_sysdate.Caption := Copy(GSsysdate,1,4) + '/' + Copy(GSsysdate,5,2) + '/' +
                       Copy(GSsysdate,7,2);
end;

procedure TMainForm.CB_stclassChange(Sender: TObject);
begin
  P_help.Caption := '';
end;

// 프린터 설정..................................................................
procedure TMainForm.BB_psetClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

// 종료.........................................................................
procedure TMainForm.BB_closeClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.SE_divseqnumChange(Sender: TObject);
begin
  if SE_divseqnum.Value < 1 then
    SE_divseqnum.Value := 1
end;

// 출력..........................................................................
procedure TMainForm.BB_prtClick(Sender: TObject);
begin
  PrintForm.Get_datas;
  if PrintForm.QryA.RecordCount = 0 then
  begin
    Application.MessageBox('해당자료가 없습니다.','작업안내',mb_ok);
    P_help.Caption := '';
    System.Exit;
  end;

  PrintForm.Get_Nextdatas;
  p_help.Caption := ' 작업중입니다...';
  Application.ProcessMessages;

  if RB_Printer.checked = True then
  begin
    if PrintDialog1.Execute = True then
      PrintForm.QuickRep1.Print;
  end else
  if RB_screen.Checked = True then
  begin
    PrintForm.QuickRep1.Preview;
  end;
  P_help.Caption := ' 작업을 완료했습니다.';
end;

// 도움말.......................................................................
procedure TMainForm.BB_helpClick(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  Try
    HelpForm.ProgramId := 'PSC3040C';
    HelpForm.ShowModal;
  Finally
    HelpForm.Free;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     ActiveFlag := False;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
