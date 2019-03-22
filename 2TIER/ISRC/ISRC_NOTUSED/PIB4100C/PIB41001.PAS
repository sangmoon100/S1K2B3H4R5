{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIB4100C(무보직자 명단)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 김동철
Version         : 1.01
Date            : 1998.12.23
Update contents
  1.00   1996.04.30    김동철  신규프로그램개발 처리명세서
  1.01   1998.12.23    김혜진  직렬->직군,급호=>직급
                               미보임자추출조건 변경.
-----------------------------------------------------}

unit Pib41001;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, Quickrpt, TimeFtp,
  Pass, DateLib, DB, DBTables;

type
  TFpib41001 = class(TForm)
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel5: TPanel;
    RBlinecl: TRadioButton;
    RBdeptcl: TRadioButton;
    Panel7: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Seup: TBitBtn;
    Gauge1: TGauge;
    P_helpinfo_: TPanel;
    P_Help: TLabel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Label1: TLabel;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Btext: TBitBtn;
    RadioButton1: TRadioButton;
    Database1: TDatabase;
    Q_date: TQuery;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JobGubunClick(Sender: TObject);
    procedure BB_SeupClick(Sender: TObject);
    procedure DataProcess;
    procedure DataScreen;
    procedure DataPrinter;
    procedure DataFile;
    procedure ShowPreview;
    procedure FormPaint(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure BtextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    LPrtGubun : integer;
    AReport : TQuickRep;
    LBFsw : Boolean;
    function DataCheck : Boolean;
  public
    { Public declarations }
    GJobGubun : integer;
    PaintCount : integer;
    Pempno : string;
    Pkorname : string;
    Password : string;
  end;

var
  Fpib41001: TFpib41001;

implementation

{$R *.DFM}
uses pib41002, pib41003;

function TFpib41001.DataCheck : Boolean;
begin
     Fpib41002.QReportBeforePrint(LBFsw);
     if Fpib41002.Query1.RecordCount < 1 then
     begin
          ShowMessage('해당 자료가 없습니다 !!!');
          Gauge1.Progress := 0;
          Fpib41002.Query1.Close;
          DataCheck := False;
          System.Exit;
     end;
     DataCheck := True;
     System.Exit;
end;

procedure TFpib41001.BB_CloseClick(Sender: TObject);
begin
        close;
end;

procedure TFpib41001.FormActivate(Sender: TObject);
var
   SysDate : string;
begin
{     PaintCount := 0;
     Pempno := PassEmp(CmdLine, 1);
     Pkorname := PassEmp(CmdLine, 2);
     Password := PassEmp(CmdLine, 3);
     DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
     DataBase1.Params[16] := 'PASSWORD='  + PassEmp(cmdline, 6);}

     SysDate := TimeDate(Q_date);
     L_Date.Caption := Copy(SysDate, 1, 4) + '/' + Copy(SysDate, 5, 2) + '/' +
                       Copy(SysDate, 7, 2);
     GJobGubun := 1;
     LPrtGubun := 1;
     AReport := Fpib41002.QReport;
     RBlinecl.Setfocus;
     P_help.Caption := '작업조건을 확인후 실행하십시요.';
end;

procedure TFpib41001.JobGubunClick(Sender: TObject);
begin
     GJobGubun := TradioButton(Sender).Tag;
end;

procedure TFpib41001.BB_SeupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
     RBlinecl.Setfocus;
end;

procedure TFpib41001.DataProcess;
begin
     P_help.Caption := '작업중입니다.';
     Application.Processmessages;
     if DataCheck = False then
     begin
          RBlinecl.Setfocus;
          System.Exit;
     end;
     case LPrtGubun of
          1 : DataScreen;
          2 : DataPrinter;
          3 : DataFile;
     end;
     P_help.Caption := '작업이 완료되었습니다.';
     Fpib41002.Query1.Close;
     Fpib41002.Query2.Close;
     Gauge1.Progress := 0;
     RBlinecl.Setfocus;
end;

procedure TFpib41001.DataScreen;
begin
//     QRPrinter.OnPreview := ShowPreview;
     AReport.Preview;
     System.Exit;
end;

procedure TFpib41001.DataPrinter;
begin
     AReport.Print;
//     QRPrinter.Cleanup;
     System.Exit;
end;

procedure TFpib41001.DataFile;
begin
     ShowMessage('File');
     System.Exit;
end;

procedure TFpib41001.ShowPreview;
begin
     Fpib41003.ShowModal;
end;

procedure TFpib41001.FormPaint(Sender: TObject);
begin
     if PaintCount = 0 then            {처음 Paint시만 처리}
     begin
//        if PassDialog(Fpib41001, Pempno, Pkorname, Password) = False then
//           halt(0);
        L_Name.Caption := Pkorname +  '(' + Pempno + ')';
     end;
     PaintCount := 1;
end;

procedure TFpib41001.BscreenClick(Sender: TObject);
begin
     LprtGubun := 1;
     DataProcess;
end;

procedure TFpib41001.BprintClick(Sender: TObject);
begin
     LprtGubun := 2;
     DataProcess;
end;

procedure TFpib41001.BtextClick(Sender: TObject);
begin
     LprtGubun := 3;
     DataProcess;
end;

procedure TFpib41001.FormCreate(Sender: TObject);
begin
     PaintCount := 0;
     Pempno := PassEmp(CmdLine, 1);
     Pkorname := PassEmp(CmdLine, 2);
     Password := PassEmp(CmdLine, 3);
     DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
     DataBase1.Params[16] := 'PASSWORD='  + PassEmp(cmdline, 6);
end;

end.
