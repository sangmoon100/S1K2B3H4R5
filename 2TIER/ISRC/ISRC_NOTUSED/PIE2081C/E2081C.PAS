{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2081C(입직직현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 이희용
Version         : 1.00
Date            : 2011.03.23
Update contents
  1.00   2011.03.23   이희용  신규프로그램 개발
--------------------------------------------------------------------------------
}     
unit E2081C;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, IniFiles, DB,
  DBTables, QuickRpt, pass, datelib, Timeftp, Calen1;

type
  TFpie2081c = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Mfrym: TMaskEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Llastym: TLabel;
    Llastday: TLabel;
    Gauge1: TGauge;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    BBscreen: TBitBtn;
    BBprint: TBitBtn;
    BBsetup: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    Database1: TDatabase;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Label1: TLabel;
    Mtoym: TMaskEdit;
    Query1: TQuery;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    RB1: TRadioButton;
    RB2: TRadioButton;
    Panel7: TPanel;
    Query2: TQuery;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBscreenClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure MfrymDblClick(Sender: TObject);
    procedure MtoymDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    procedure GubunCheck;
  public
    { Public declarations }
    {QuickReport1 : TQuickReport;}
    AReport : TQuickRep;
    Pempno, Pkorname, Password : string;
    start : integer;
    payrachym : String;

  end;
var
  Fpie2081c : TFpie2081c;
  ErrorHelp : array[0..255] of char;
  Mrunym1,Mrunym2: String;
  gubunby   : Integer;
  bDoublePrt: boolean;
  datacnt   : Integer;
  
implementation
uses pie208110, pie208111;
{$R *.DFM}

procedure TFpie2081c.FormShow(Sender: TObject);
var
  lastym,lastday: String;
  i : integer;
begin
(*서버연결--------------------------------------------------------------------*)
  if Database1.Connected then Database1.Connected := False;
  for i := 0 to Database1.Params.Count-1 do
  begin
    if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
      Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
    if System.Pos('USER NAME', Database1.Params[i]) > 0 then
      Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
      Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
  end;

(*0.직위체계변경일자를 읽어온다-----------------------------------------------*)
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.ADD(' SELECT  VALUE3,VALUE4       ');
    Query1.SQL.ADD('   FROM  PIMVARI             ');
    Query1.SQL.ADD('  WHERE ((GUBUN =''00'') AND ');
    Query1.SQL.ADD('         (SGUBUN =''0001'')) ');
    Query1.Open;
  end;
  payrachym  := Query1.Fields[1].AsString;

(*1.통계최종작업년월과 통계최종작업일자를 읽어온다----------------------------*)
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.ADD(' SELECT  VALUE1,VALUE2       ');
    Query1.SQL.ADD('   FROM  PIMVARI             ');
    Query1.SQL.ADD('  WHERE ((GUBUN =''70'') AND ');
    Query1.SQL.ADD('         (SGUBUN =''0001'')) ');
    Query1.Open;
  end;
  lastym  := Query1.Fields[0].AsString;
  lastday := Query1.Fields[1].AsString;
  Llastym.Caption  := Copy(lastym,1,4)  +'/'+ Copy(lastym,5,2);
  Llastday.Caption := Copy(lastday,1,4) +'/'+ Copy(lastday,5,2) +'/'+ Copy(lastday,7,2);
  Mfrym.text       := Copy(lastym,1,6);
  Mtoym.text       := Copy(lastym,1,6);
  Query1.Close;
end;


Procedure TFpie2081c.GubunCheck;
begin
  GubunBy := 1;
  P_Help.Caption := '작업 처리중입니다.';
  Application.Processmessages;
  if RB1.Checked = True then GubunBy := 1
  else GubunBy := 2;
end;

procedure TFpie2081c.FormActivate(Sender: TObject);
begin
  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);
  start := 0;
  P_help.Caption := '작업조건을 확인후 실행하십시요.';
  Mfrym.Setfocus;
end;

procedure TFpie2081c.BBscreenClick(Sender: TObject);
var
  tlastym,tlastym1,HisYYMM : String;
begin
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select count(*) '+
            'from pihanno a, pimpmas b                                                      '+
            'where ancode in (''111'',''121'',''131'')                                      '+
            '  and substr(a.anfrdate,1,6) between '''+Mfrym.Text+''' and '''+Mtoym.Text+''' '+
            '  and a.empno = b.empno                                                        '+
            'group by substr(a.anfrdate,1,4)');
    Open;

    if RecordCount < 1 Then
    Begin
      P_Help.Caption := '조회된 자료가 없습니다.';
      Exit;
    End;
  end;

  Gauge1.Progress := 0;
  GubunCheck;
  Mrunym1 := Mfrym.Text;
  Mrunym2 := Mtoym.Text;
  tlastym := Llastym.Caption;
  tlastym1 := Copy(tlastym,1,4)+Copy(tlastym,6,2);
  if ((Mfrym.text > tlastym1) or (Mtoym.text > tlastym1) or (Mfrym.text > Mtoym.text)) then
  begin
     showmessage('작업년월을 확인하시오!');
  end
  else if  (Mrunym1 < '200404')  and (Mrunym2 >='200404') then
  begin
    HisYYMM := Mtoym.Text;
    MessageDlg('2004년 4월 직급체계변경으로 해당월을 기준으로'+#13+#10+
               ''+#13+#10+'구분하여 출력 하시기 바랍니다.'+#13+#10+
               ''+#13+#10+'[예] '+Mfrym.Text+' ~ '+ '200403'+
               ' 또는 200404 ~ '+Mtoym.Text,mtWarning, [mbOK], 0);
    Mtoym.Text := '200403';
    Mrunym2    :=  Mtoym.Text;
    P_Help.Caption := '먼저 2004년 3월까지의 자료부터 출력하세요!';
    bDoublePrt := True;
  end
  else
  begin
    (*2.레코드 유무 체크------------------------------------------------------*)
    begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD(' SELECT TONGYM ');
      Query1.SQL.ADD('   FROM PIHTONG ');
      Query1.SQL.ADD('  WHERE ((TONGYM >=:ltongfr) AND ');
      Query1.SQL.ADD('         (TONGYM <=:ltongto))    ');
      Query1.ParamByName('ltongfr').AsString := Mfrym.Text;

      //1998년에서 1999년에 걸치는 경우 1998년12월기준으로 자른다.
      if (Mfrym.Text < '199901') and (Mtoym.Text >= '199901') then
        mTOYM.Text := '199812';
       Query1.ParamByName('ltongto').AsString := Mtoym.Text;

      Query1.Open;
      datacnt:= Query1.RecordCount;
    end;

    if datacnt < 1 then showmessage('데이타가 없습니다.')
    else
    begin
      if mfrym.text < '200404' then
      begin
        showmessage('직급체계변경으로 2004년 4월이후 자료만 출력이 가능합니다.');
        Mfrym.Setfocus;
      end
      else
      begin
        if gubunby = 1 then  //년도별
        begin
          AReport := Fpie208110.QuickReport1;

          if ((Sender As TBitBtn).Tag = 1) then
            AReport.PreView
          else
            AReport.Print;
        end
        else                 //년도,월별
        begin
          AReport := Fpie208111.QuickReport1;

          if ((Sender As TBitBtn).Tag = 1) then
            AReport.PreView
          else
            AReport.Print;
        end;
      end;
    end;

    Gauge1.Progress := 0;
  end;
  P_Help.Caption := '작업이 완료되었습니다.';
end;

procedure TFpie2081c.BBsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFpie2081c.MfrymDblClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
    if Calendar.DayCaption <> '' then
      TMaskEdit(Sender).Text := Copy(Calendar.DayCaption,1,6);
  Finally
    Calendar.Free;
  End;
end;

procedure TFpie2081c.MtoymDblClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
    if Calendar.DayCaption <>'' then
      TMaskEdit(Sender).Text := Copy(Calendar.DayCaption,1,6);
  Finally
    Calendar.Free;
  End;
end;

procedure TFpie2081c.FormPaint(Sender: TObject);
var
rStr:string;
begin
  rStr := Timeftp.TimeDate(Query2);
  L_CurDate.Caption := Copy(rStr, 1, 4)+'/'+
                       Copy(rStr, 5, 2)+'/'+
                       Copy(rStr, 7, 2);

  if start = 0 then
  begin
    start := 1;
    L_UserName.Caption := pkorname+'('+pempno+')';
  end;
end;

procedure TFpie2081c.BBcloseClick(Sender: TObject);
begin
   close;
end;

end.
