unit pic4013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, Mask, ExtCtrls, Db, DBTables;

type
  Tpic4013aForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    empyy1: TMaskEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    empyy2: TMaskEdit;
    Panel3: TPanel;
    Gauge1: TGauge;
    exit: TBitBtn;
    Brun: TBitBtn;
    Panel4: TPanel;
    readnum: TLabel;
    savenum: TLabel;
    Qchk: TQuery;
    Qin: TQuery;
    Qall: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure BrunClick(Sender: TObject);
    procedure empyy1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    keycheck : integer;
  public
    { Public declarations }
     function data_exist_check(s1 : string): string;
     procedure batchinput;
  end;

var
  pic4013aForm: Tpic4013aForm;
  psgubun1,psgubun2,psgubun3,prayear : String[4];
  ppaycl,pjobgun,pjobline,pgubun : string[2];
  pmark1 ,pmark2 ,pmark3 ,pmark4 ,pmark5  : String[20];
  pmark6 ,pmark7 ,pmark8 ,pmark9 ,pmark10 : String[20];
  pvalue1,pvalue2,pvalue3,pvalue4,pvalue5 : String[20];
  pvalue6,pvalue7,pvalue8,pvalue9: String[20];
  pleng1, pleng2, pleng3, pleng4,pleng5,pleng6,pleng7,pleng8,pleng9: integer;
  rstr1 ,tempno : string;
implementation

uses pic4011;

{$R *.DFM}


procedure Tpic4013aForm.FormActivate(Sender: TObject);
begin
  KeyCheck := 0;
  empyy1.SetFocus;
end;

procedure Tpic4013aForm.exitClick(Sender: TObject);
begin
  close;
  pic4011aForm.rayear.setfocus;
end;

procedure Tpic4013aForm.BrunClick(Sender: TObject);
begin
   if ((empyy1.text <> '') and (empyy2.text <> '') ) then begin
      if (empyy1.text = empyy2.text)  then begin
            Showmessage(' 값 중복입니다..');
            empyy1.SetFocus;
       end  else begin
         if data_exist_check(empyy2.text)='OK' then begin  // 신규자료존재안함.
                BatchInput;   //일괄등록
                Showmessage('작업을 완료했습니다.!');
                empyy1.SetFocus;
         end;
       end;
    end
    else begin showmessage('승격년도를 입력하십시요!!'); system.exit; end;
end;

// 기존 승격년도의 자료가 존재하면...................................
function Tpic4013aForm.data_exist_check(s1 : string): string;
begin
   Qchk.close; Qchk.sql.clear;
   Qchk.sql.add('select * from pimraba ');
   Qchk.sql.add('where rayear = :lrayear ');
   Qchk.parambyname('lrayear').ASstring := s1;
   Qchk.open;
   if Qchk.recordcount > 0 then begin
     if MessageBox(handle,'기존자료가 있습니다. 계속하시겠습니까?','알 림',MB_YESNO)=ID_YES then begin
        Qchk.close;Qchk.sql.clear;
        Qchk.sql.add('delete from pimraba ');
        Qchk.sql.add('where rayear = :lrayear ');
        Qchk.parambyname('lrayear').ASstring := s1;
        Qchk.EXECSQL;
     end;
   end;
   data_exist_check := 'OK';
end;

// 일괄등록.............................................................
procedure Tpic4013aForm.batchinput;
var
   Ci :integer;
begin
  rstr1 := pic4011aForm.rstr;
  tempno := copy(pic4011aForm.pempno,1,4);
  Qall.close; Qall.sql.clear;
  Qall.sql.add('select rayear,gubun,paycl,jobgun,jobline,sgubun1,sgubun2,sgubun3, ');
  Qall.sql.add('       mark1,leng1,value1,mark2,leng2,value2,   '                   );
  Qall.sql.add('       mark3,leng3,value3,mark4,leng4,value4,   '                   );
  Qall.sql.add('       mark5,leng5,value5,mark6,leng6,value6,   '                   );
  Qall.sql.add('       mark7,leng7,value7,mark8,leng8,value8, mark9,leng9,value9  ');
  Qall.sql.add('from pimraba where rayear = :lrayear ');
  Qall.parambyname('lrayear').Asstring := empyy1.text;
  Qall.open;
  readnum.Caption :=inttostr(Qall.Recordcount);      // 읽은 건수
  ci := 0;
  While not QAll.Eof do begin
       Application.processMessages; {이벤트 메세지를 지연시킨다..}
       Gauge1.Progress := Ci * (100 div QAll.RecordCount);
       prayear    := QAll.Fields[0].AsString;
       pgubun     := QAll.Fields[1].AsString;
       ppaycl     := QAll.Fields[2].AsString;
       pjobgun    := QAll.Fields[3].AsString;
       pjobline   := QAll.Fields[4].AsString;
       psgubun1   := QAll.Fields[5].AsString;
       psgubun2   := QAll.Fields[6].AsString;
       psgubun3   := QAll.Fields[7].AsString;
       pmark1    := QAll.Fields[8].AsString;
       pleng1    := QAll.Fields[9].Asinteger;
       pvalue1   := QAll.Fields[10].Asstring;
       pmark2    := QAll.Fields[11].AsString;
       pleng2    := QAll.Fields[12].Asinteger;
       pvalue2   := QAll.Fields[13].AsString;
       pmark3    := QAll.Fields[14].AsString;
       pleng3    := QAll.Fields[15].Asinteger;
       pvalue3   := QAll.Fields[16].AsString;
       pmark4    := QAll.Fields[17].AsString;
       pleng4    := QAll.Fields[18].Asinteger;
       pvalue4   := QAll.Fields[19].AsString;
       pmark5    := QAll.Fields[20].AsString;
       pleng5    := QAll.Fields[21].Asinteger;
       pvalue5   := QAll.Fields[22].AsString;
       pmark6    := QAll.Fields[23].AsString;
       pleng6    := QAll.Fields[24].Asinteger;
       pvalue6   := QAll.Fields[25].AsString;
       pmark7    := QAll.Fields[26].AsString;
       pleng7    := QAll.Fields[27].Asinteger;
       pvalue7   := QAll.Fields[28].AsString;
       pmark8    := QAll.Fields[29].AsString;
       pleng8    := QAll.Fields[30].Asinteger;
       pvalue8   := QAll.Fields[31].AsString;
       pmark9    := QAll.Fields[32].AsString;
       pleng9    := QAll.Fields[33].Asinteger;
       pvalue9   := QAll.Fields[34].AsString;

       Qin.close; Qin.sql.clear;
       Qin.sql.add('insert into pimraba ');
       Qin.sql.add('( rayear,gubun,paycl,jobgun,jobline,sgubun1,sgubun2,sgubun3,');
       Qin.sql.add('  mark1,leng1,value1,mark2,leng2,value2,mark3,leng3,value3, ');
       Qin.sql.add('  mark4,leng4,value4,mark5,leng5,value5,mark6,leng6,value6, ');
       Qin.sql.add('  mark7,leng7,value7,mark8,leng8,value8,mark9,leng9,value9, ');
       Qin.sql.add('  writetime,writeemp ) '                                     );
       Qin.SQL.Add('values('''+empyy2.text+''','''+pgubun+''', ');
       Qin.SQL.Add(' '''+ppaycl+''','''+pjobgun+''','''+pjobline+''', ');
       Qin.SQL.Add(' '''+psgubun1+''','''+psgubun2+''','''+psgubun3+''', ');
       Qin.SQL.Add(' '''+pmark1+''','''+inttostr(pleng1)+''','''+pvalue1+''', ');
       Qin.SQL.Add(' '''+pmark2+''','''+inttostr(pleng2)+''','''+pvalue2+''', ');
       Qin.SQL.Add(' '''+pmark3+''','''+inttostr(pleng3)+''','''+pvalue3+''', ');
       Qin.SQL.Add(' '''+pmark4+''','''+inttostr(pleng4)+''','''+pvalue4+''', ');
       Qin.SQL.Add(' '''+pmark5+''','''+inttostr(pleng5)+''','''+pvalue5+''', ');
       Qin.SQL.Add(' '''+pmark6+''','''+inttostr(pleng6)+''','''+pvalue6+''', ');
       Qin.SQL.Add(' '''+pmark7+''','''+inttostr(pleng7)+''','''+pvalue7+''', ');
       Qin.SQL.Add(' '''+pmark8+''','''+inttostr(pleng8)+''','''+pvalue8+''', ');
       Qin.SQL.Add(' '''+pmark9+''','''+inttostr(pleng9)+''','''+pvalue9+''', ');
       Qin.SQL.Add(' '''+Copy(rStr1,1,15)+''','''+Copy(tempno,1,4)+''')');
       Qin.EXECSQL;
       QAll.Next;
       inc(Ci);
  end; {while loop}
  Gauge1.Progress := 0;
  savenum.Caption := inttostr(Ci);
end;

procedure Tpic4013aForm.empyy1KeyPress(Sender: TObject; var Key: Char);
begin
   if key = chr(vk_return) then begin
      key := chr(0);
      empyy2.setfocus;
   end;
end;

end.
