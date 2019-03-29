{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2060C(직급/직렬별인원현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 박규석
Version         : 30.00
Date            : 1999.01.05
Update contents
   버전    수정일     수정자   수정내용            관련근거
  1.00    1996.6.22   정재헌   신규프로그램 개발   처리명세서
  30.00   1999.01.05  박규석   직위,직급수정       하나로인사재개발
  30.01   2004.07.15  정규용   직급체계변경관련 신규레포트 작성
  30.02  2005.05.27   변춘미   영문 출력 추가
--------------------------------------------------------------------------------
}

 unit E2060c;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, Gauges, DB,
  DBTables, QuickRpt,  Pass, TimeFtp,DateLib;  //TimeFtp,

type
  TFpie2060c = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Mrunyymm: TMaskEdit;
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
    Query1: TQuery;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Panel11: TPanel;
    Query2: TQuery;
    Bevel1: TBevel;
    RBkor: TRadioButton;
    RBeng: TRadioButton;
    Panel12: TPanel;
    Panel10: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBscreenClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MrunyymmKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    AReport : TQuickRep;
    DataCount : integer;
    procedure DataExist;   {자료존재여부 확인}
  public
    { Public declarations }
    {QuickReport1 : TQuickReport;}
    PaintCount : integer;
    Pempno, Pkorname, Password : string;
    YearCheck  : string;
    payrachym  : String;
  end;

var
  Fpie2060c: TFpie2060c;
  ErrorHelp : array[0..255] of char;
  Mrunym: String[20];
implementation
uses Pie20603, Pie20604, Pie20606;
{$R *.DFM}

procedure TFpie2060c.FormShow(Sender: TObject);
var
lastym,lastday: String;
begin
   DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
   DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
   DataBase1.Params[16] := 'PASSWORD='  + PassEmp(cmdline, 6);

   {
   // 1.통계최종작업년월과 통계최종작업일자를 읽어온다...........................
   begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD('SELECT VALUE1,VALUE2 FROM PIMVARI ');
      Query1.SQL.ADD(' WHERE GUBUN =:LGUBUN AND SGUBUN =:LSGUBUN ');
      Query1.ParamByName('lgubun').AsString  := '70';
      Query1.ParamByName('lsgubun').AsString := '0001';
      Query1.Open;
   end;
   }
   // 직위체계변경일를 가져온다
   begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD('SELECT VALUE3,VALUE4 FROM PIMVARI          ');
      Query1.SQL.ADD(' WHERE GUBUN =:LGUBUN AND SGUBUN =:LSGUBUN ');
      Query1.ParamByName('lgubun').AsString  := '00';
      Query1.ParamByName('lsgubun').AsString := '0001';
      Query1.Open;
      payrachym := Query1.Fields[1].AsString;
   end;
   // 현재일자를 가져온다
   begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD('SELECT TO_CHAR(SYSDATE, ''YYYYMMDD'') FROM DUAL ');
      Query1.Open;
   end;

   lastym  := Query1.Fields[0].AsString;
//   lastday := Query1.Fields[1].AsString;
   Llastym.Caption  := Copy(lastym,1,4)+'/'+Copy(lastym,5,2);
   Llastday.Caption := Copy(lastym,1,4)+'/'+Copy(lastym,5,2)+'/'+Copy(lastym,7,2);
   Mrunyymm.text    := Copy(lastym,1,6);
   Query1.Close;
   // 1.의 끝...................................................................
end;

Procedure TFpie2060c.DataExist;
begin
   DataCount := 0;
   begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD('SELECT COUNT(*) CNT FROM PIHTONG ');
      Query1.SQL.ADD(' WHERE TONGYM = ''' + Mrunyymm.Text + ''' ');
      Query1.Open;
      DataCount := Query1.FieldByName('CNT').AsInteger;
//      DataCount := Query1.RecordCount;
      Query1.Close;
   end;
end;

procedure TFpie2060c.FormActivate(Sender: TObject);
begin
   Try
      Database1.Connected := True;
   EXCEPT ON E : EDataBaseError Do
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message+'DB 접속 실패'),'에 러',MB_OK or $0010);
   END;
   PaintCount := 0;
   Pempno := PassEmp(CmdLine, 1);
   Pkorname := PassEmp(CmdLine, 2);
   Password := PassEmp(CmdLine, 3);

   AReport := Fpie20603.QuickReport1;
   P_help.Caption := '작업조건을 확인후 실행하십시요.';
   Mrunyymm.SetFocus;
   Mrunyymm.SelectAll;
end;

procedure TFpie2060c.BBcloseClick(Sender: TObject);
begin
   close;
end;

procedure TFpie2060c.BBscreenClick(Sender: TObject);
var
   tlastym,tlastym1 : String;
begin
   Mrunym  := Mrunyymm.Text;
   tlastym := Llastym.Caption;
   tlastym1 := Copy(tlastym,1,4)+Copy(tlastym,6,2);
   P_help.Caption := '작업중입니다.';
   Application.Processmessages;

{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
   if Mrunyymm.text >= tlastym1 then
   begin
//      DataExist;
//      if (DataCount < 1) then ShowMessage('해당자료가 없습니다.')
//      else
      if RBeng.Checked then
         Fpie20606.Inreport.Preview
      else
         Fpie20604.Inreport.Preview;
   end
   else if Mrunym < '199901' then      //  1999년 1월 이전 자료에 대한 처리
   begin
      YearCheck := 'Old';
      DataExist;
      if DataCount < 1 then
         ShowMessage('해당자료가 없습니다.')
      else
      begin
         AReport := Fpie20603.QuickReport1;
         AReport.PreView;
         Fpie20603.Query1.Close;
      end;
   end
   else if Mrunym < '200404' then      //  2004년 4월 이전 자료에 대한 처리
   begin
      DataExist;
      if DataCount < 1 then
         ShowMessage('해당자료가 없습니다.')
      else
      begin
         AReport := Fpie20603.QuickReport1;
         AReport.PreView;
         Fpie20603.Query1.Close;
      end
   end
   else
   begin
      if RBeng.Checked then
         Fpie20606.Inreport.Preview
      else
         Fpie20604.Inreport.Preview;
   end;
   P_help.Caption := '작업이 완료되었습니다.';
   Mrunyymm.SetFocus;
end;

procedure TFpie2060c.BBprintClick(Sender: TObject);
var
   tlastym,tlastym1 : String;
begin
   Mrunym  := Mrunyymm.Text;
   tlastym := Llastym.Caption;
   tlastym1 := Copy(tlastym,1,4)+Copy(tlastym,6,2);
   P_help.Caption := '작업중입니다.';
   Application.Processmessages;

{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
   if Mrunyymm.text >= tlastym1 then
//      Fpie20604.Inreport.Preview
   begin
      if RBeng.Checked then
         Fpie20606.Inreport.Print
      else
         Fpie20604.Inreport.Print;
   end
   else if Mrunym < '199901' then      //  1999년 1월 이전 자료에 대한 처리
   begin
      YearCheck := 'Old';
      DataExist;
      if DataCount < 1 then
         ShowMessage('해당자료가 없습니다.')
      else
      begin
         AReport := Fpie20603.QuickReport1;
         AReport.Print;
         Fpie20603.Query1.Close;
      end;
   end
   else
   begin
      DataExist;
      if DataCount < 1 then
         ShowMessage('해당자료가 없습니다.')
      else
      begin
         if RBeng.Checked then begin
            AReport := Fpie20606.InReport;
            AReport.Print;
            Fpie20606.Qry_Mas.Close;
         end
         else begin
            AReport := Fpie20604.InReport;
            AReport.Print;
            Fpie20604.Qry_Mas.Close;
         end;
      end
   end;
   P_help.Caption := '작업이 완료되었습니다.';
   Mrunyymm.SetFocus;
end;

procedure TFpie2060c.FormPaint(Sender: TObject);
var
   CurDate:string;
begin
   CurDate := TimeDate(Query2);
   L_CurDate.Caption  := copy(CurDate,1,4)+'/'+copy(CurDate,5,2)+'/'+copy(CurDate,7,2);

   if PaintCount = 0 then
   begin
//      if PassDialog(Fpie2060c, Pempno, Pkorname, Password) = False then
//         halt(0);
      L_UserName.Caption := pkorname + '(' + pempno + ')';
   end;
   PaintCount := 1;
end;

procedure TFpie2060c.MrunyymmKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      BBscreen.SetFocus;
end;

end.
