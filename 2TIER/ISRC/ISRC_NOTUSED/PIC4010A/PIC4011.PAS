{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC4010A(승격기준등록)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 김혜진
  Version         : 1.00
  Date            : 1997.9.18
  Update Contents
    1.00    1997.9.18   김혜진  신규프로그램 개발   처리명세서
 ---------------------------------------------------------------------------}
unit PIC4011;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask,
  pass, Datelib, Timeftp,codetext,codelib,Fempno,dept1lib;

type
  Tpic4011aForm = class(TForm)
    Panel1: TPanel;
    progName: TLabel;
    userid: TLabel;
    dateLabel: TLabel;
    datapanel: TPanel;
    mark1: TEdit;
    mark2: TEdit;
    mark3: TEdit;
    mark4: TEdit;
    mark5: TEdit;
    mark6: TEdit;
    mark7: TEdit;
    value1: TEdit;
    value2: TEdit;
    value3: TEdit;
    value4: TEdit;
    value5: TEdit;
    value6: TEdit;
    value7: TEdit;
    helpDsr: TLabel;
    helpLabel: TLabel;
    leng1: TMaskEdit;
    leng2: TMaskEdit;
    leng3: TMaskEdit;
    leng4: TMaskEdit;
    leng5: TMaskEdit;
    leng6: TMaskEdit;
    leng7: TMaskEdit;
    Panel5: TPanel;
    save: TBitBtn;
    del: TBitBtn;
    cancel: TBitBtn;
    exit: TBitBtn;
    serch: TBitBtn;
    FindQuery: TQuery;
    Database1: TDatabase;
    Panel3: TPanel;
    Mark8: TEdit;
    value8: TEdit;
    leng8: TMaskEdit;
    mark9: TEdit;
    value9: TEdit;
    leng9: TMaskEdit;
    Panel6: TPanel;
    gubun: TEdit;
    sgubun3: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    PHelp: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    sgubun1: TEdit;
    rayear: TEdit;
    Npaycl: TPanel;
    Njobgun: TPanel;
    Njobline: TPanel;
    sgubun2: TEdit;
    allbtn: TBitBtn;
    DelQuery: TQuery;
    Qcode: TQuery;
    paycl: TMaskEdit;
    jobgun: TMaskEdit;
    jobline: TMaskEdit;
    Query1: TQuery;
    procedure exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure serchClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure Mark1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure leng1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure value1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mark1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure leng1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure value1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgubun3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gubunKeyPress(Sender: TObject; var Key: Char);
    procedure gubunClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mark1Change(Sender: TObject);
    procedure mark1Click(Sender: TObject);
    procedure payclDblClick(Sender: TObject);
    procedure payclChange(Sender: TObject);
    procedure allbtnClick(Sender: TObject);
  private
    start,check: Integer;
    exesave     : integer;  {저장,실행 버튼 판단유무}
    DataCheck   : integer;
    KeyCheck : integer;     {Enter 키 체크 유무}
    flag : boolean;

    procedure DispData;
    procedure ClearDisp;
    function  QCodeDisp(s1,s2 : String):String;
    { Private declarations }
  public
    DataChange  : integer;  {데이타 필드가 변했는 지 확인하는 변수}
    rstr,pempno, pkorname, password, HomeDir: string;
    procedure SerchData;
    procedure check_field(sender : Tobject);
    { Public declarations }
  end;

var
  Hwnd : word;
  pic4011aForm: Tpic4011AForm;

implementation
uses pic4012, pic4013;

{$R *.DFM}
procedure Tpic4011aForm.ClearDisp;
var
  i : integer;
begin
    for i := 0 to ComponentCount - 1 do begin
      if (TObject(components[i]) is TMaskEdit) then
          TMaskEdit(components[i]).Text := '';
      if (TObject(components[i]) is TEdit) then
          TEdit(components[i]).Text := '';
      if (Tobject(Components[i]) is Tpanel) then begin
         if  (Tpanel(components[i]).name = 'Npaycl') or (Tpanel(components[i]).name = 'Njobgun')or
             (Tpanel(components[i]).name = 'Njobline') then
               Tpanel(components[i]).caption:= '';
         end;
    end;
    del.Enabled := False; cancel.Enabled := False; allbtn.enabled := true; flag := false;
    rayear.SetFocus;   HelpDsr.Caption := '';
end;


procedure Tpic4011aForm.SerchData;
var
  temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8 : string;
begin
     FindQuery.close; FindQuery.Sql.clear;
     FindQuery.SQL.Add('select * from pimraba ');
     FindQuery.SQL.Add('where (rayear = :lrayear) and (gubun= :lgubun) and ');
     FindQuery.SQL.Add('      (paycl = :lpaycl) and (jobgun= :ljobgun) and (jobline= :ljobline) and ');
     FindQuery.SQL.Add('      (sgubun1= :lsgubun1) and (sgubun2 = :lsgubun2) and (sgubun3 = :lsgubun3)');
     FindQuery.parambyname('lrayear').Asstring := rayear.text;
     FindQuery.parambyname('lgubun').Asstring := gubun.Text;
     FindQuery.parambyname('lpaycl').Asstring := paycl.Text;
     FindQuery.parambyname('ljobgun').Asstring := jobgun.Text;
     FindQuery.parambyname('ljobline').Asstring := jobline.Text;
     FindQuery.parambyname('lsgubun1').Asstring := sgubun1.Text;
     FindQuery.parambyname('lsgubun2').Asstring := sgubun2.Text;
     FindQuery.parambyname('lsgubun3').Asstring := sgubun3.Text;

     Findquery.Open;
     if FindQuery.RecordCount > 0 then  begin  // 키필드에 해당하는 자료 존재
        del.Enabled := True;
        cancel.Enabled := true;
        DispData;
     end else begin   // 키필드에 해당하는 자료가 없을때....
        del.Enabled := False;
        allbtn.enabled := true;
        temp1 := gubun.text;
        temp2 := sgubun1.text;
        temp3 := rayear.text;
        temp4 := paycl.text ;
        temp5 := jobline.text;
        temp6 := jobgun.text;
        temp7 := sgubun2.text;
        temp8 := sgubun3.text;
        HelpDsr.Caption := '데이타를 입력하십시오 !!..';
        gubun.text   := temp1;
        sgubun1.text := temp2;
        rayear.text  := temp3;
        paycl.text   := temp4;
        jobline.text := temp5;
        jobgun.text  := temp6;
        sgubun2.text := temp7;
        sgubun3.text := temp8;
        save.Caption := '저장';
        save.glyph.loadfromfile(HomeDir+'\pic\pbutt010.bmp');
        exesave := 1;   KeyCheck := 0;
        cancel.Enabled := True;
        Mark1.SetFocus;
     end;
end;

// 실행버튼을 눌렀을 때 자료 디스플레이...............................
procedure Tpic4011aForm.DispData;
begin
    rayear.text  := FindQuery.FieldByName('rayear').ASstring;
    gubun.Text   := FindQuery.FieldByName('gubun').AsString;
    paycl.Text   := FindQuery.FieldByName('paycl').AsString;
    Npaycl.caption := Qcodedisp('I112',findQuery.FieldByname('paycl').Asstring);
    jobline.Text := FindQuery.FieldByName('jobline').AsString;
    Njobline.caption := Qcodedisp('I115',findQuery.FieldByname('jobline').Asstring);
    jobgun.Text  := FindQuery.FieldByName('jobgun').AsString;
    Njobgun.caption := Qcodedisp('I115',findQuery.FieldByname('jobgun').Asstring);
    sgubun1.Text := FindQuery.FieldByName('sgubun1').AsString;
    sgubun2.Text := FindQuery.FieldByName('sgubun2').AsString;
    sgubun3.Text := FindQuery.FieldByName('sgubun3').AsString;
    mark1.Text := FindQuery.FieldByName('mark1').AsString;
    mark2.Text := FindQuery.FieldByName('mark2').AsString;
    mark3.Text := FindQuery.FieldByName('mark3').AsString;
    mark4.Text := FindQuery.FieldByName('mark4').AsString;
    mark5.Text := FindQuery.FieldByName('mark5').AsString;
    mark6.Text := FindQuery.FieldByName('mark6').AsString;
    mark7.Text := FindQuery.FieldByName('mark7').AsString;
    mark8.Text := FindQuery.FieldByName('mark8').AsString;
    mark9.Text := FindQuery.FieldByName('mark9').AsString;
    leng1.Text := Format('%2d',[FindQuery.FieldByName('leng1').AsInteger]);
    leng2.Text := Format('%2d',[FindQuery.FieldByName('leng2').AsInteger]);
    leng3.Text := Format('%2d',[FindQuery.FieldByName('leng3').AsInteger]);
    leng4.Text := Format('%2d',[FindQuery.FieldByName('leng4').AsInteger]);
    leng5.Text := Format('%2d',[FindQuery.FieldByName('leng5').AsInteger]);
    leng6.Text := Format('%2d',[FindQuery.FieldByName('leng6').AsInteger]);
    leng7.Text := Format('%2d',[FindQuery.FieldByName('leng7').AsInteger]);
    leng8.Text := Format('%2d',[FindQuery.FieldByName('leng8').AsInteger]);
    leng9.Text := Format('%2d',[FindQuery.FieldByName('leng9').AsInteger]);
    value1.Text:= FindQuery.FieldByName('value1').AsString;
    value2.Text:= FindQuery.FieldByName('value2').AsString;
    value3.Text:= FindQuery.FieldByName('value3').AsString;
    value4.Text:= FindQuery.FieldByName('value4').AsString;
    value5.Text:= FindQuery.FieldByName('value5').AsString;
    value6.Text:= FindQuery.FieldByName('value6').AsString;
    value7.Text:= FindQuery.FieldByName('value7').AsString;
    value8.Text:= FindQuery.FieldByName('value8').AsString;
    value9.Text:= FindQuery.FieldByName('value9').AsString;
    save.Caption := '저장';
    save.glyph.loadfromfile(HomeDir+'\pic\pbutt010.bmp');
    exesave := 1;   KeyCheck := 0;
    cancel.Enabled := True;
    HelpDsr.Caption := '데이타를 입력하십시오 !!..';
    mark1.SetFocus;
    flag := true;
end;


procedure Tpic4011aForm.FormCreate(Sender: TObject);
var
  Present : TDateTime;
begin
  start := 0;
  Present := Now;
  helpDsr.Caption := '';
end;

procedure Tpic4011aForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  if start = 0 then begin
     start := 1;
     pempno   := PassEmp(cmdline, 1);
     pkorname := PassEmp(cmdline, 2);
     password := PassEmp(cmdline, 3);
     DataBase1.Params[0] := 'SERVER NAME='+ Passemp(cmdline,13);
     DataBase1.Params[1]  := 'USER NAME=' + passEmp(CmdLine, 5);
     DataBase1.Params[19] := 'PASSWORD='  + passEmp(CmdLine, 6);
     Application.ProcessMessages;
     if not PassDialog(Self, pempno, pkorname, password) then  System.Halt(0);
     Try
       Database1.Connected := True;
     EXCEPT
     ON EDataBaseError DO
        MessageBox(handle,'서버와 연결실패.(서버장비 확인요망!.)','에  러',MB_OK or $0040);
     ELSE
        MessageBox(handle,'서버와 연결실패.(서버장비 확인요망!.)','에  러',MB_OK or $0040);
     END;  {TRY end}
     userid.Caption := pkorname+'('+pempno+')';
     exesave := 0;
     rStr := Timeftp.TimeDate(Query1);
     dateLabel.Caption := Copy(rStr, 1, 4)+'/'+
                          Copy(rStr, 5, 2)+'/'+
                          Copy(rStr, 7, 2);

     save.Caption := '실행';
     save.glyph.loadfromfile(HomeDir+'\pic\pbutt014.bmp');
     del.Enabled := False;  cancel.Enabled := False; allbtn.Enabled := true; flag := true;
     rayear.SetFocus;
  end;
end;

procedure Tpic4011aForm.exitClick(Sender: TObject);
begin
if MessageBox(handle,'종료하시겠습니까 ?..','확 인',MB_YESNO or $0030) = ID_YES then begin
   ShowWindow(Hwnd,sw_ShowNormal);
   Close; {exesave Check if}
end;
end;

// 조회버튼 ..............................................................
procedure Tpic4011aForm.serchClick(Sender: TObject);
var
   Ttop    : integer;
   NewForm : Tpic4012aForm;
begin
   NewForm := Tpic4012aForm.Create(self);
   try
     NewForm.ShowModal;
   finally
     NewForm.Free;
   end;
end;

// 키필드가 널인지 체크한다..............................................
procedure Tpic4011aForm.check_field(sender : Tobject);
var
  i : integer;
begin
  check := 0;
  if rayear.text ='' then inc(check)
  else if gubun.text ='' then inc(check)
  else if paycl.text ='' then inc(check)
  else if jobgun.text ='' then inc(check)
  else if jobline.text ='' then inc(check)
  else if sgubun1.text ='' then inc(check)
  else if sgubun2.text ='' then inc(check)
  else if sgubun3.text ='' then inc(check)
  else system.exit;
end;

{저장 버튼을 눌렀을 경우}
procedure Tpic4011aForm.saveClick(Sender: TObject);
var
  FindOk  : integer;   {데이타 find 유.무}
  ActiveHWnd : THandle;
  procedure SaveData;
  begin
    with FindQuery do  begin
      parambyname('lrayear').Asstring := rayear.text;
      parambyname('lgubun').Asstring := gubun.Text;
      parambyname('lpaycl').Asstring := paycl.Text;
      parambyname('ljobgun').Asstring := jobgun.Text;
      parambyname('ljobline').Asstring := jobline.Text;
      parambyname('lsgubun1').Asstring := sgubun1.Text;
      parambyname('lsgubun2').Asstring := sgubun2.Text;
      parambyname('lsgubun3').Asstring := sgubun3.Text;
      ParamByname('lmark1').AsString  := mark1.Text;
      ParamByname('lmark2').AsString  := mark2.Text;
      ParamByname('lmark3').AsString  := mark3.Text;
      ParamByname('lmark4').AsString  := mark4.Text;
      ParamByname('lmark5').AsString  := mark5.Text;
      ParamByname('lmark6').AsString  := mark6.Text;
      ParamByname('lmark7').AsString  := mark7.Text;
      ParamByname('lmark8').AsString  := mark8.Text;
      ParamByname('lmark9').AsString  := mark9.Text;
      if leng1.Text = '' then  ParamByname('lleng1').AsFloat   := 0
      else ParamByname('lleng1').AsFloat   := strToFloat(leng1.Text);
      if leng2.Text = '' then  ParamByname('lleng2').AsFloat   := 0
      else ParamByname('lleng2').AsFloat   := strToFloat(leng2.Text);
      if leng3.Text = '' then  ParamByname('lleng3').AsFloat   := 0
      else ParamByname('lleng3').AsFloat   := strToFloat(leng3.Text);
      if leng4.Text = '' then  ParamByname('lleng4').AsFloat   := 0
      else ParamByname('lleng4').AsFloat   := strToFloat(leng4.Text);
      if leng5.Text = '' then  ParamByname('lleng5').AsFloat   := 0
      else ParamByname('lleng5').AsFloat   := strToFloat(leng5.Text);
      if leng6.Text = '' then  ParamByname('lleng6').AsFloat   := 0
      else ParamByname('lleng6').AsFloat   := strToFloat(leng6.Text);
      if leng7.Text = '' then  ParamByname('lleng7').AsFloat   := 0
      else ParamByname('lleng7').AsFloat   := strToFloat(leng7.Text);
      if leng8.Text = '' then  ParamByname('lleng8').AsFloat   := 0
      else ParamByname('lleng8').AsFloat   := strToFloat(leng8.Text);
      if leng9.Text = '' then  ParamByname('lleng9').AsFloat   := 0
      else ParamByname('lleng9').AsFloat   := strToFloat(leng9.Text);
      ParamByname('lvalue1').AsString := value1.Text;
      ParamByname('lvalue2').AsString := value2.Text;
      ParamByname('lvalue3').AsString := value3.Text;
      ParamByname('lvalue4').AsString := value4.Text;
      ParamByname('lvalue5').AsString := value5.Text;
      ParamByname('lvalue6').AsString := value6.Text;
      ParamByname('lvalue7').AsString := value7.Text;
      ParamByname('lvalue8').AsString := value8.Text;
      ParamByname('lvalue9').AsString := value9.Text;
      ParamByname('lwritetime').AsString := copy(rStr,1,15);
      ParamByname('lwriteemp').AsString  := Pempno;
   end;
  end;

begin
  if exesave = 1 then begin
    if MessageBox(handle,'변경된 데이타를 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
    begin
      GubunClick(save);
      System.Exit;
    end;
    check_field(sender);  // 키필드 널 체크.
    if check = 0 then begin   //key 필드가 널이 아니면..
        HelpDsr.Caption := '데이타를 저장하고 있는 중입니다 !!..';
        SendMessage(Phelp.handle,WM_PAINT,0,0);
        FindQuery.Close;       FindQuery.SQL.Clear;
        FindQuery.SQL.Add('select * from pimraba ');
        FindQuery.SQL.Add('where (rayear = :lrayear) and (gubun= :lgubun) and ');
        FindQuery.SQL.Add('      (paycl = :lpaycl) and (jobgun= :ljobgun) and (jobline= :ljobline) and ');
        FindQuery.SQL.Add('      (sgubun1=:lsgubun1) and (sgubun2 = :lsgubun2) and (sgubun3 = :lsgubun3) ');
        FindQuery.parambyname('lrayear').Asstring := rayear.text;
        FindQuery.parambyname('lgubun').Asstring := gubun.Text;
        FindQuery.parambyname('lpaycl').Asstring := paycl.Text;
        FindQuery.parambyname('ljobgun').Asstring := jobgun.Text;
        FindQuery.parambyname('ljobline').Asstring := jobline.Text;
        FindQuery.parambyname('lsgubun1').Asstring := sgubun1.Text;
        FindQuery.parambyname('lsgubun2').Asstring := sgubun2.Text;
        FindQuery.parambyname('lsgubun3').Asstring := sgubun3.Text;
        Findquery.Open;
        FindOk := FindQuery.RecordCount;

        if FindOk > 0 then begin        // 기존자료가 있으면.................
           FindQuery.Close;       FindQuery.SQL.Clear;
           FindQuery.SQL.Add('update pimraba set ');
           FindQuery.SQL.Add('mark1 = :lmark1,mark2 = :lmark2,mark3 = :lmark3,');
           FindQuery.SQL.Add('mark4 = :lmark4,mark5 = :lmark5,mark6 = :lmark6,mark7 = :lmark7, ');
           FindQuery.SQL.Add('mark8 = :lmark8,mark9 = :lmark9, ');
           FindQuery.SQL.Add('leng1 = :lleng1,leng2 = :lleng2,leng3 = :lleng3,leng4 = :lleng4,');
           FindQuery.SQL.Add('leng5 = :lleng5,leng6 = :lleng6,leng7 = :lleng7,leng8 = :lleng8,leng9 = :lleng9,');
           FindQuery.SQL.Add('value1 = :lvalue1, value2 = :lvalue2, value3 = :lvalue3,');
           FindQuery.SQL.Add('value4 = :lvalue4, value5 = :lvalue5, value6 = :lvalue6, value7 = :lvalue7,');
           FindQuery.SQL.Add('value8 = :lvalue8, value9 = :lvalue9, ');
           FindQuery.SQL.Add('writetime = :lwritetime,writeemp = :lwriteemp ');
           FindQuery.SQL.Add('where (rayear = :lrayear) and (gubun = :lgubun) and ');
           FindQuery.SQL.Add('      (paycl = :lpaycl) and (jobgun= :ljobgun) and (jobline = :ljobline) and ');
           FindQuery.SQL.Add('      (sgubun1=:lsgubun1) and (sgubun2 = :lsgubun2) and (sgubun3 = :lsgubun3) ');
           saveData;   FindQuery.ExecSQL;
           DataChange := 0;
        end else begin   // 새로운 key 필드..
           FindQuery.Close;  FindQuery.SQL.Clear;
           FindQuery.SQL.Add('insert into pimraba (rayear,gubun,paycl,jobgun,jobline,sgubun1,');
           FindQuery.SQL.Add('sgubun2,sgubun3,mark1,mark2,mark3,mark4,mark5,mark6,mark7,mark8,mark9,');
           FindQuery.SQL.Add('leng1,leng2,leng3,leng4,leng5,leng6,leng7,leng8,leng9,');
           FindQuery.SQL.Add('value1,value2,value3,value4,value5,value6,value7,value8,value9,');
           FindQuery.SQL.Add('writetime,writeemp) ');
           FindQuery.Sql.Add('values(:lrayear,:lgubun,:lpaycl,:ljobgun,:ljobline,:lsgubun1,');
           FindQuery.SQL.Add(':lsgubun2,:lsgubun3,:lmark1,:lmark2,:lmark3,:lmark4,:lmark5,:lmark6,:lmark7,:lmark8,:lmark9,');
           FindQuery.SQL.Add(':lleng1,:lleng2,:lleng3,:lleng4,:lleng5,:lleng6,:lleng7,:lleng8,:lleng9,');
           FindQuery.SQL.Add(':lvalue1,:lvalue2,:lvalue3,:lvalue4,:lvalue5,:lvalue6,:lvalue7,:lvalue8,:lvalue9,');
           FindQuery.SQL.Add(':lwritetime,:lwriteemp)');
           saveData;     FindQuery.ExecSQL;
           DataChange := 0;
        end;
        FindQuery.close;
       GubunClick(save);    // 저장 후 키필드부분 clear
     end else begin         // 키필드가 하나라도 널이면
         messagebox(handle,'키필드는 필수입력항목입니다!!.','알 림',MB_OK );
         rayear.setfocus;
         system.exit;
     end;
  end else begin  // 실행일때
      SerchData;
      Mark1.SetFocus;
end;
end;


procedure Tpic4011aForm.cancelClick(Sender: TObject);
begin
   SerchData;   DataChange := 0;   Mark1.SetFocus;
end;

procedure Tpic4011aForm.delClick(Sender: TObject);
begin
  if MessageBox(handle,'삭제하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then begin
     Mark1.SetFocus;   System.Exit;
   end;
   HelpDsr.Caption := '데이타를 삭제하고 있는 중입니다 !!..';
   SendMessage(Phelp.handle,WM_PAINT,0,0);
   DelQuery.Close;
   DelQuery.SQL.Clear;
   DelQuery.SQL.Add('delete from pimraba ');
   DelQuery.SQL.Add('where (rayear = :lrayear) and (gubun= :lgubun) and ');
   DelQuery.SQL.Add('      (paycl = :lpaycl) and (jobgun=:ljobgun) and (jobline=:ljobline) and ');
   DelQuery.SQL.Add('      (sgubun1=:lsgubun1) and (sgubun2 = :lsgubun2) and (sgubun3 = :lsgubun3) ');
   DelQuery.parambyname('lrayear').Asstring := rayear.text;
   DelQuery.parambyname('lgubun').Asstring := gubun.Text;
   DelQuery.parambyname('lpaycl').Asstring := paycl.Text;
   DelQuery.parambyname('ljobgun').Asstring := jobgun.Text;
   DelQuery.parambyname('ljobline').Asstring := jobline.Text;
   DelQuery.parambyname('lsgubun1').Asstring := sgubun1.Text;
   DelQuery.parambyname('lsgubun2').Asstring := sgubun2.Text;
   DelQuery.parambyname('lsgubun3').Asstring := sgubun3.Text;
   Delquery.EXECSQL;  Delquery.Close;
   GubunClick(save);
end;

{.....................................................................}
{............키정의 부분..............................................}
{.....................................................................}

procedure Tpic4011aForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = chr(vk_return) then begin
      key := chr(0);
   end;
   HelpDsr.Caption := '';
end;

procedure Tpic4011aForm.Mark1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Down then
case strToint(copy(TEdit(Sender).Name,5,1)) of
  1 : Mark2.SetFocus;
  2 : Mark3.SetFocus;
  3 : Mark4.SetFocus;
  4 : Mark5.SetFocus;
  5 : Mark6.SetFocus;
  6 : Mark7.SetFocus;
  7 : Mark8.SetFocus;
  8 : Mark9.SetFocus;
  9 : Mark1.SetFocus;
end;

if key = vk_Up then
case strToint(copy(TEdit(Sender).Name,5,1)) of
  1 : Mark9.SetFocus;
  2 : Mark1.SetFocus;
  3 : Mark2.SetFocus;
  4 : Mark3.SetFocus;
  5 : Mark4.SetFocus;
  6 : Mark5.SetFocus;
  7 : Mark6.SetFocus;
  8 : Mark7.SetFocus;
  9 : Mark8.SetFocus;
end;
end;

procedure Tpic4011aForm.leng1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = vk_Down then
        case strToint(copy(TEdit(Sender).Name,5,1)) of
             1: leng2.SetFocus;
             2 : Leng3.SetFocus;
             3 : Leng4.SetFocus;
             4 : Leng5.SetFocus;
             5 : Leng6.SetFocus;
             6 : Leng7.SetFocus;
             7 : Leng8.SetFocus;
             8 : Leng9.SetFocus;
             9 : Leng1.SetFocus;
        end;
     if key = vk_Up then
        case strToint(copy(TEdit(Sender).Name,5,1)) of
             1 : Leng9.SetFocus;
             2 : Leng1.SetFocus;
             3 : Leng2.SetFocus;
             4 : Leng3.SetFocus;
             5 : Leng4.SetFocus;
             6 : Leng5.SetFocus;
             7 : Leng6.SetFocus;
             8 : Leng7.SetFocus;
             9 : Leng8.SetFocus;
        end;
end;

procedure Tpic4011aForm.value1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_down :
              case strToint(copy(TEdit(Sender).Name,6,1)) of
                 1 : Value2.SetFocus;
                 2 : Value3.SetFocus;
                 3 : Value4.SetFocus;
                 4 : Value5.SetFocus;
                 5 : Value6.SetFocus;
                 6 : Value7.SetFocus;
                 7 : Value8.SetFocus;
                 8 : Value9.SetFocus;
                 9 : Value1.SetFocus;
              end;
      vk_Up :
            case strToint(copy(TEdit(Sender).Name,6,1)) of
                 1 : Value9.SetFocus;
                 2 : Value1.SetFocus;
                 3 : Value2.SetFocus;
                 4 : Value3.SetFocus;
                 5 : Value4.SetFocus;
                 6 : Value5.SetFocus;
                 7 : Value6.SetFocus;
                 8 : Value7.SetFocus;
                 9 : Value8.SetFocus;
            end;
      end;
end;

procedure Tpic4011aForm.mark1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not (ssShift in Shift) then begin
if (key = vk_Tab) or (key = vk_return) then
case strToint(copy(TEdit(Sender).Name,5,1)) of
  1 : begin
      if KeyCheck <> 0 then Leng1.SetFocus;
      end;
  2 : Leng2.SetFocus;
  3 : Leng3.SetFocus;
  4 : Leng4.SetFocus;
  5 : Leng5.SetFocus;
  6 : Leng6.SetFocus;
  7 : Leng7.SetFocus;
  8 : Leng8.SetFocus;
  9 : Leng9.SetFocus;
end;
end else begin
if (key = vk_Tab) or (key = vk_return) then
case strToint(copy(TEdit(Sender).Name,5,1)) of
  1 : Value9.SetFocus;
  2 : Value1.SetFocus;
  3 : Value2.SetFocus;
  4 : Value3.SetFocus;
  5 : Value4.SetFocus;
  6 : Value5.SetFocus;
  7 : Value6.SetFocus;
  8 : Value7.SetFocus;
  9 : Value8.SetFocus;
end;
end;
KeyCheck := 1;
end;

procedure Tpic4011aForm.leng1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not (ssShift in Shift) then begin
if (key = vk_Tab) or (key = vk_return) then
case strToint(copy(TEdit(Sender).Name,5,1)) of
    1 : Value1.SetFocus;
    2 : Value2.SetFocus;
    3 : Value3.SetFocus;
    4 : Value4.SetFocus;
    5 : Value5.SetFocus;
    6 : Value6.SetFocus;
    7 : Value7.SetFocus;
    8 : Value8.SetFocus;
    9 : Value9.SetFocus;
end;
end else begin
if (key = vk_Tab) or (key = vk_return) then
case strToint(copy(TEdit(Sender).Name,5,1)) of
  1 : Mark1.SetFocus;
  2 : Mark2.SetFocus;
  3 : Mark3.SetFocus;
  4 : Mark4.SetFocus;
  5 : Mark5.SetFocus;
  6 : Mark6.SetFocus;
  7 : Mark7.SetFocus;
  8 : Mark8.SetFocus;
  9 : Mark9.SetFocus;
end;
end;
end;

procedure Tpic4011aForm.value1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not (ssShift in Shift) then begin
if (key = vk_Tab) or (key = vk_return) then
case strToint(copy(TEdit(Sender).Name,6,1)) of
  1 : Mark2.SetFocus;
  2 : Mark3.SetFocus;
  3 : Mark4.SetFocus;
  4 : Mark5.SetFocus;
  5 : Mark6.SetFocus;
  6 : Mark7.SetFocus;
  7 : Mark8.SetFocus;
  8 : Mark9.SetFocus;
  9 : Mark1.SetFocus;
end;
end else begin
if (key = vk_Tab) or (key = vk_return) then
case strToint(copy(TEdit(Sender).Name,6,1)) of
  1 : Leng1.SetFocus;
  2 : Leng2.SetFocus;
  3 : Leng3.SetFocus;
  4 : Leng4.SetFocus;
  5 : Leng5.SetFocus;
  6 : Leng6.SetFocus;
  7 : Leng7.SetFocus;
  8 : Leng8.SetFocus;
  9 : Leng9.SetFocus;
end;
end;
end;

//키필드에서 tab  또는 enter
procedure Tpic4011aForm.sgubun3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not (ssShift in Shift) then begin
   if (key = vk_Tab) or (key = vk_return) then
      case Tcomponent(Sender).Tag of
        1 : begin
             if (rayear.text <> '') and (Length(trim(rayear.text)) < 4 ) then begin
                 helpdsr.caption := '승격년도 4자리를 입력하십시요!!';
                 rayear.Setfocus;
             end else  Gubun.SetFocus;
            end;
        2 : begin
             if (gubun.text <> '') and (Length(trim(gubun.text)) < 2 ) then begin
                 helpdsr.caption := '기준구분 2자리를 입력하십시요!!';
                 gubun.SetFocus;
             end else  paycl.SetFocus;
            end;
        3 : begin
             if (paycl.text <> '') and (Length(trim(paycl.text)) <2 )  then begin
                 helpdsr.caption := '직급 2자리를 입력하십시요!!';
                 paycl.setfocus;
             end
             else begin
              Npaycl.caption := QCodeDisp('I112',paycl.Text);
              jobgun.SetFocus;
             end;
            end;
        4 : begin
             if (jobgun.text <> '') and (Length(trim(jobgun.text)) < 2) then begin
                 helpdsr.caption := '직군 2자리를 입력하십시요!!';
                 jobgun.setfocus;
             end
             else begin
              Njobgun.caption := QCodeDisp('I115',jobgun.Text);
              jobline.SetFocus;
             end;
            end;
        5 : begin
             if (jobline.text <> '') and (Length(trim(jobline.text)) < 2) then begin
                 helpdsr.caption := '직렬 2자리를 입력하십시요!!';
                 jobline.setfocus;
             end
             else begin
               Njobline.caption := QCodeDisp('I115',jobline.Text);
               sgubun1.SetFocus;
             end;
            end;
        6 : begin
             if (sgubun1.text <> '') and (Length(trim(sgubun1.text)) < 4 )  then begin
                helpdsr.caption := '세부구분1 4자리를 입력하십시요!!';
                sgubun1.Setfocus;
             end else  sgubun2.SetFocus;
            end;
        7 : begin
              if (sgubun2.text <> '') and (Length(trim(sgubun2.text)) < 4 )  then begin
                 helpdsr.caption := '세부구분2 4자리를 입력하십시요!!';
                 sgubun2.Setfocus;
              end else sgubun3.SetFocus;
            end;
        8 : begin
              if (sgubun3.text <> '') and (Length(trim(sgubun3.text)) < 4 )  then begin
                 helpdsr.caption := '세부구분3 4자리를 입력하십시요!!';
                 sgubun3.Setfocus;
              end else rayear.SetFocus;
           end;
      end;
end else begin
   if (key = vk_Tab) or (Key = vk_return) then
      case Tcomponent(Sender).Tag of
        1 : sgubun3.SetFocus;
        2 : rayear.SetFocus;
        3 : gubun.SetFocus;
        4 : paycl.SetFocus;
        5 : jobgun.SetFocus;
        6 : jobline.SetFocus;
        7 : sgubun1.setFocus;
        8 : sgubun2.SetFocus;
      end;
end;
end;


procedure Tpic4011aForm.gubunKeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(13) then
 begin
    key := chr(0);
    if TEdit(Sender).Name = 'sgubun3' then SerchData;   //= 실행버튼
 end;
 DataChange := 0;
 HelpDsr.Caption := '';
end;

procedure Tpic4011aForm.gubunClick(Sender: TObject);
begin
    save.Caption := '실행';
    save.glyph.loadfromfile(HomeDir+'\pic\pbutt014.bmp');
    HelpDsr.Caption := '키부분을 입력하십시오 !!..';
    clearDisp;
    exesave := 0;  DataCheck := 0;  check := 0; del.Enabled := False;
    cancel.Enabled := False; allbtn.Enabled := true;
end;


function Tpic4011aForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
     if trim(s2) = '' then begin QcodeDisp := ''; system.exit; end;
        QCode.Close;
        QCode.Parambyname('lcodeid').AsString := s1;
        QCode.Parambyname('lcodesub').AsString   := s2;
        QCode.Open;
    if trim(QCode.FieldByName('codename').AsString) = ''  then
        QcodeDisp := ''
    else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
        Qcode.close;
end;


procedure Tpic4011aForm.mark1Change(Sender: TObject);
begin
  DataChange := 1;
end;

procedure Tpic4011aForm.mark1Click(Sender: TObject);
begin
  if save.caption <> '저장' then gubun.SetFocus;
end;


procedure Tpic4011aForm.payclDblClick(Sender: TObject);
begin
  CodeForm := TcodeForm.create(self);
  case TEdit(sender).tag of
    3 : begin
         codeForm := TCodeForm.Create(self);
         codeForm.FormData := '직급코드 열람';
         codeForm.DataVal1  := 'I112';
        end;
    4 : begin
         codeForm := TCodeForm.Create(self);
         codeForm.FormData := '직군코드 열람';
         codeForm.DataVal1  := 'I115';
        end;
    5 : begin
         codeForm := TCodeForm.Create(self);
         codeForm.FormData := '직렬코드 열람';
         codeForm.DataVal1  := 'I115';
        end;
   end;
   codeForm.ShowModal;
   if CodeForm.Code = '' then System.Exit;
   TmaskEdit(Sender).Text := CodeForm.Code;

   case Tmaskedit(sender).tag  of
     3 : Npaycl.Caption := codeForm.Codename;
     4 : Njobgun.caption := codeForm.codename;
     5 : Njobline.caption := codeform.codename;
   end;
   codeForm.Free;

end;

procedure Tpic4011aForm.payclChange(Sender: TObject);
begin
   flag := false;
   allbtn.Enabled := true;
end;

// 일괄등록 버튼을 클릭.......................................
procedure Tpic4011aForm.allbtnClick(Sender: TObject);
begin
  pic4013aForm := Tpic4013aForm.Create(self);
  try
    pic4013aForm.ShowModal;
  finally
    pic4013aForm.Free;
  end;
  KeyCheck := 1;
  if exesave = 1 then
     Mark1.SetFocus
  else rayear.SetFocus;
end;

end.
