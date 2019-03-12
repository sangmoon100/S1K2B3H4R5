{-------------------------------------------------------------------------------
PROGRAM-NAME   : psc3110c.exe(우리사주 상환내역서 출력)
SYSTEM-NAME    : 종합인사정보
SUBSYSTEM-NAME : 복리후생(우리사주/대부 및 상환)
Programmer     : 김 한경
Version        : 1.00
Date           : 1997.10.31
Update Contents
  1.00    97.10.31       김한경     신규프로그램개발       상세처리명세서
-------------------------------------------------------------------------------}
unit psc31001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Spin, StdCtrls, Buttons, Mask, ExtCtrls, Pass,  KyempnoS,//Sempno,
  userhelp, Grids, FormMon1, DBGrids;    //Calen2,

type
  TMainForm = class(TForm)
    Shape7: TShape;
    Panel19: TPanel;
    BB_help: TBitBtn;
    BB_close: TBitBtn;
    BB_pset: TBitBtn;
    BB_prt: TBitBtn;
    p_help: TPanel;
    Panel2: TPanel;
    ME_exdate: TMaskEdit;
    SB_exdate: TSpeedButton;
    Panel6: TPanel;
    RB_personal: TRadioButton;
    E_empno: TEdit;
    SB_empno: TSpeedButton;
    P_korname: TPanel;
    RB_divdetail: TRadioButton;
    RB_divtotal: TRadioButton;
    Panel1: TPanel;
    Panel7: TPanel;
    RB_screen: TRadioButton;
    RB_printer: TRadioButton;
    DB1: TDatabase;
    Qry1: TQuery;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    Panel4: TPanel;
    Panel8: TPanel;
    Shape1: TShape;
    Label4: TLabel;
    Image1: TImage;
    L_empinfo: TLabel;
    L_sysdate: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Qry_pshlbas: TQuery;
    Qry_pshlbasCORPNAME: TStringField;
    Qry_pshlbasDIVSEQNUM: TFloatField;
    Qry_pshlbasSTCLASS: TStringField;
    Qry_pshlbasSTC: TStringField;
    Qry_pshlbasSTLORG: TStringField;
    Qry_pshlbasCODENAME: TStringField;
    procedure BB_prtClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SB_exdateClick(Sender: TObject);
    procedure SB_empnoClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure BB_psetClick(Sender: TObject);
    procedure BB_helpClick(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoExit(Sender: TObject);
    procedure Qry_pshlbasCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag : Boolean;
  public
    { Public declarations }
    function DateCheck(Sy,Sm,Sd : String) : Integer;
    procedure emp_korname;
    procedure init_code(const Codeids : Array of String);
    function PyccodeA(codeid,codeno : String) : String;
    procedure Ret_pshlbas;
  end;

var
  MainForm: TMainForm;
  GSempno    : String[4];
  GSkorname  : String[12];
  GSPassword : String[10];
  GSgrade    : String[10];
  GSsysdate  : String[15];
  stlname    : String[10];
implementation

uses psc31003, psc31004, psc31005;

{$R *.DFM}

procedure TMainForm.init_code(const Codeids : Array of String);
var
  i : Integer;
begin
  CodeString := TStringList.Create;
  DataString := TStringList.Create;

  Qry1.Close;
  Qry1.sql.Clear;
  Qry1.sql.Add('select codeid,codeno,codename from pyccode  ');
  Qry1.sql.Add('where  ');
  for i := 0 to High(codeids) - 1 do
    Qry1.sql.Add('(codeid = '''+Codeids[i]+''') or  ');
  Qry1.sql.Add('(codeid = '''+Codeids[High(codeids)]+''')  ');
  Qry1.Open;

  while not Qry1.EOF do
  begin
    CodeString.Add(Qry1.FieldByName('codeid').AsString +
                   Qry1.FieldByName('codeno').AsString);
    DataString.Add(Qry1.FieldByName('codename').AsString);
    Qry1.Next;
  end;
  Qry1.Close;
end;

function TMainForm.PyccodeA(codeid,codeno : String) : String;
var
  ind : Integer;
begin
  ind := CodeString.IndexOf(codeid + codeno);
  if ind > -1 then
    PyccodeA := DataString.Strings[ind]
  else
    PyccodeA := '';
end;

procedure TMainForm.emp_korname;
begin
  Qry1.Close;
  Qry1.sql.Clear;
  Qry1.sql.Add('select korname from psstmas where empno = '''+E_empno.Text+''' ');
  Qry1.Open;
  P_korname.Caption := Qry1.FieldByName('korname').AsString;
end;

//달력 validation check.........................................................
function TMainForm.DateCheck(Sy,Sm,Sd : String) : Integer;
var
  Lda : Double;
begin
  Try
    Lda := Encodedate(StrToInt(Sy),StrToInt(Sm),StrToInt(Sd));
    Except on E : EconvertError do begin
      DateCheck := -1;
      System.Exit;
    end else begin
      DateCheck := 0;
      System.Exit;
    end;
  end;
end;

procedure TMainForm.Ret_pshlbas;
begin
  Qry_pshlbas.close;
  Qry_pshlbas.sql.Clear;
  Qry_pshlbas.sql.Add('select A.corpname, A.divseqnum, A.stclass,             ');
  Qry_pshlbas.sql.Add('        decode(A.stclass, ''1'', ''사주우선'',         ');
  Qry_pshlbas.sql.Add('                         ''2'', ''사주실권'',          ');
  Qry_pshlbas.sql.Add('                         ''3'', ''주주우선'',          ');
  Qry_pshlbas.sql.Add('                         ''4'', ''주주우선(예탁)'',    ');
  Qry_pshlbas.sql.Add('                         ''5'', ''주주우선(비예탁)'',  ');
  Qry_pshlbas.sql.Add('                         '''') stc,                    ');
  Qry_pshlbas.sql.Add('       A.stlorg, B.codename                            ');
  Qry_pshlbas.sql.Add('from pshlbas A, pyccode B                              ');
  Qry_pshlbas.sql.Add('where B.codeid = ''K910'' and A.stlorg = B.codeno      ');
  Qry_pshlbas.sql.Add('order by A.corpname desc, A.divseqnum desc, A.stclass  ');
  Qry_pshlbas.Open;
end;

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
  DB1.Connected := True;

  init_code(['K910']);
  Qry1.Close;
  Qry1.sql.Clear;
  Qry1.sql.Add('select to_char(sysdate,''YYYYMMDDHH24MISSD'') T1 from dual  ');
  Qry1.Open;
  GSsysdate := Qry1.FieldByName('T1').AsString;

  L_empinfo.Caption := GSkorname + '(' + GSempno + ')';
  L_sysdate.Caption := Copy(GSsysdate,1,4) + '/' + Copy(GSsysdate,5,2) + '/' +
                       Copy(GSsysdate,7,2);
  Ret_pshlbas;
  p_help.Caption := ' 상환년월을 입력하세요.';
end;

// 달력(YYYYMM).................................................................
procedure TMainForm.SB_exdateClick(Sender: TObject);
begin
{  Calendar2 := TCalendar2.Create(Self);
  Try
    Calendar2.ShowModal;
    if Calendar2.GSym = '' then Exit;
      ME_exdate.Text := Calendar2.GSym;
  Finally
    Calendar2.Free;
  end;
}
    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
           ME_exdate.Text := Copy(MonthForm.DayCaption,1,6);//+'-'+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;
  P_help.Caption := '';
end;

// 사원조회.....................................................................
procedure TMainForm.SB_empnoClick(Sender: TObject);
begin
  FKyEmpnoS := TFKyEmpnoS.Create(Self);
  Try
    FKyEmpnoS.GSfromR := 'psstmas';
    FKyEmpnoS.ShowModal;
    if FKyEmpnoS.GIcloseS = -1 then Exit;
      E_empno.text := FKyEmpnoS.GSempnoS;
      P_korname.Caption := FKyEmpnoS.GSkornameS;
  Finally
    FKyEmpnoS.Free;
  end;
  P_help.Caption := '';
end;

// 종료.........................................................................
procedure TMainForm.BB_closeClick(Sender: TObject);
begin
  Close;
end;

// 프린터 설정.................................................................
procedure TMainForm.BB_psetClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

// 출력.........................................................................
procedure TMainForm.BB_prtClick(Sender: TObject);
var
  Sy,Sm : String;
begin
  P_help.Caption := ' 작업중입니다...';
  Application.ProcessMessages;
  
  Sy := Copy(ME_exdate.Text,1,4);
  Sm := Copy(ME_exdate.Text,5,2);

  if ME_exdate.Text = '' then
  begin
    P_help.Caption := ' 상환년월을 입력하세요.';
    System.Exit;
  end else
  if ME_exdate.Text <> '' then
  begin
    if DateCheck(Sy,sm,'01') = -1 then
    begin
      P_help.Caption := ' 상환년월을 확인하세요.';
      System.Exit;
    end;
  end;

  Print_personal.Get_datas1;
  Print_divtotal.Get_datas2;
  Print_divdetail.Get_datas3;

  if RB_personal.Checked = True then   // 개인별
  begin
    if E_empno.Text = '' then
    begin
      P_help.Caption := ' 사원을 입력하세요...';
      System.Exit;
    end else
    begin
      if Print_personal.Qry_personal.RecordCount = 0 then
      begin
        Application.MessageBox('해당자료가 없습니다.','작업안내',mb_ok);
        P_help.Caption := '';
        System.Exit;
      end;
      if RB_screen.Checked = True then
        Print_personal.QuickRep1.Preview
      else if RB_Printer.Checked = True then
      begin
        if PrintDialog1.Execute = True then
          Print_personal.QuickRep1.Print;
      end;
    end;
  end else
  if RB_divtotal.Checked = True then   // 차수별 총괄
  begin
    if Print_divtotal.Qry_divtotal.RecordCount = 0 then
    begin
      Application.MessageBox('해당자료가 없습니다.','작업안내',mb_ok);
      P_help.Caption := '';
      System.Exit;
    end;
    if RB_screen.Checked = True then
      Print_divtotal.QuickRep1.Preview
    else if RB_Printer.Checked = True then
    begin
      if PrintDialog1.Execute = True then
        Print_divtotal.QuickRep1.Print;
    end;
  end else
  if RB_divdetail.Checked = True then  // 차수별 세부
  begin
    if Print_divdetail.Qry_divdetail.RecordCount = 0 then
    begin
      Application.MessageBox('해당자료가 없습니다.','작업안내',mb_ok);
      P_help.Caption := '';
      System.Exit;
    end;
    if RB_screen.Checked = True then
      Print_divdetail.QuickRep1.Preview
    else if RB_Printer.Checked = True then
    begin
      if PrintDialog1.Execute = True then
        Print_divdetail.QuickRep1.Print;
    end;
  end;
  P_help.Caption := ' 작업을 완료했습니다.';
end;

procedure TMainForm.BB_helpClick(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  Try
    HelpForm.ProgramId := 'PSC3100C';
    HelpForm.ShowModal;
  Finally
    HelpForm.Free;
  end;
end;

procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    emp_korname;
  end;
end;

procedure TMainForm.E_empnoExit(Sender: TObject);
begin
  emp_korname;
end;

procedure TMainForm.Qry_pshlbasCalcFields(DataSet: TDataSet);
begin
//  stlname := PyccodeA('K910',Qry_pshlbas.FieldByName('stlorg').AsString);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     ActiveFlag := False;
end;

end.
