unit Pkg20301;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Mask, Buttons, ExtCtrls,
  pass, Datelib, Timeftp,FormMon1, Gauges, Qrprntr, MemDS, DBAccess, Ora, Func; // calen2,->FormMon1

type
  TMainForm = class(TForm)
    Phelpmsg: TPanel;
    Panel3: TPanel;
    BB_close: TBitBtn;
    BB_run: TBitBtn;
    BB_prnsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SB_bonyymm: TSpeedButton;
    Panel5: TPanel;
    ME_bonyymm: TMaskEdit;
    Panel12: TPanel;
    Panel7: TPanel;
    Bevel1: TBevel;
    Shape1: TShape;
    Image1: TImage;
    Label2: TLabel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    RB_printer: TRadioButton;
    RB_screen: TRadioButton;
    Bevel2: TBevel;
    Panel2: TPanel;
    P_WorkCond: TPanel;
    RB_empno: TRadioButton;
    RB_deptcode: TRadioButton;
    Panel4: TPanel;
    Gauge1: TGauge;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    OraQuery1: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure SB_bonyymmClick(Sender: TObject);
    procedure BB_runClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure BB_prnsetupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);     {코드조회}

  private
    { Private declarations }

  public
    { Public declarations }
    Query_Search: TOraQuery;
    Max_orgnum: string[3];
    function  PriorMonth(yyyymm: String): string;
  end;

var
  MainForm: TMainForm;
  Running: Boolean;

implementation
{$R *.DFM}

uses pkg20303;

{-------------------------------- MAIN ---------------------------------}
procedure TMainForm.FormCreate(Sender: TObject);
begin
     Running := False;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
     if Running then System.Exit;

     Running := True;
     Application.ProcessMessages;

     OraConnect;

     Lempinfo.Caption := Pkorname + '(' +Pempno+ ')';

     PhelpMsg.Caption := '  초기자료를 읽고있습니다.';

     Lsysdate.Caption := fn_GetDateStr;
     ME_bonyymm.Text := Copy(RemoveChar(Lsysdate.Caption,'/'),1,6);

     Max_orgnum := GetOrgNum;


     PhelpMsg.Caption := '';
end;


{달의 이전달}
function TMainForm.PriorMonth(yyyymm: String): string;
var
     i: Integer;
     yyyy, mm: Integer;
begin
     yyyy := StrToInt(copy(yyyymm,1,4));
     mm   := StrToInt(copy(yyyymm,5,2));
     if mm = 1 then
     begin
          Dec(yyyy);
          mm := 12;
     end
     else
     begin
          Dec(mm);
     end;
     PriorMonth := format('%.4d%.2d', [yyyy,mm]);
end;

{-------------------------------- EVENT -----------------------------}
procedure TMainForm.SB_bonyymmClick(Sender: TObject);
begin
    Try 
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           ME_bonyymm.Text := Copy(MonthForm.DayCaption,1,6); 
    Finally 
        MonthForm.Free; 
    End; 


{     Calendar2 := TCalendar2.Create(Self);
     Try
          Calendar2.ShowModal;
          if Calendar2.GIcloseChk = 0 then
               ME_bonyymm.Text := Calendar2.GSym;
     Finally
          Calendar2.Free;
     end;}
end;

{실행...}
procedure TMainForm.BB_runClick(Sender: TObject);
begin
     if System.Length(ME_bonyymm.Text) <> 6 then
     begin
          MessageBox(Handle, '작업기준년월을 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          System.Exit;
     end;

     Phelpmsg.Caption := '  작업조건에 맞는 자료를 추출중입니다.';
     Application.ProcessMessages;

     printform := TPrintform.create(application);

     Query_Search := OraQuery1;
     Query_Search.Session := Ora_Session;

     if RB_empno.Checked then
     begin
          with Query_Search do
          begin
               Close;
               SQL.Clear;
               SQL.Add('(                                        ');
               SQL.Add('    select a.empno ,                     ');
               SQL.Add('           a.korname ,                   ');
               SQL.Add('           a.orgnum ,                    ');
               SQL.Add('           a.deptcode ,                  ');
               SQL.Add('           a.pstate ,                    ');
               SQL.Add('           a.payyn ,                     ');
               SQL.Add('           a.liceamt ,                   ');
               SQL.Add('           nvl(b.liceamt, 0) e_pkmcalc   ');
               SQL.Add('      from pkmpmas a, pkhphis b          ');
               SQL.Add('     where a.empno = b.empno             ');
               SQL.Add('       and b.paydate = :p_paydate        ');
               SQL.Add('       and a.liceamt <> b.liceamt        ');
               SQL.Add(')                                        ');
               SQL.Add('union                                    ');
               SQL.Add('(                                        ');
               SQL.Add('    (  select a.empno,                   ');
               SQL.Add('              a.korname ,                ');
               SQL.Add('              a.orgnum ,                 ');
               SQL.Add('              a.deptcode ,               ');
               SQL.Add('              a.pstate ,                 ');
               SQL.Add('              a.payyn ,                  ');
               SQL.Add('              a.liceamt ,                ');
               SQL.Add('              0 e_pkmcalc                ');
               SQL.Add('         from pkmpmas a                  ');
               SQL.Add('        where a.liceamt > 0              ');
               SQL.Add('    )                                    ');
               SQL.Add('    minus                                ');
               SQL.Add('    (  select a.empno ,                  ');
               SQL.Add('              a.korname ,                ');
               SQL.Add('              a.orgnum ,                 ');
               SQL.Add('              a.deptcode ,               ');
               SQL.Add('              a.pstate ,                 ');
               SQL.Add('              a.payyn ,                  ');
               SQL.Add('              a.liceamt ,                ');
               SQL.Add('              0 e_pkmcalc                ');
               SQL.Add('         from pkmpmas a, pkhphis b       ');
               SQL.Add('        where a.empno = b.empno          ');
               SQL.Add('          and b.paydate = :p_paydate     ');
               SQL.Add('          and a.liceamt > 0              ');
               SQL.Add('    )                                    ');
               SQL.Add(')                                        ');
               SQL.Add('order by 1                               ');
               PrintForm.QRL_KindOfOrder.Caption := '사번순';
               ParamByName('P_paydate').AsString := PriorMonth(ME_bonyymm.Text);
          end;
     end
     else
     begin
          with Query_Search do
          begin
               Close;
               SQL.Clear;
               SQL.Add('(                                        ');
               SQL.Add('    select a.empno ,                     ');
               SQL.Add('           a.korname ,                   ');
               SQL.Add('           a.orgnum ,                    ');
               SQL.Add('           a.deptcode ,                  ');
               SQL.Add('           a.pstate ,                    ');
               SQL.Add('           a.payyn ,                     ');
               SQL.Add('           a.liceamt ,                   ');
               SQL.Add('           nvl(b.liceamt, 0) e_pkmcalc   ');
               SQL.Add('      from pkmpmas a, pkhphis b          ');
               SQL.Add('     where a.empno = b.empno             ');
               SQL.Add('       and b.paydate = :p_paydate        ');
               SQL.Add('       and a.liceamt <> b.liceamt        ');
               SQL.Add('       and a.orgnum = :p_orgnum          ');
               SQL.Add(')                                        ');
               SQL.Add('union                                    ');
               SQL.Add('(                                        ');
               SQL.Add('    (  select a.empno,                   ');
               SQL.Add('              a.korname ,                ');
               SQL.Add('              a.orgnum ,                 ');
               SQL.Add('              a.deptcode ,               ');
               SQL.Add('              a.pstate ,                 ');
               SQL.Add('              a.payyn ,                  ');
               SQL.Add('              a.liceamt ,                ');
               SQL.Add('              0 e_pkmcalc                ');
               SQL.Add('         from pkmpmas a                  ');
               SQL.Add('        where a.liceamt > 0              ');
               SQL.Add('          and a.orgnum = :p_orgnum       ');
               SQL.Add('    )                                    ');
               SQL.Add('    minus                                ');
               SQL.Add('    (  select a.empno ,                  ');
               SQL.Add('              a.korname ,                ');
               SQL.Add('              a.orgnum ,                 ');
               SQL.Add('              a.deptcode ,               ');
               SQL.Add('              a.pstate ,                 ');
               SQL.Add('              a.payyn ,                  ');
               SQL.Add('              a.liceamt ,                ');
               SQL.Add('              0 e_pkmcalc                ');
               SQL.Add('         from pkmpmas a, pkhphis b       ');
               SQL.Add('        where a.empno = b.empno          ');
               SQL.Add('          and b.paydate = :p_paydate     ');
               SQL.Add('          and a.liceamt > 0              ');
               SQL.Add('          and a.orgnum = :p_orgnum       ');
               SQL.Add('    )                                    ');
               SQL.Add(')                                        ');
               SQL.Add('order by 3,4,1                           ');
               PrintForm.QRL_KindOfOrder.Caption := '부서/사번순';
               ParamByName('P_orgnum').AsString  := Max_orgnum;
               ParamByName('P_paydate').AsString := PriorMonth(ME_bonyymm.Text);
          end;
     end;

     Query_Search.Open;

     if Query_Search.RecordCount = 0 then
     begin
          Application.MessageBox('작업조건에 맞는 자료가 한건도 없습니다.',
                                 '작업안내', mb_Ok);
          Phelpmsg.Caption := '';

          printform.free;

          System.Exit;
     end;

     PrintForm.QRL_bonyymm.Caption := copy(ME_bonyymm.Text,1,4)+'.'+copy(ME_bonyymm.Text,5,2);

     if RB_printer.Checked then
     begin
          printform.user_preview := false;
          PrintForm.QReport.Print;
          QRPrinter.Cleanup;
          printform.free;
     end
     else
     begin
          PrintForm.QReport.Preview;
          QRPrinter.Cleanup;
     end;
     
     Phelpmsg.Caption := '  출력을 완료하였습니다.';
     Gauge1.Progress := 0;
     Query_Search.Close;
end;

{프린터설정}
procedure TMainForm.BB_prnsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

{종료}
procedure TMainForm.BB_closeClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

end.
