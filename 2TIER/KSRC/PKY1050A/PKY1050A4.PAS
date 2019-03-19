unit PKY1050A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Datelib, db, Func;//, DRMUnit 2016.07.13 jissi Not Used�� �ּ�ó��

type

  TAllData = Record
     OvtmDate     :array[1..500] of String[08];        { �ٹ���               }
     Empno        :array[1..500] of String[04];        { ���                 }
     KorName      :array[1..500] of String[12];        { ����                 }
     FrRealTime   :array[1..500] of String[12];        { �������ýð�         }
     ToRealTime   :array[1..500] of String[12];        { ��������ð�         }
     Restmm       :array[1..500] of String[3] ;        { �Ұ����ܽð�(��)     }
     SPRestmm     :array[1..500] of String[3] ;        { �޽Ľð�(��)         }
     OvtmDesc     :array[1..500] of String[100];       { �ٹ�����             }
     ConYN        :array[1..500] of String[1];         { ���翩��             }
     End;

  TFM_Sub3 = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Button2: TButton;
    Panel7: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Edatafile: TEdit;
    Eerrorfile: TEdit;
    Button1: TButton;
    BB_Save: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure Button2Click(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Function Insert_Record(Idx:Integer):Boolean;
    Function Check_Empno( idx : integer ) : Boolean;
    Function new_PassEmp(var cmd : Pchar; gu : integer; separ:String) : string;
    Function Check_DataValid(idx : integer) : Boolean;
    Function Add_Days(InDate : String; M : Integer) : String;
    Function Check_Date(InDate : String) : Boolean;
    Function Check_Time(InTime : String) : Boolean;
    Function Check_Duplicate( idx : Integer ) : Boolean;
    Function Check_Range(TmpFrrealtime, Tmptorealtime : String ; idx : integer;
                            var DateTime1,DateTime2 :String): Boolean;
    Function To_DateTime(Tmp :String):Extended;

    //2015.06 jissi �ϰ� ��� üũ ��ƾ(�ٹ���, ���ϱٹ��ð�, �޽Ľð�) �߰�/////////////////////////////
    Function Check_Frrealdate( idx : integer ) : Boolean; //�ٷ��ϰ� �ٷν����� ����ġ üũ
    Function Check_Frrealtime( idx : integer ) : Boolean; //���� �ٷν��۽ð� 09:00-18:00������ �ð� üũ
    Function Check_restmm( idx : integer ) : Boolean;     //�޽����ܺ��� 1-9�� ���� ��� üũ
    /////////////////////////////////////////////////////////////////////////////////////////////////////
  public
    { Public declarations }
    LastRec : Integer;
    k : integer;
    All_data :  TAllData;
    F1, F2 : TextFile  ;
    ErrorText : string;          // ���� ����
    Error_file : string;
    P : PChar;
    ch: string;
    //A: array[0..50] of Char;  //Exception EAccessViolation Error�� ���� ���� 2015.06 jissi
    A: array[0..255] of Char;
  end;

var
  FM_Sub3: TFM_Sub3;

implementation

uses PKY1050A0, PKY1050A1;

{$R *.DFM}

procedure TFM_Sub3.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
       //2015.06 jissi �����Ҵ� ��ƾ �����ư�̺�Ʈ���� ��ġ �̵�
       //AssignFile(F1, OpenDialog1.Filename);
       //Reset(F1);
       Edatafile.text := OpenDialog1.FileName ;
       p := pchar(Edatafile.text);
       Eerrorfile.text := new_passEmp(p,0,'.') + '.bad' ;
       //Error_file := Eerrorfile.text ;
       //AssignFile(F2, Error_file );
       //Rewrite(F2);
  end;
end;

procedure TFM_Sub3.BB_SaveClick(Sender: TObject);
var
   Error_text : String;
   GoodData,BadData: Integer;    //����,������ �ڷ� count
   j : integer;
   CsvFile  : array [0..255] of Char; //PCSS ��ȣȭ �۾�
begin
  if IDNo = Application.MessageBox(PChar('�ϰ������۾��� �Ͻðڽ��ϱ�?'),'�۾��ȳ�',MB_YesNo+MB_ICONWARNING) then
       Exit;

  if Edatafile.text = '' then
  begin
       ShowMessage('������ ȭ�ϸ��� �����ϴ�. Ȯ���� �ٽ� �۾��ϼ���.');
       Edatafile.SetFocus;
       Exit;
  end ;


  if Eerrorfile.text = '' then
  begin
       ShowMessage('���� ��� ȭ�ϸ��� �����ϴ�. Ȯ���� �ٽ� �۾��ϼ���.');
       Eerrorfile.SetFocus;
       Exit;
  end;

  //��ȣȭ �۾� ���ȿ� ����Ǵ� ������ �߰� ����. Test�ÿ��� ����ϵ���...2015.06 jissi
  //DRMUnit.pas ����... : PCSS �� ���� �������� ��ȣȭ ���� Control...
  //StrCopy(CsvFile, PChar(OpenDialog1.FileName));
  //fnDecryptFileChorus(CsvFile);  //DRM Excel ���� ��ȣȭ �۾�
  //AssignFile(F1, CsvFile);

  AssignFile(F1,OpenDialog1.Filename);
  Reset(F1);

  AssignFile(F2, Eerrorfile.text  );
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
            OvtmDate[k]   := new_passemp(P,0,',');     //�ʰ��ٹ���
            Empno[k]      := new_passemp(P,1,',');     //���
            KorName[k]    := new_passemp(P,2,',');     //����
            FrRealTime[k] := new_passemp(P,3,',');     //���۽ð�
            ToRealTime[k] := new_passemp(P,4,',');     //����ð�
            restmm[k]     := new_passemp(P,5,',');
            sprestmm[k]   := new_passemp(P,6,',');
            OvtmDesc[k]   := new_passemp(P,7,',');     //�ٹ�����
            conyn[k]      := new_passemp(P,8,',');
            k := k+1;
       end;
  end;

  CloseFile(F1);
  
  LastRec := k - 1;
/////////////////////////////////////////////////////////
  k := 1;
  For j := 1 to LastRec do
  begin
       ErrorText := '';
       PHelpMsg.Caption := '   [ ' + IntToStr(k) + ' / ' + IntToStr(LastRec) + ' ] �� ���� ���� �۾� ��...';
       Application.ProcessMessages;

       //2015.06 jissi �ϰ� ��� üũ ��ƾ(�ٹ���, ���ϱٹ��ð�, �޽Ľð�) �߰�
       //if Check_empno(k)       AND Check_DataValid(k)   AND Check_Duplicate(k) then
       if Check_empno(k)       AND Check_DataValid(k)   AND Check_Duplicate(k) AND
          Check_Frrealdate(k)  AND Check_Frrealtime(k)  AND Check_restmm(k)    then
       begin
            if Insert_Record(k) then
                 Inc(Gooddata)
            else
            begin
                 Error_text := All_data.OvtmDate[k]   +','+ All_data.empno[k]     +','+ All_data.KorName[k]  +','+
                               All_data.FrRealTime[k] +','+ All_data.ToRealTime[k]+','+
                               All_data.Restmm[k]     +','+ All_data.SPRestmm[k]  +','+ All_data.OvtmDesc[k] +','+
                               All_data.Conyn[k]      +','+ ErrorText ;
                 Writeln(F2, Error_text);    // Error File�� ���
                 Inc(Baddata) ;
            end;
       end
       else
       begin
            Error_text := All_data.OvtmDate[k]   +','+ All_data.empno[k]     +','+ All_data.KorName[k]  +','+
                          All_data.FrRealTime[k] +','+ All_data.ToRealTime[k]+','+
                          All_data.Restmm[k]     +','+ All_data.SPRestmm[k]  +','+ All_data.OvtmDesc[k] +','+
                          All_data.Conyn[k]      +','+ ErrorText ;
            Writeln(F2, Error_text);    // Error File�� ���
            Inc(Baddata) ;
       end;
       Inc(k);
  end;

  CloseFile(F2);
  PHelpMsg.Caption := Format('�۾��� ��� ���ƽ��ϴ�.. ���ڷ�Ǽ� %d �� , ����Ǽ� %d ��, �����Ǽ� %d ��',
                             [LastRec , GoodData, BadData]);
end;

{===============================================================================
         Insert_Record Function
================================================================================}
Function TFM_Sub3.Insert_Record(Idx:Integer):Boolean;
var
   Tem1, Tem2  : String;
begin
  with All_Data do
  begin

       Tem1       := ' INSERT INTO PKHOTHIS( OVTMDATE, EMPNO, KORNAME, FRREALTIME, TOREALTIME,  '+
                     '                       RESTMM, sprestmm, OVTMDESC, CONYN, ' +
                     '                       CONEMP, CONTIME,      ' +
                     '                       WRITEMAN, WRITETIME     )                 ' +
                     ' VALUES (                                                        ';
       Tem2       := ''''       + Ovtmdate[idx]     + ''' ,  ' +
                     ''''       + EmpNo[Idx]        + ''' ,  ' +
                     ''''       + KorName[Idx]      + ''' ,  ' +
                     ''''       + FrrealTime[idx]   + ''' ,  ' +
                     ''''       + ToRealTime[idx]   + ''' ,  ' +
                     ''''       + RESTMM[idx]       + ''',   ' +
                     ''''       + SPRESTMM[idx]     + ''',   ' +
//                     ''''       + OvtmDesc[idx]     + ''' ,  ' +
//                     ''''       + copy(OvtmDesc[idx],1,37)     + ''' ,  ' +
                     ''''       + copy(OvtmDesc[idx],1,98)     + ''' ,  ' +
                     ''''       + ConYN[idx]        + ''' ,  ' +
                     ''''       + Pempno          + ''' ,  ' +   // ������
                     'TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ,  ' +
                     ''''       + Pempno          + ''' ,  ' +   // �۾���
                     'TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')   )' ;
  end;

  with Dm.Query1 do
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
            Application.MessageBox('SQL ERROR','���',Mb_Ok +Mb_IconError);
            end;
       end;
       Result := True;
       Close;
  end;
end;

Function TFM_Sub3.new_PassEmp(var cmd : Pchar; gu : integer; separ:String) : string;
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

Function  TFM_Sub3.Check_Empno( idx : integer ) : Boolean;
var tem : string;
begin
  ErrorText := '';
  Tem := ' SELECT KORNAME               ' +
         '   FROM PIMPMAS               ' +
         Format(' WHERE  EMPNO = ''%s'' ',[All_data.EmpNo[idx]])+
         '    AND EMPNO like ''Y%''     ' ;

  with DM.Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(Tem);
       Open;
  end;

  if Dm.Query1.RecordCount > 0 then
       result := True
  else
  begin
       result := False;
       ErrorText := '�̵�ϻ��or�İ����ƴ�';  //'�̵�ϻ��'
  end;

  Dm.Query1.Close;
end;

Function TFM_Sub3.Check_Duplicate( idx : Integer ) : Boolean;
var
   i,j       : Integer;
   DateTime1 : String;
   DateTime2 : String;
   Flag      : Boolean;
   Tem       : String;
begin
  Tem := 'SELECT OVTMDATE, FRREALTIME, TOREALTIME           ' +
         '  FROM PKHOTHIS                                   ' +
  Format(' WHERE EMPNO = ''%s'' AND LENGTH(TOREALTIME) = 12 ',
                  [All_data.EmpNo[idx]]) +
         '   AND UPPER(CONYN) = ''Y''                       ' +
         '   AND OVTMDATE BETWEEN to_char(to_date('''+All_data.Ovtmdate[idx]+''',''YYYYMMDD'') - 1, ''YYYYMMDD'') '+
         '                  AND   to_char(to_date('''+All_data.Ovtmdate[idx]+''',''YYYYMMDD'') + 1, ''YYYYMMDD'') ' ;

  with Dm.Query1 do
  begin
       close;
       sql.Clear;
       Sql.Add(Tem);
       Open;
  end;

  if Dm.Query1.Eof then
  begin
       Dm.Query1.Close;
       Result := True;
       System.Exit;
  end;

   j := Dm.Query1.RecordCount;

  Flag  := True;
  For i := 1 to j do
  begin
       Flag := Check_Range(Dm.Query1.FieldByName('Frrealtime').AsString,
                           Dm.Query1.FieldByName('torealtime').AsString,
                           idx,
                           DateTime1,DateTime2);

       if not Flag then Break;
       Dm.Query1.Next;
  end;

  Dm.Query1.Close;

  if not Flag then
  begin
       ErrorText := '�ٹ��ð� �ߺ� ����';
  end;

  Result := Flag;
end;


{==============================================================================
         �̹� ��û�� ������ �ߺ����θ� üũ�ϴ� Procedure.
 ==============================================================================}
Function TFM_Sub3.Check_Range(TmpFrrealtime, Tmptorealtime : String ; idx : integer ;
                            var DateTime1,DateTime2 :String): Boolean;
var
   Value1       : Extended;
   Value2       : Extended;
   SValue       : Extended;
   EValue       : Extended;
begin
  Value1 := To_DateTime(TmpFrRealTime);
  Value2 := To_DateTime(TmpToRealTime);
  SValue := To_DateTime(All_data.FrRealTime[idx] );
  EValue := To_DateTime(All_data.ToRealTime[idx]);

  if ((SValue >  Value1)  AND (EValue <  Value2)) OR
     ((SValue >= Value1)  AND (SValue <= Value2)) OR
     ((EValue >= Value1)  AND (EValue <= Value2)) then
  begin
       DateTime1 := TmpFrRealTime;
       DateTime2 := TmpToRealTime;
       Result    := False;
       System.Exit;
  end;
  Result := True;
end;

//2015.06 jissi �ٹ��ϰ� �ٹ������� ����ġ üũ �Լ�
Function  TFM_Sub3.Check_Frrealdate( idx : integer ) : Boolean;
var tem : string;
begin
  if All_data.Ovtmdate[idx] = copy(All_data.FrRealTime[idx],1,8) then
       result := True
  else
  begin
       result := False;
       ErrorText := '�ٹ��ϰ� �ٹ������� ����ġ ����';
  end;
end;

//2015.06 jissi �ʰ��ٷν��۽ð� ���� 09:00-18:00������ �ð� üũ �Լ�
Function  TFM_Sub3.Check_Frrealtime( idx : integer ) : Boolean;
var tem : string;
begin
  {
  Tem := ' select decode((SELECT COUNT(*) cnt FROM PKCHOLI                                                  '+
         Format('          WHERE HOLIDATE = substr(''%s'',1,8)), 0, ',          [All_data.FrRealTime[idx]])  +
         Format('        case when to_char(to_date(substr(''%s'',1,8),''YYYYMMDD''),''D'') ',[All_data.FrRealTime[idx]])  +
         '                         in (2,3,4,5,6)                                                           '+
         '                    then 0 else 1 end, 1) chkholi                                                 '+
         '   from dual                                                                                      ';
  }
  //2016.04.06 jissi ���� �������� Ư���� �ش��� �ʰ��ٹ� ��ϰ������ üũ ���� ����
  Tem :=        ' select decode((SELECT COUNT(*) cnt             '+
                '    FROM                                        '+
                '   (                                            '+
                '   SELECT   HOLIDATE                            '+
                '      FROM   PKCHOLI                            '+
         Format('     WHERE   HOLIDATE = substr(''%s'',1,8)      ',   [All_data.FrRealTime[idx]])  +
                '    UNION                                       '+
                '    SELECT   DUTYDATE                           '+
                '      FROM   PKHOLIEMP                          '+
         Format('     WHERE   DUTYDATE = substr(''%s'',1,8)      ',   [All_data.FrRealTime[idx]])  +
         Format('       AND   empno    = ''%s''                  ',   [All_data.Empno[idx]])       +
                '       AND   DUKIND   = ''49''     /*��������*/ '+
                '    MINUS                                       '+
                '    SELECT   DUTYDATE                           '+
                '      FROM   PKHOLIEMP                          '+
         Format('     WHERE   DUTYDATE = substr(''%s'',1,8)      ',   [All_data.FrRealTime[idx]])  +
         Format('       AND   empno    = ''%s''                  ',   [All_data.Empno[idx]])       +
                '       AND   DUKIND   = ''00''     /*��������*/ '+
                '   )                                            '+
                '  ), 0,                                         '+
         Format('  case when to_char(to_date(substr(''%s'',1,8), '+
                '                    ''YYYYMMDD''),''D'')        ',   [All_data.FrRealTime[idx]])  +
                '                in (2,3,4,5,6)                  '+
                '       then 0 else 1 end, 1) chkholi            '+
                ' from dual                                      ';

  with DM.Query1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(Tem);
       Open;
  end;

  if Dm.Query1.fieldbyname('chkholi').Asinteger = 0 then      //�����϶�
  begin
       result := True;
       if  (copy(All_data.FrRealTime[idx],9,4) >= '0900') and
           (copy(All_data.FrRealTime[idx],9,4) <  '1800') then
       begin
            result := False;
            ErrorText := '�ʰ��ٷν��۽ð� ���� 09:00~18:00������ �ð� ��� ����';
       end;
  end
  else
  begin
       result := True;
  end;
  Dm.Query1.Close;
end;

//2015.06 jissi �޽����ܺ� 1~9������ ��� ���� üũ �Լ�
Function  TFM_Sub3.Check_restmm( idx : integer ) : Boolean;
var tem : string;
begin
  if  ((strtoint(All_data.RESTMM[idx])   >= 1) and (strtoint(All_data.RESTMM[idx])   <= 9)) or
      ((strtoint(All_data.SPRESTMM[idx]) >= 1) and (strtoint(All_data.SPRESTMM[idx]) <= 9)) then
  begin
       result := False;
       ErrorText := '�޽����ܺ��� 1~9������ ��� ����';
  end
  else
  begin
       result := True;
  end;
end;

Function TFM_Sub3.To_DateTime(Tmp :String):Extended;
var
   A            : Extended;
   B            : Extended;
   Buf          : String;
begin
  Buf    := Copy(Tmp,1,4) + DateSeparator +
            Copy(Tmp,5,2) + DateSeparator +
            Copy(Tmp,7,2);

  A      := StrToDate(Buf);
  Buf    := Copy(Tmp,9,2) + TimeSeparator + Copy(Tmp,11,2);
  B      := StrToTime(Buf);
  Result := A + B;
end;

Function TFM_Sub3.Check_DataValid(idx : integer) : Boolean;
var
   TmpDate : String[08];
   TmpTime : String[08];
begin
  //ErrorText := '';

  with DM.Query1 do
  begin
       Close;
       Sql.Clear ;
       Sql.Add (' select fixmon from pkcotbas                 ');
       Open;

       if StrToInt(Fieldbyname('fixmon').AsString ) >= StrToInt(copy(All_Data.Ovtmdate[idx],1,6)) then
       begin
            ErrorText := '������ �ٹ���';
            result := False;
            System.Exit;
       end;
  end;

  //... �����ٹ������ϰ� ��¥�� Check
  TmpDate := Copy(All_Data.FrRealTime[idx],1,8);
  TmpTime := Copy(All_Data.FrRealTime[idx],9,4);

  if not Check_Date(TmpDate) then
  begin
       Result    := False;
       ErrorText := '�ٹ������Ͽ���';
       System.Exit;
  end;

  if not Check_Time(TmpTime) then
  begin
       Result         := False;
       ErrorText := '�ٹ����۽ð�����';
       System.Exit;
  end;

  //... �����ٹ������ϰ� ��¥�� Check
  TmpDate := Copy(All_Data.ToRealTime[idx],1,8);
  TmpTime := Copy(All_Data.ToRealTime[idx],9,4);

  if not Check_Date(TmpDate) then
  begin
       Result         := False;
       ErrorText := '�ٹ������Ͽ���';
       System.Exit;
  end;

  if not Check_Time(TmpTime) then
  begin
       Result         := False;
       ErrorText := '�ٹ�����ð�����';
       System.Exit;
  end;

  if All_Data.FrRealTime[idx] > All_Data.ToRealTime[idx] then
  begin
       Result   := False;
       ErrorText := '�ٹ������� > �ٹ������� ����';
       System.Exit;
  end;

  if Copy(All_Data.ToRealTime[idx],1,8) >
           Add_Days(Copy(All_Data.FrRealTime[idx],1,8),1) then
  begin
       Result := False;
       ErrorText := '�����Ϲ�������';
       System.Exit;
  end;

  Result         := True;
end;

//������¥
Function TFM_Sub3.Add_Days(InDate : String; M : Integer) : String;
var
   Tmp : Real;
   Buf : String;
begin
  Buf    := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator +
            Copy(InDate,7,2);
  Tmp    := StrToDate(Buf);
  Tmp    := Tmp + M;
  Result := FormatDateTime('YYYYMMDD',Tmp);
end;


{===============================================================================
         �ʰ��ٹ����� ��Ȯ�� ���� �����ϴ� �Լ�.
 ===============================================================================}
Function TFM_Sub3.Check_Date(InDate : String) : Boolean;
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

{==============================================================================
         �ð����� ��ȿ���� check�ϴ� �Լ�.
===============================================================================}
Function TFM_Sub3.Check_Time(InTime : String) : Boolean;
var
   Hour, Min : Integer;
begin
  if Length(InTime) <> 4 then
  begin
       Result := False;
       System.Exit;
  end;

  Hour := StrToInt(Copy(InTime,1,2));
  Min  := StrToInt(Copy(InTime,3,2));

  if (Hour < 0) OR (Hour >= 24) OR (Min < 0) OR (Min >= 60) then
  begin
       Result := False;
       System.Exit;
  end;
  Result := True;
end;


procedure TFM_Sub3.Button1Click(Sender: TObject);
begin
  winexec(pchar('C:\WINDOWS\NOTEPAD.EXE '+Eerrorfile.Text),SW_SHOW );
end;

end.