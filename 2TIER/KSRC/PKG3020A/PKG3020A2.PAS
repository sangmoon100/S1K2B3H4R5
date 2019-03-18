unit PKG3020A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Datelib, db, Func, OnFocusButton, MemDS,
  DBAccess, Ora;

type
  TAllData = Record
     DutyDate     :array[1..500] of String[08];        { 근무일               }
     Empno        :array[1..500] of String[04];        { 사번                 }
     Dukind       :array[1..500] of String[02];        { 근태코드             }
     Bigo         :array[1..500] of String[100];       { 비고                 }
     End;

  TFm_Batch = class(TForm)
    Panel2: TPanel;
    BB_close: TOnFocusButton;
    Panel1: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    Button2: TButton;
    Panel4: TPanel;
    Panel3: TPanel;
    Edatafile: TEdit;
    Eerrorfile: TEdit;
    Button1: TButton;
    Panel5: TPanel;
    Phelpmsg: TPanel;
    Sb_Insert: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    OpenDialog1: TOpenDialog;
    Query1: TOraQuery;
    E_example1: TMemo;
    P_Title: TPanel;
    E_example2: TMemo;
    Sb_Delete: TOnFocusButton;
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_InsertClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Function new_PassEmp(var cmd : Pchar; gu : integer; separ:String) : string;
    Function Check_Holidate(idx : integer) : Boolean;
    Function Check_Date(InDate : String) : Boolean;
    Function Check_DataValid(idx : integer) : Boolean;
    Function Check_Duplicate( idx : Integer ) : Boolean;
    Function Insert_Record(Idx:Integer):Boolean;
    Function delete_Record(Idx:Integer):Boolean;
  public
    LastRec : Integer;
    k : integer;
    All_data :  TAllData;
    F1, F2 : TextFile  ;
    ErrorText : string;          // 오류 내용
    Error_file : string;
    P : PChar;
    ch: string;
    A: array[0..50] of Char;

  end;

var
  Fm_Batch : TFm_Batch;

implementation

uses PKG3020A1;
{$R *.DFM}

Function TFm_Batch.new_PassEmp(var cmd : Pchar; gu : integer; separ:String) : string;
var
  str     : string;
begin
  new_PassEmp := '';  str := '';
  str := strpas(cmd);
  case gu of
       0 : new_PassEmp := pasString(str,separ,1);
       1 : new_PassEmp := pasString(str,separ,2);
       2 : new_PassEmp := pasString(str,separ,3);
       3 : new_PassEmp := pasString(str,separ,4);
       4 : new_PassEmp := pasString(str,separ,5);
       5 : new_PassEmp := pasString(str,separ,6);
       6 : new_PassEmp := pasString(str,separ,7);
       7 : new_PassEmp := pasString(str,separ,8);
       8 : new_PassEmp := pasString(str,separ,9);
       9 : new_PassEmp := pasString(str,separ,10);
  end;
end;

Function  TFm_Batch.Check_Holidate( idx : integer ) : Boolean;
var
  tem : string;
begin
  ErrorText := '';
  Tem := ' SELECT HOLIDATE          ' +
         '   FROM PKCHOLI           ' +
  Format('  WHERE HOLIDATE = ''%s'' ',[All_data.Dutydate[idx]]);

  with Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(Tem);
       Open;
  end;

  if Query1.RecordCount > 0 then
  begin
       result := True;
       ErrorText := '휴일일자';
  end
  else
  begin
       Tem := ' SELECT TO_CHAR(TO_DATE('''+All_data.Dutydate[idx]+''',''YYYYMMDD''),''D'') dday  FROM dual';

       with Query1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add(Tem);
            Open;
       end;

       if (Query1.fields[0].Asinteger = 1) or     //주일
          (Query1.fields[0].Asinteger = 7) then   //토요일
       begin
            result := True;
            ErrorText := '휴일일자';
       end
       else
       begin
            result := False;
            ErrorText := '평일일자';
       end;
  end;

  Query1.Close;
end;

Function TFm_Batch.Check_Duplicate( idx : Integer ) : Boolean;
var
  i,j       : Integer;
  DateTime1 : String;
  DateTime2 : String;
  Flag      : Boolean;
  Tem       : String;
begin
  with Query1 do
  begin
       close;
       sql.Clear;
       Sql.Add(' SELECT DUTYDATE, EMPNO                             ');
       Sql.Add('   FROM PKHOLIEMP                                   ');
       Sql.Add('  WHERE DUTYDATE = '''+All_data.Dutydate[idx]+'''   ');
       Sql.Add('    AND EMPNO    = '''+All_data.Empno[idx]   +'''   ');
       Sql.Add('    AND DUKIND   = '''+All_data.Dukind[idx]  +'''   ');
       Open;
  end;

  if Query1.RecordCount > 0 then
  begin
       Query1.Close;
       Result    := False;
       ErrorText := '자료중복';
       System.Exit;
  end;

  if not Check_Date(All_Data.DutyDate[idx]) then
  begin
       Result    := False;
       ErrorText := '일자오류';
       System.Exit;
  end;

  Query1.Close;
  Result    := true;
  ErrorText := '자료없음';
end;

Function TFm_Batch.delete_Record(Idx:Integer):Boolean;
var
  Tem  : String;
begin
  with All_Data do
  begin
       Tem     := ' DELETE FROM PKHOLIEMP                                 '+
                  '  WHERE DUTYDATE = ''' + Dutydate[idx]          + '''  '+
                  '    AND EMPNO    = ''' + Empno[Idx]             + '''  '+
                  '    AND DUKIND   = ''' + Dukind[Idx]            + '''  ';
  end;

  with Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(Tem);
       Try
            Execsql;
       Except On E:EDATABASEERROR Do
            begin
                 close;
                 Result := False;
                 ErrorText := 'SQL ERROR';
                 Application.MessageBox('SQL ERROR','경고',Mb_Ok +Mb_IconError);
            end;
       end;
       Result := True;
       Close;
  end;
end;

Function TFm_Batch.Check_Date(InDate : String) : Boolean;
var
  Temp   : Real;
begin
  if Length(InDate) <> 8 then
  begin
       Result := False;
       System.Exit;
  end;

  InDate := Copy(InDate,1,4) + DateSeParator +
            Copy(InDate,5,2) + DateSeParator + Copy(InDate,7,2);
  Try
       Temp   := StrToDate(InDate);
  Except on EConvertError do
       begin
            Result := False;
            System.Exit;
       end;
  end;
  Result         := True;
end;

Function TFm_Batch.Check_DataValid(idx : integer) : Boolean;
begin
  ErrorText := '';

  with Query1 do
  begin
       Close;
       Sql.Clear ;
       Sql.Add ('select Korname from Pimpmas                       ');
       Sql.Add (' where EMPNO   = '''+ All_Data.Empno[idx]   +'''  ');
       Open;

       if Query1.RecordCount <= 0 then
       begin
            Query1.Close;
            Result := false;
            ErrorText := '인사테이블에 없는 사번';
            System.Exit;
       end;
  end;

  Result         := True;
end;

Function TFm_Batch.Insert_Record(Idx:Integer):Boolean;
var
  Tem1, Tem2  : String;
begin
  with All_Data do
  begin

       Tem1    := ' INSERT INTO PKHOLIEMP                                 '+
                  '        ( DUTYDATE, EMPNO, Dukind, BIGO,               '+
                  '          WRITEMAN, WRITETIME     )                    '+
                  ' VALUES (                                              ';
       Tem2    := '          '''       + Dutydate[idx]          + ''' ,   '+
                  '          '''       + Empno[Idx]             + ''' ,   '+
                  '          '''       + Dukind[idx]            + ''' ,   '+
                  '          '''       + Bigo[idx]              + ''' ,   '+
                  '          '''       + Pempno                 + ''' ,   '+   // 작업자
                  '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')       )  ';
  end;

  with Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(Tem1+ Tem2);

       Try
            Execsql;
       Except On E:EDATABASEERROR Do
            begin
                 close;
                 Result := False;
                 ErrorText := 'SQL ERROR';
                 Application.MessageBox('SQL ERROR','경고',Mb_Ok +Mb_IconError);
            end;
       end;
       Result := True;
       Close;
  end;
end;

procedure TFm_Batch.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_Batch.Sb_InsertClick(Sender: TObject);
var
  Error_text : String;
  GoodData,BadData: Integer;    //정상,비정상 자료 count
  j : integer;
begin
  if TOnFocusButton(Sender).Tag = 1 then
  begin
       if IDNo = Application.MessageBox(PChar('일괄 등록작업을 하시겠습니까?'),'작업안내',MB_YesNo+MB_ICONWARNING) then
            Exit;
  end
  else if TOnFocusButton(Sender).Tag = 2 then
  begin
       if IDNo = Application.MessageBox(PChar('일괄 삭제작업을 하시겠습니까?'),'작업안내',MB_YesNo+MB_ICONWARNING) then
            Exit;
  end;
  if Edatafile.text = '' then
  begin
       ShowMessage('데이터 화일명이 없습니다. 확인후 다시 작업하세요.');
       Edatafile.SetFocus;
       Exit;
  end;

  if Eerrorfile.text = '' then
  begin
       ShowMessage('오류 기록 화일명이 없습니다. 확인후 다시 작업하세요.');
       Eerrorfile.SetFocus;
       Exit;
  end;

  AssignFile(F1, Edatafile.text);
  Reset(F1);
 
  AssignFile(F2, Eerrorfile.text);
  Rewrite(F2);

  k := 1;
  GoodData := 0;  BadData := 0;

  while not Eof(F1) do
  begin
       with All_data do
       begin
            Readln(F1, Ch);
            StrPCopy(A,ch);
            P := A;

            DutyDate[k]    := new_passemp(P,0,',');     //초과근무일
            Empno[k]       := new_passemp(P,1,',');     //사번
            if Fm_Batch.Tag = 1 then
                 Dukind[k] := '00'                      //정상근무
            else
                 Dukind[k] := '49';                     //휴일적용
            Bigo[k]        := new_passemp(P,2,',');     //비고

            k := k+1;
       end;
  end;

  LastRec := k - 1;
/////////////////////////////////////////////////////////
  if TOnFocusButton(Sender).Tag = 1 then
  begin
       k := 1;
       For j := 1 to LastRec do
       begin
            ErrorText := '';
            PHelpMsg.Caption := '   [ ' + IntToStr(k) + ' / ' + IntToStr(LastRec) + ' ] 에 대해 등록 작업 중...';
            Application.ProcessMessages;

            if (Fm_Batch.Tag=1) AND Check_Holidate(k)  AND Check_DataValid(k) AND Check_Duplicate(k) then
            begin
                if Insert_Record(k) then
                   Inc(Gooddata)
                else
                begin
                     Error_text := All_data.DutyDate[k] +','+All_data.Empno[k] +','+
                                   All_data.Bigo[k] +' Error '+ ErrorText ;
                     Writeln(F2, Error_text);    // Error File에 기록
                     Inc(Baddata) ;
                end;
            end
            else
            if (Fm_Batch.Tag=2) AND (not Check_Holidate(k)) AND Check_DataValid(k) AND Check_Duplicate(k) then
            begin
                if Insert_Record(k) then
                   Inc(Gooddata)
                else
                begin
                     Error_text := All_data.DutyDate[k] +','+All_data.Empno[k] +','+
                                   All_data.Bigo[k] +' Error '+ ErrorText ;
                     Writeln(F2, Error_text);    // Error File에 기록
                     Inc(Baddata) ;
                end;
            end
            else
            begin
                 Error_text := All_data.DutyDate[k] +','+All_data.Empno[k] +','+
                               All_data.Bigo[k] +' Error '+ ErrorText ;
                 Writeln(F2, Error_text);    // Error File에 기록
                 Inc(Baddata) ;
            end;
            Inc(k);
       end;

       CloseFIle(F2);
       PHelpMsg.Caption := Format('일괄 등록 작업을 모두 마쳤습니다.. 총자료건수 %d 건 , 등록건수 %d 건, 오류건수 %d 건',
                                  [LastRec , GoodData, BadData]);
  end
  else if TOnFocusButton(Sender).Tag = 2 then
  begin
       k := 1;
       For j := 1 to LastRec do
       begin
            ErrorText := '';
            PHelpMsg.Caption := '   [ ' + IntToStr(k) + ' / ' + IntToStr(LastRec) + ' ] 에 대해 삭제 작업 중...';
            Application.ProcessMessages;

            if (Fm_Batch.Tag=1) AND Check_Holidate(k)  AND Check_DataValid(k) AND (not Check_Duplicate(k)) then
            begin
                if Delete_Record(k) then
                   Inc(Gooddata)
                else
                begin
                     Error_text := All_data.DutyDate[k] +','+All_data.Empno[k] +','+
                                   All_data.Bigo[k] +' Error '+ ErrorText ;
                     Writeln(F2, Error_text);    // Error File에 기록
                     Inc(Baddata) ;
                end;
            end
            else
            if (Fm_Batch.Tag=2) AND (not Check_Holidate(k)) AND Check_DataValid(k) AND (not Check_Duplicate(k)) then
            begin
                if Delete_Record(k) then
                   Inc(Gooddata)
                else
                begin
                     Error_text := All_data.DutyDate[k] +','+All_data.Empno[k] +','+
                                   All_data.Bigo[k] +' Error '+ ErrorText ;
                     Writeln(F2, Error_text);    // Error File에 기록
                     Inc(Baddata) ;
                end;
            end
            else
            begin
                 Error_text := All_data.DutyDate[k] +','+All_data.Empno[k] +','+
                               All_data.Bigo[k] +' Error '+ ErrorText ;
                 Writeln(F2, Error_text);    // Error File에 기록
                 Inc(Baddata) ;
            end;
            Inc(k);
       end;

       CloseFIle(F2);
       PHelpMsg.Caption := Format('일괄 삭제 작업을 모두 마쳤습니다.. 총자료건수 %d 건 , 삭제건수 %d 건, 오류건수 %d 건',
                                  [LastRec , GoodData, BadData]);
  end;
end;


procedure TFm_Batch.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
       Edatafile.text := OpenDialog1.FileName ;
       p := pchar(Edatafile.text);
       Eerrorfile.text := new_passEmp(p,0,'.') + '.bad' ;
       Error_file := Eerrorfile.text ;
  end;
end;

procedure TFm_Batch.Button1Click(Sender: TObject);
begin
  winexec(pchar('C:\WINDOWS\NOTEPAD.EXE '+Eerrorfile.Text),SW_SHOW );
end;

end.
