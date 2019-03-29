unit pid1154c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib,
  datelib;

  procedure Form_TextFile;
  procedure ExcelFile(const jeon : string);

var
  s1 : TstringList;
  s2 : TstringList;
  outf : TextFile;

implementation
uses pid1151c;

procedure Form_TextFile;
var
  f   : file of pid1151c.ingoText;
  D   : pid1151c.ingoText;
  procedure Text_Write;
  var
    i   : integer;
  begin
    AddMacroBlock(s1,s2,'tail');
    for i := 0 to s2.count - 1 do writeln(outf,s2.strings[i]);
    writeln(outf,'');
    writeln(outf,'');
  end;

begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;

   if FileExists(HomeDir+'\bin\ibin\pid1150c.Frm') = False then begin
      MessageBox(pid1151cForm.Handle,PChar(HomeDir+'\bin\ibin\pid1150c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(outf,HomeDir+'\list\pid1150c.out');
   rewrite(outf);
   AssignFile(f,HomeDir+'\list\pid1150c.tmp');
   reset(f);
   AddFormfile(s1,s2,HomeDir+'\bin\Ibin\pid1150c.frm');

   while not Eof(F) do begin
       read(F,D);
       if d.gubun = 'P' then begin
          Text_Write;
          AddFormfile(s1,s2,HomeDir+'\bin\Ibin\pid1150c.frm');
          continue;
       end;
       AddMacroBlock(s1,s2,'body');
       PrnRightSet(s2,'deptname1',passtring(d.deptname,' ',1));
       PrnRightSet(s2,'deptname2',passtring(d.deptname,' ',2));
       PrnRightSet(s2,'deptname3',passtring(d.deptname,' ',3));
       PrnRightSet(s2,'emp',      d.empno);
       PrnRightSet(s2,'korname',  d.korname);
       PrnRightSet(s2,'paycl',    d.paycl);
       PrnLeftSet(s2, 'gr',       d.paygr,2);
       PrnRightSet(s2,'empdate',  d.empdate);
       PrnRightSet(s2,'infrdate', copy(d.indate,1,10));
       PrnRightSet(s2,'intodate', copy(d.indate,11,10));
       PrnRightSet(s2,'e1payra',  d.e1payra);
       PrnRightSet(s2,'e1kor',    d.e1korname);
       PrnRightSet(s2,'e2payra',  d.e2payra);
       PrnRightSet(s2,'e2kor',    d.e2korname);
       PrnRightSet(s2,'eckor',    d.eckorname);
   end;
   Text_Write;
   system.close(outf);
   system.close(f);
end;

procedure ExcelFile(const jeon : string);
var
  i: Integer;
  app, WorkBooks :Variant;
  f   : file of pid1151c.ingoText;
  D   : pid1151c.ingoText;
begin
   TRY
      if FileExists(HomeDir+'\list\pid1150c.tmp') = False then System.Exit;

      AssignFile(F,HomeDir+'\list\pid1150c.tmp');
      ReSet(F);

      AssignFile(outf,jeon);
      ReWrite(outf);
      Writeln(outf, '피평가자'+#9+#9+#9+#9+#9+#9+#9+
                    '평가자'+#9+#9+#9+#9+'합계'+#9+
                    '기업관'+#9+#9+#9+
                    'SUPEX추구'+#9+#9+#9+
                    '일처리역량'+#9+#9+
                    '셀프리더십'+#9+#9+#9+'평가자의견'
                    );
      Writeln(outf, '피평가자소속'+#9+'피평가자직책'+#9+'피평가자사번'+#9+'피평가자성명'+#9+'피평가자BAND'+#9+'피평가자입사일자'+#9+'평가기간'+#9+
                    '평가자직책'+#9+'평가자사번'+#9+'평가자성명'+#9+'완료여부'+#9+'평가점수'+#9+
                    '조직의 발전 추구'+#9+'조직에 대한 관심과 애정'+#9+'전체를 위한 희생/헌신'+#9+
                    '일에 대한 주인의식'+#9+'높은 목표 설정'+#9+'도전을 즐기는 성향'+#9+
                    '일의 완결성'+#9+'꼼꼼하고 완벽한 일처리'+#9+
                    '상호신뢰와 존중'+#9+'Teamwork'+#9+'나눔과 상생 추구'+#9+'평가자의견'
                    );
      while not Eof(F) do
      begin
         Read(F,D);
         Writeln(outf, passtring(d.deptname,' ',1)+#9+'수습사원'+#9+d.empno+#9+d.korname+#9+d.paycl+#9+d.empdate+#9+copy(d.indate,1,10)+'~'+copy(d.indate,11,10)+#9+
                       d.e1payra +#9+d.e1empno +#9+d.e1korname+#9+d.econyn+#9+d.score_tot+#9+
                       d.ability1+#9+d.ability2+#9+d.ability3 +#9+
                       d.ability4+#9+d.ability5+#9+d.ability6 +#9+
                       d.manner1 +#9+d.manner2 +#9+
                       d.manner3 +#9+d.manner4 +#9+d.manner5  +#9+d.mark1);

      end;

     FINALLY
       closefile(F);
       closefile(outf);
     END;

end;

end.
