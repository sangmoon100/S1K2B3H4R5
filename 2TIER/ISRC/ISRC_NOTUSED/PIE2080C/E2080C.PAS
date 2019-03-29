{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2080C(퇴직현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 정재헌
Version         : 1.00
Date            : 1996.6.29
Update contents
  1.00   1996.06.29   정재헌  신규프로그램 개발  처리명세서
  3.01   2001.08.08   서혜미  자체               통계에서 자료불러올때 현차수만 불러오도록 수정.
  3.02   2002.06.04   서혜미  자체               계산 변수 오류, clear 추가(pie20807)
  30.10  2003.09.18   이민용  최상용과장 요청    연평균인원구하는 식변경 및 리포트에 추가
  30.11  2003.09.18   정규용  최상용과장 요청    퇴직현황은 발령테이블(PIHANNO)에서 가져옴(변경)
  30.12  2003.12.10   정규용  최상용과장 요청    당연면직 제거 기능 추가및 기타 오류 수정
  30.13  2004.07.20   정규용                     직급체계 변경관련 레포트 추가 
--------------------------------------------------------------------------------
}

unit E2080c;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, IniFiles, DB,
  DBTables, QuickRpt, pass, datelib, Timeftp, Calen1;

type
  TFpie2080c = class(TForm)
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
    RB3: TRadioButton;
    RB4: TRadioButton;
    Panel7: TPanel;
    Query2: TQuery;
    Panel15: TPanel;
    RGdangYN: TRadioGroup;
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
    procedure ShowPreView;
    procedure GubunCheck;
  public
    { Public declarations }
    {QuickReport1 : TQuickReport;}
    AReport : TQuickRep;
    Pempno, Pkorname, Password : string;
    start : integer;
    YearCheck : string;
    payrachym : String;
  end;
var
  Fpie2080c: TFpie2080c;
  ErrorHelp : array[0..255] of char;
  Mrunym1,Mrunym2: String;
  gubunby : Integer;
  bDoublePrt : boolean;
implementation
uses Pie20801,Pie20803,Pie20804,Pie20805, pie20806, pie20807,
  pie20808, pie20809, pie208010, pie208011, pie208012, pie208013;
{$R *.DFM}

procedure TFpie2080c.FormShow(Sender: TObject);
var
  lastym,lastday: String;
  i : integer;
begin
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
{0.직위체계변경일자를 읽어온다...........................}
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


{1.통계최종작업년월과 통계최종작업일자를 읽어온다...........................}
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
  {1.의 끝...................................................................}
end;

Procedure TFpie2080c.ShowPreView;
begin
//     Fpie20802.ShowModal;
end;

Procedure TFpie2080c.GubunCheck;
begin
  GubunBy := 1;
  P_Help.Caption := '작업 처리중입니다.';
  Application.Processmessages;
  if RB1.Checked = True then begin
     GubunBy := 1;
     end
  else
  if RB2.Checked = True then begin
     GubunBy := 2;
     end
  else
  if RB3.Checked = True then begin
     GubunBy := 3;
     end
  else
  if RB4.Checked = True then begin
     GubunBy := 4;
     end;
end;

procedure TFpie2080c.FormActivate(Sender: TObject);
begin
  pempno   := PassEmp(cmdline, 1);
  pkorname := PassEmp(cmdline, 2);
  password := PassEmp(cmdline, 3);
  start := 0;
  P_help.Caption := '작업조건을 확인후 실행하십시요.';
  Mfrym.Setfocus;
end;

procedure TFpie2080c.BBcloseClick(Sender: TObject);
begin
   close;
end;

procedure TFpie2080c.BBscreenClick(Sender: TObject);
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
         {2.레코드 유무 체크................................................}
         begin
         Query1.Close;
         Query1.SQL.Clear;
         Query1.SQL.ADD(' SELECT TONGYM ');
         Query1.SQL.ADD('   FROM PIHTONG ');
         Query1.SQL.ADD('  WHERE ((TONGYM >=:ltongfr) AND ');
         Query1.SQL.ADD('         (TONGYM <=:ltongto))    ');
         Query1.ParamByName('ltongfr').AsString := Mfrym.Text;
         //khj  1998년에서 1999년에 걸치는 경우 1998년12월기준으로 자른다.
         if (Mfrym.Text < '199901') and (Mtoym.Text >= '199901') then
            mTOYM.Text := '199812';
           Query1.ParamByName('ltongto').AsString := Mtoym.Text;

         Query1.Open;     //1111111
         datacnt:= Query1.RecordCount;
         end;
         {2.의 끝...........................................................}
         if datacnt < 1 then begin
            showmessage('데이타가 없습니다.');
            end
         else begin
           if mfrym.text <= '199812' then begin
              YearCheck := 'Old';     //  1999년 1월 이전 자료에 대한 처리
              {1.구분에 따라 출력조건을 바꾼다......}
              if gubunby = 1 then begin
//                 AReport := Fpie20801.QuickReport1;
                 AReport.PreView;
              end
              else
              if gubunby = 2 then begin
                 AReport := Fpie20803.QuickReport1;
                 AReport.PreView;
                 end
              else
              if gubunby = 3 then begin
                 AReport := Fpie20804.QuickReport1;
                 AReport.PreView;
              end
              else
              if gubunby = 4 then begin
                 AReport := Fpie20805.QuickReport1;
                 AReport.PreView;
               end;
            end else if mfrym.text < '200404' then
            begin
              {1.구분에 따라 출력조건을 바꾼다......}
              if gubunby = 1 then begin
                 AReport := Fpie20806.QuickReport1;
                 AReport.PreView;
              end
              else
              if gubunby = 2 then begin
                 AReport := Fpie20807.QuickReport1;
                 AReport.PreView;
                 end
              else
              if gubunby = 3 then begin
                 AReport := Fpie20808.QuickReport1;
                 AReport.PreView;
              end
              else
              if gubunby = 4 then begin
                 AReport := Fpie20809.QuickReport1;
                 AReport.PreView;
               end;
            end
            else begin// 2004년 4월 부터
              if gubunby = 1 then begin
                 AReport := Fpie208010.QuickReport1;

                 if (Sender as TBitBtn).Tag = 0 then
                   AReport.PreView
                 else
                   AReport.Print;
              end
              else
              if gubunby = 2 then begin
                 AReport := Fpie208011.QuickReport1;

                 if (Sender as TBitBtn).Tag = 0 then
                   AReport.PreView
                 else
                   AReport.Print;
                 end
              else
              if gubunby = 3 then begin
                 AReport := Fpie208012.QuickReport1;

                 if (Sender as TBitBtn).Tag = 0 then
                   AReport.PreView
                 else
                   AReport.Print;
              end
              else
              if gubunby = 4 then begin
                 AReport := Fpie208013.QuickReport1;

                 if (Sender as TBitBtn).Tag = 0 then
                   AReport.PreView
                 else
                   AReport.Print;
               end;
            end;
            {1.의 끝..............................}
         end;
            Gauge1.Progress := 0;
            Fpie20801.Query1.Close;
            Fpie20801.Query2.Close;
            Fpie20801.Query3.Close;
            Fpie20801.Query4.Close;
            Fpie20803.Query1.Close;
            Fpie20803.Query2.Close;
            Fpie20803.Query3.Close;
            Fpie20803.Query4.Close;
            Fpie20804.Query1.Close;
            Fpie20804.Query2.Close;
            Fpie20804.Query3.Close;
            Fpie20804.Query4.Close;
            Fpie20805.Query1.Close;
            Fpie20805.Query2.Close;
            Fpie20805.Query3.Close;
            Fpie20805.Query4.Close;
            Fpie20806.Query1.Close;
            Fpie20806.Query2.Close;
            Fpie20806.Query3.Close;
            Fpie20806.Query4.Close;
            Fpie20807.Query1.Close;
            Fpie20807.Query2.Close;
            Fpie20807.Query3.Close;
            Fpie20807.Query4.Close;
            Fpie20808.Query1.Close;
            Fpie20808.Query2.Close;
            Fpie20808.Query3.Close;
            Fpie20808.Query4.Close;
            Fpie20809.Query1.Close;
            Fpie20809.Query2.Close;
            Fpie20809.Query3.Close;
            Fpie20809.Query4.Close;
     end;
     P_Help.Caption := '작업이 완료되었습니다.';
end;

procedure TFpie2080c.BBsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFpie2080c.MfrymDblClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
    if Calendar.DayCaption <>'' then TMaskEdit(Sender).Text := Copy(Calendar.DayCaption,1,6);
  Finally
    Calendar.Free;
  End;
end;

procedure TFpie2080c.MtoymDblClick(Sender: TObject);
begin
  Calendar := TCalendar.Create(Self);
  Try
    Calendar.ShowModal;
    if Calendar.DayCaption <>'' then TMaskEdit(Sender).Text := Copy(Calendar.DayCaption,1,6);
  Finally
    Calendar.Free;
  End;
end;

procedure TFpie2080c.FormPaint(Sender: TObject);
var
rStr:string;
begin
  rStr := Timeftp.TimeDate(Query2);
  L_CurDate.Caption := Copy(rStr, 1, 4)+'/'+
                       Copy(rStr, 5, 2)+'/'+
                       Copy(rStr, 7, 2);

  if start = 0 then
  begin
//if not pass.PassDialog(Self, pempno, pkorname, password) then
//   System.Halt(0);
    start := 1;
    L_UserName.Caption := pkorname+'('+pempno+')';
  end;
end;

end.
