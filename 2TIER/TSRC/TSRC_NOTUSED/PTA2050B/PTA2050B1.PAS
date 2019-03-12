{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIA1050A(인사기록표)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 서혜미
Version         : 1.0
Date            : 2001.02.09
Update contents
    버전   수정일      수정자  관련근거           수정내용
    1.06   2002.09.13  손종운   전산처리:2002-4636 Query 수정
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------}
unit pta2050b1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, Mask, ExtCtrls, pebtnedit, peempnobtnedit,
  Timeftp,DB,pass, DBTables;

type 
  TMain_Form = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel6: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel7: TPanel;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel4: TPanel;
    BBscreen: TBitBtn;
    BBprint: TBitBtn;
    BBsetup: TBitBtn;
    BBclose: TBitBtn;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel11: TPanel;
    ExamdateFR: TMaskEdit;
    ExamdateTO: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BBexcel: TBitBtn;
    EmpnoFR: TEdit;
    PayclFR: TEdit;
    PayclTO: TEdit;
    EmpnoTO: TEdit;
    Payclfr_na: TPanel;
    Payclto_na: TPanel;
    EmpnoFR_na: TPanel;
    EmpnoTO_na: TPanel;
    SaveDialog1: TSaveDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel5: TPanel;
    P_help: TPanel;
    Panel9: TPanel;
    ExamscoreFR: TMaskEdit;
    ExamscoreTO: TMaskEdit;
    Rabasdate: TMaskEdit;
    Query1: TQuery;
    procedure BBcloseClick(Sender: TObject);
    procedure EmpnoFRDblClick(Sender: TObject);
    procedure EmpnoTODblClick(Sender: TObject);
    procedure PayclFRDblClick(Sender: TObject);
    procedure BBscreenClick(Sender: TObject);
    procedure EmpnoFRExit(Sender: TObject);
    procedure PayclFRExit(Sender: TObject);
    procedure BBexcelClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure EmpnoFRKeyPress(Sender: TObject; var Key: Char);
  private
    Curdate : string;
    examdate_FR : integer;
    examdate_TO : integer;
    procedure Update_History;
    { Private declarations }

  public
    { Public declarations }
    start: Integer;
    pempno, pkorname, password: string;
    HomeDir      : String;
    Sys_date     : String;
    i_rabasdate  : String;
    im_rabasdate : Integer;
    ii_rabasdate : String;
    function Datacheck:Boolean;
  end;

var
  Main_Form: TMain_Form;

implementation

uses peDM, pta2050b2, pta2050b3, PayclCode;


{$R *.DFM}

procedure TMain_Form.BBcloseClick(Sender: TObject);
begin
  close;
end;

procedure TMain_Form.FormPaint(Sender: TObject);
var
  i: Integer;
begin
  if Start  = 0 then begin
     Start := 1;
     Application.ProcessMessages;
//     Memo1.Visible  := False;

     pempno   := PassEmp(cmdline, 1);
     pkorname := PassEmp(cmdline, 2);
     password := PassEmp(cmdline, 3);
     L_UserName.Caption := pkorname+'('+pempno+')';
     HomeDir  := HomeDirOpen;

     Application.ProcessMessages;
     DM.Database1.Params[0] := 'SERVER NAME='+PassEmp(CmdLine,13);
     DM.Database1.Params[1] := 'USER NAME='+PassEmp(CmdLine,5);
     DM.Database1.Params[16]:= 'PASSWORD='+PassEmp(CmdLine,6);
     Try
       DM.Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO
        MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
     END;

     Datacheck; 
     CurDate := Timeftp.TimeDate(DM.Q_temp);
     Rabasdate.text := Copy(CurDate, 1,4);
     L_CurDate.Caption   :=   Copy(CurDate, 1,4)+'/'+
                              Copy(CurDate, 5,2)+'/'+
                              Copy(CurDate, 7,2);
     Examdate_FR         :=   StrtoInt(Rabasdate.text);
     Examdate_FR         :=   Examdate_FR - 2;
     ExamdateFR.Text     :=   InttoStr(Examdate_FR) +'01'+'01';
     Examdate_TO         :=   StrtoInt(Rabasdate.text);     
     Examdate_TO         :=   Examdate_TO - 1;
//     ExamdateTO.Text     :=   InttoStr(Examdate_TO) +'12'+'31';
     ExamdateTO.Text     :=    Copy(CurDate, 1, 8);
  end;
end;


procedure TMain_Form.EmpnoFRDblClick(Sender: TObject);
begin
  Fkyempno.Eempno.Text := EmpnoFR.Text;
  Fkyempno.ShowModal;
  if Fkyempno.GIcloseS <> -1 then
  begin
    EmpnoFR.Text       := Fkyempno.GSempnoS;
    EmpnoFR_na.Caption := Fkyempno.GSkornameS;
  end;
end;

procedure TMain_Form.EmpnoTODblClick(Sender: TObject);
begin
  Fkyempno.Eempno.Text := EmpnoTO.Text;
  Fkyempno.ShowModal;
  if Fkyempno.GIcloseS <> -1 then
  begin
    EmpnoTO.Text       := Fkyempno.GSempnoS;
    EmpnoTO_na.Caption := Fkyempno.GSkornameS;
  end;
end;

procedure TMain_Form.PayclFRDblClick(Sender: TObject);
begin
  codeForm := TCodeForm.Create(self);

  codeForm.FormData  := 'BAND코드 열람';
  codeForm.DataVal1  := 'I112';

  codeForm.ShowModal;

  if CodeForm.Code = '' then System.Exit;
  Try
    case Tcomponent(Sender).Tag of
         3 : begin
             PayclFR.Text        := CodeForm.Code;
             PayclFR_na.Caption  := CodeForm.CodeName;
             end;
         4 : begin
             PayclTO.Text        := CodeForm.Code;
             PayclTO_na.Caption  := CodeForm.CodeName;
             end;
    end;

  Finally
    codeForm.Free;
  end;
end;

procedure TMain_Form.BBscreenClick(Sender: TObject);
begin
  if  Datacheck = True  then
  begin
      Application.ProcessMessages;
      QReport1.preview;
  end;
end;

procedure TMain_Form.EmpnoFRExit(Sender: TObject);
begin
   with DM.Q_temp do
   begin
      Close;
      SQL.Clear;
      SQL.Add( 'Select Korname  from  pimpmas               ');
      SQL.Add( ' where Empno =  :Acc_empno                  ');

        case Tcomponent(Sender).Tag of
             1 : begin
                 ParamByName('Acc_empno').AsString := EmpnoFR.Text;
                 Open;
                 EmpnoFR_na.Caption := FieldByName('Korname').AsString;
                 end;
             2 : begin
                 ParamByName('Acc_empno').AsString := EmpnoTO.Text;
                 Open;
                 EmpnoTO_na.Caption := FieldByName('Korname').AsString;
                 end;
        end;
      Close;
   end;
end;

procedure TMain_Form.PayclFRExit(Sender: TObject);
begin
   with DM.Q_temp do
   begin
      Close;
      SQL.Clear;
      SQL.Add( 'Select codename  from  pyccode               ');
      SQL.Add( ' where codeid =  ''I112''                    ');
      SQL.Add( '   and codeno =  :Acc_paycl                  ');

        case Tcomponent(Sender).Tag of
             3 : begin
                 ParamByName('Acc_paycl').AsString := PayclFR.Text;
                 Open;
                 PayclFR_na.Caption := FieldByName('codename').AsString;
                 end;
             4 : begin
                 ParamByName('Acc_paycl').AsString := PayclTO.Text;
                 Open;
                 PayclTO_na.Caption := FieldByName('codename').AsString;
                 end;
        end;
      Close;
   end;
end;

procedure TMain_Form.BBexcelClick(Sender: TObject);
var
  F : textfile;
  i: Integer;
  app, WorkBooks :Variant;
begin
  if  Datacheck = True  then
      QReport1.Process
  else
      System.Exit;

  saveDialog1.DefaultExt := 'xls';
  saveDialog1.filter     := 'microsoft excel 통합문서(*.xls)';

  if saveDialog1.Execute then
  begin
   TRY
     assignfile(F, SaveDialog1.FileName);
     rewrite(F);
     writeln(F, '사번'+#9+'성명'+#9+'점수'+#9+'시험종류'+#9+'응시일'+#9+'입사일'+#9+'승격일'+#9+'입사구분');
     DM.Q_Fore.First;              //+'BAND'+#9

     while (not DM.Q_Fore.eof) do
      begin
         writeln(F,DM.Q_Fore.FieldByName('Empno').AsString              + #9 +
                   DM.Q_Fore.FieldByName('Korname').AsString            + #9 +
//                   DM.Q_Fore.FieldByName('Payclname').AsString          + #9 +
                   DM.Q_Fore.FieldByName('Examscore12').AsString        + #9 +
                   DM.Q_Fore.FieldByName('Exname').AsString             + #9 +
                   Copy(DM.Q_Fore.FieldByName('Examdate').AsString,1,4) +'/'+
                   Copy(DM.Q_Fore.FieldByName('Examdate').AsString,5,2) +'/'+
                   Copy(DM.Q_Fore.FieldByName('Examdate').AsString,7,2) + #9 +
                   Copy(DM.Q_Fore.FieldByName('Empdate').AsString,1,4)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Empdate').AsString,5,2)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Empdate').AsString,7,2)  + #9 +
                   Copy(DM.Q_Fore.FieldByName('Cardate').AsString,1,4)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Cardate').AsString,5,2)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Cardate').AsString,7,2)  + #9 +
                   DM.Q_Fore.FieldByName('Empname').AsString);
         DM.Q_Fore.Next;
      end;
//     end;
     writeln(F,'');


{     DM.Q_Fore.first;
     memo1.lines.clear;
     memo1.Lines.add('사번'+#9+'성명'+#9+'BAND'+#9+'점수'+#9+'시험종류'+#9+'응시일'+#9+'입사일'+#9+'승격일'+#9+'입사구분');
     while (not DM.Q_Fore.eof) do
      begin
         memo1.lines.add(DM.Q_Fore.FieldByName('Empno').AsString  + #9 +
                   DM.Q_Fore.FieldByName('Korname').AsString      + #9 +
                   DM.Q_Fore.FieldByName('Payclname').AsString    + #9 +
                   DM.Q_Fore.FieldByName('Examscore12').AsString  + #9 +
                   DM.Q_Fore.FieldByName('Exname').AsString       + #9 +
                   Copy(DM.Q_Fore.FieldByName('Examdate').AsString,1,4) +'/'+
                   Copy(DM.Q_Fore.FieldByName('Examdate').AsString,5,2) +'/'+
                   Copy(DM.Q_Fore.FieldByName('Examdate').AsString,7,2) + #9 +
                   Copy(DM.Q_Fore.FieldByName('Empdate').AsString,1,4)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Empdate').AsString,5,2)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Empdate').AsString,7,2)  + #9 +
                   Copy(DM.Q_Fore.FieldByName('Cardate').AsString,1,4)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Cardate').AsString,5,2)  +'/'+
                   Copy(DM.Q_Fore.FieldByName('Cardate').AsString,7,2)  + #9 +
                   DM.Q_Fore.FieldByName('Empname').AsString);
         DM.Q_Fore.Next;
      end;
  saveDialog1.DefaultExt := 'xls';
  saveDialog1.filter     := 'microsoft excel 통합문서(*.xls)';
  if saveDialog1.Execute then
  begin
       memo1.Lines.SaveToFile(saveDialog1.filename);
  end;}


// end;

     FINALLY
       closefile(F);
       MessageDlg('화일로 저장되었습니다.!',mtinformation,[mbok],0);
       Update_History; //log 남기기 위해 2002.06.26 shm 추가
     END;
  end;
end;

procedure TMain_Form.Update_History;
var
  Temp_no    : Integer;
begin
     Query1.Close;
     Query1.Sql.Clear;
     Query1.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
     Query1.Sql.Add('  WHERE  PROGID = ''PTA2050B''               ');
     Query1.Open;
     Temp_No    := Query1.FieldByName('NO').AsInteger + 1;
     Query1.Close;


     Query1.Sql.Clear;
     Query1.Sql.Add('INSERT INTO PYMPHIS                                                  ');
     Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
     Query1.Sql.Add('VALUES                                                               ');
     Query1.Sql.Add('   (                                                                 ');
     Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
     Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PTA2050B'',                 ');
     Query1.Sql.Add('       '''+CURDATE+''',                                              ');
     Query1.Sql.Add('       ''외국어 학점현황을 EXCEL 화일로 출력한다.'')                               ');
     Query1.ExecSQL;
     Query1.Close;
end;


procedure TMain_Form.BBprintClick(Sender: TObject);
var
  bMore: Boolean;
begin
  bMore := True;
  if  Datacheck = True  then
  begin
      QReport1.Process;
      QReport1.QReport1NeedData(QReport1,bMore);
      QReport1.AfterPrint(Sender);
      QReport1.Print;
  end;
end;


function TMain_Form.Datacheck:Boolean;
begin
  if  EmpnoFR.Text = ''  then
  begin
      showmessage('사번 From을 입력하세요!');
      Datacheck := False;
      EmpnoFR.SetFocus;
      system.Exit;
  end;
  if  EmpnoTO.Text = ''  then
  begin
      showmessage('사번 TO 를 입력하세요!');
      Datacheck := False;
      EmpnoTO.SetFocus;
      system.Exit;
  end;
{
  if  PayclFR.Text = ''  then
  begin
      showmessage('BAND From을 입력하세요!');
      Datacheck := False;
      PayclFR.SetFocus;
      system.Exit;
  end;
  if  PayclTO.Text = ''  then
  begin
      showmessage('BAND TO 를 입력하세요!');
      Datacheck := False;
      PayclTO.SetFocus;
      system.Exit;
  end;
}
  if  ExamdateFR.Text = ''  then
  begin
      showmessage('응시일 From을 입력하세요!');
      Datacheck := False;
      ExamdateFR.SetFocus;
      system.Exit;
  end;
  if  ExamdateTO.Text = ''  then
  begin
      showmessage('응시일 TO 를 입력하세요!');
      Datacheck := False;
      ExamdateTO.SetFocus;
      system.Exit;
  end;
  if  ExamscoreFR.Text = ''  then
  begin
      showmessage('점수 From을 입력하세요!');
      Datacheck := False;
      ExamscoreFR.SetFocus;
      system.Exit;
  end;
  if  ExamscoreTO.Text = ''  then
  begin
      showmessage('점수 TO 를 입력하세요!');
      Datacheck := False;
      ExamscoreTO.SetFocus;
      system.Exit;
  end;

  if  EmpnoFR.Text > EmpnoTO.Text  then
  begin
      showmessage('사번 From이 사번 TO보다 큽니다.사번 TO값을 확인하세요!');
      Datacheck := False;
      EmpnoTO.SetFocus;
      system.Exit;
  end;
  if  PayclFR.Text > PayclTO.Text  then
  begin
      showmessage('BAND From이 BAND TO보다 큽니다.BAND TO값을 확인하세요!');
      Datacheck := False;
      PayclTO.SetFocus;
      system.Exit;
  end;
  if  ExamdateFR.Text > ExamdateTO.Text  then
  begin
      showmessage('응시일 From이 응시일 TO보다 큽니다.응시일 TO값을 확인하세요!');
      Datacheck := False;
      ExamdateTO.SetFocus;
      system.Exit;
  end;
  if  ExamscoreFR.Text > ExamscoreTO.Text  then
  begin
      showmessage('점수 From이 점수 TO보다 큽니다.점수 TO값을 확인하세요!');
      Datacheck := False;
      ExamscoreTO.SetFocus;
      system.Exit;
  end;

  Datacheck := True;
end;


procedure TMain_Form.BBsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;



procedure TMain_Form.EmpnoFRKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key <> #13 then
    System.Exit;
  Key := #0;
  EmpnoFRExit(Sender);}

  if (Key = #9) or (Key = #13) then
  begin
    case TMaskEdit(Sender).Tag of
      1 : EmpnoFR.SetFocus;
      2 : EmpnoTO.SetFocus;
      3 : PayclFR.SetFocus;
      4 : PayclTO.SetFocus;
      5 : ExamdateFR.SetFocus;
      6 : ExamdateTO.SetFocus;
      7 : ExamscoreFR.SetFocus;
      8 : ExamscoreTO.SetFocus;
    end;
  end;

end;

end.
