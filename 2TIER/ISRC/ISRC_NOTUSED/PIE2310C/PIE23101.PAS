{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2340C (BAND별 월 인원현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      :
Version         : 1.00
Date            : 2005.02.14
Update contents
  버전     수정일     수정자   관련근거        수정내용
--------------------------------------------------------------------------------
  % 주의 : 아래의 코드내용이 바뀌더라도 기존반영사항은 놔둔다.(과거 자료를 볼수도 있으므로)  %
}

unit PIE23101;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt,  DBGrids, pass, Datelib, Timeftp,
  Db , ComObj, OleCtrls,Grids,kpaylib;

type
  TMainForm = class(TForm)

    Database1: TDatabase;
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel14: TPanel;
    P_Body: TPanel;
    ME_WorkDate: TMaskEdit;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel5: TPanel;
    G_Progress: TGauge;
    Panel16: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    Q_date: TQuery;
    Btext: TBitBtn;
    Query1: TQuery;
    SaveDialog1: TSaveDialog;
    NewQry: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);

  private
    pempno, pkorname, password: string;
    start: Integer;
    rStr: string;
    DataCount : integer;
    { Private declarations }
    Procedure Data_Display_csv(Sender: TObject);
    Procedure Data_Display1;  // 인력정원 관리현황
    procedure ShowPreView;
    procedure Update_History;
    procedure DataExist;   {자료존재여부 확인}
  public
    { Public declarations }
    AReport: TQuickRep;
    payrachym : String;
  end;

var
  MainForm: TMainForm;
  ErrorHelp  : array[0..255] of char;
  HomeDir    : string;
implementation

{$R *.DFM}

uses
  PIE23107, PIE23103;

// 자료 Excel 전환
procedure TMainForm.Data_Display_csv(Sender: TObject);
var
   Fexcel : textfile;
begin
   Application.ProcessMessages;
   assignfile(Fexcel, SaveDialog1.FileName);
   rewrite(Fexcel);
   writeln(Fexcel, ',,인,력,정,원(T/O),,관,리,현,황');
   writeln(Fexcel, '');
   writeln(Fexcel, '[기준년월] ,:, '+Copy(L_Date.Caption, 1, 4)+' 년' + Copy(L_Date.Caption, 6, 2)+' 월');
   writeln(Fexcel, '');
   writeln(Fexcel, ',,,정,규,직,,,,비,정,규,직');
   writeln(Fexcel, ',계획,현원,,근무인원,,,인력,운영,계획,현원,,근무인원,,인력,운영');
   writeln(Fexcel, '부서명,(T/O),총계,소계,팀장,팀원,휴직정직,T/O-현원,비율,(T/O),총계,전문,계약,일반,T/O-현원,비율');
   Data_Display1;
   with Newqry do
   begin
     First;
     while not Eof do
     begin
       P_Help.Caption := '인력정원(T/O) 관리현황을 추출합니다 !!.';
       SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
       writeln(Fexcel,
                      FieldByName('DEPTNAME' ).AsString +','+
                      FieldByName('T1'       ).AsString +','+
                      FieldByName('T2'       ).AsString +','+
                      FieldByName('T3'       ).AsString +','+
                      FieldByName('T4'       ).AsString +','+
                      FieldByName('T5'       ).AsString +','+
                      FieldByName('T6'       ).AsString +','+
                      FieldByName('T7'       ).AsString +','+
                      FieldByName('T8'       ).AsString +','+
                      FieldByName('T9'       ).AsString +','+
                      FieldByName('T10'      ).AsString +','+
                      FieldByName('T11'      ).AsString +','+
                      FieldByName('T12'      ).AsString +','+
                      FieldByName('T13'      ).AsString +','+
                      FieldByName('T14'      ).AsString +','+
                      FieldByName('T15'      ).AsString );

       Next;
     end;
   end;
   closefile(Fexcel);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if Start = 0 then
  begin
    pempno   := PassEmp(cmdline, 1);
    pkorname := PassEmp(cmdline, 2);
    password := PassEmp(cmdline, 3);
    DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
    DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
    DataBase1.Params[19] := 'PASSWORD='  + PassEmp(cmdline, 6);
    HomeDir := HomeDirOpen;
  end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  if start = 0 then begin
     start := 1;
     Application.ProcessMessages;
     Try
        Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO begin
        MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
        halt(1);
     end;
     END;

     rStr := TimeDate(Q_date);

     L_Date.Caption := Copy(rStr, 1, 4)+'/'+
                       Copy(rStr, 5, 2)+'/'+
                       Copy(rStr, 7, 2);

     ME_WorkDate.Text := Copy(rStr, 1, 6); // 작업년도

     Query1.Close;
     Query1.Sql.Clear;
     Query1.Sql.Add(' SELECT  VALUE3, VALUE4  FROM PIMVARI             ');
     Query1.Sql.Add('  WHERE  GUBUN =''00'' AND SGUBUN = ''0001''      ');
     Query1.Open;
     payrachym    := Query1.FieldByName('VALUE4').AsString;
     Query1.Close;

     P_Help.Caption := '';
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{-----------------------------------------------------------}
procedure TMainForm.ShowPreView;
begin
  PreViewForm := TPreViewForm.Create(self);
  PreViewForm.ShowModal;
  PreViewForm.Free;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    if FileExists(HomeDir+'\list\PIE2310C.tmp') = True then begin
       DeleteFile(PChar(HomeDir+'\list\PIE2310C.tmp'));
       DeleteFile(PChar(HomeDir+'\list\PIE2310C.dat'));
       DeleteFile(PChar(HomeDir+'\list\temp_c.tmp'));
    end;
    Close;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
   P_Help.Caption := '인력정원(T/O) 관리현황을 추출합니다 !!.';

   SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

   if length(trim(ME_WorkDate.Text)) < 6  then
   begin
      MessageBox(handle,'작업년월 오류입니다.','에  러',MB_OK or $0020);
      ME_WorkDate.SetFocus;
      System.Exit;
   end;

   AReport := NewPrintForm.InReport;

   if FileExists(HomeDir+'\list\PIE2310C.tmp') = True then begin
      DeleteFile(PChar(HomeDir+'\list\PIE2310C.tmp'));
      DeleteFile(PChar(HomeDir+'\list\PIE2310C.dat'));
      DeleteFile(PChar(HomeDir+'\list\temp_c.tmp'));
   end;


   if TBitBtn(Sender).Name = 'BB_Print' then     // 인쇄
   begin
      DataExist;
      if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
      else
      begin
         Data_Display1;
         AReport.Print;
      end;
   end
   else if TBitBtn(Sender).Name = 'BB_Screen' then   //화면출력
   begin
      DataExist;
      if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
      else
      begin
         Data_Display1;
         AReport.PreView;
      end;
   end
   else if TBitBtn(Sender).Name = 'Btext' then     //excel 변환
   begin
      SaveDialog1.FileName := '인력정원(TO)관리현황_'+Copy(rStr,1,8)+'.csv';

      if saveDialog1.Execute then
      begin
         Data_Display_csv(Sender);
         Update_History; //log 남기기 위해 2002.06.25 shm 추가
      end
      else
      begin
         G_Progress.progress := 00;
         P_Help.Caption := '작업을 취소 했습니다.';
         Application.ProcessMessages;
         exit;
      end;
   end;

   P_Help.Caption := '작업이 완료되었습니다.';
   G_Progress.Progress := 0;
   Screen.Cursor := crDefault;
end;

procedure TMainForm.Update_History;
var
   Temp_no    : Integer;
begin
   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
   Query1.Sql.Add('  WHERE  PROGID = ''PIE2310C''               ');
   Query1.Open;
   Temp_No    := Query1.FieldByName('NO').AsInteger + 1;
   Query1.Close;


   Query1.Sql.Clear;
   Query1.Sql.Add('INSERT INTO PYMPHIS                                      ');
   Query1.Sql.Add('   ( NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS )  ');
   Query1.Sql.Add('VALUES                                                   ');
   Query1.Sql.Add('   (                                                     ');
   Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                 );
   Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PIE2310C'',     ');
   Query1.Sql.Add('       '''+RSTR+''',                                     ');
   Query1.Sql.Add('       ''인력정원(T/O) 관리현황을 EXCEL 화일로 출력한다.'')  ');
   Query1.ExecSQL;
   Query1.Close;
end;

// 인력정원 관리현황
procedure TMainForm.Data_Display1;
begin
  with Newqry do
  begin
    Close;
    ParamByName('WORKYYMM').AsString  := ME_WorkDate.Text;
    ParamByName('payrachym').AsString := payrachym;
    Open;
    if Eof then
    begin
      MessageDlg('출력할  데이터가 없습니다.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;


Procedure TMainForm.DataExist;
begin
     DataCount := 0;
     begin
          Query1.Close;
          Query1.SQL.Clear;
          Query1.SQL.ADD('SELECT COUNT(*) CNT FROM PIHPMAS ');
          Query1.SQL.ADD(' WHERE WORKYYMM = ''' + ME_WorkDate.Text + ''' ');
          Query1.Open;
          DataCount := Query1.FieldByName('CNT').AsInteger;
//          DataCount := Query1.RecordCount;
          Query1.Close;
     end;
end;


end.

