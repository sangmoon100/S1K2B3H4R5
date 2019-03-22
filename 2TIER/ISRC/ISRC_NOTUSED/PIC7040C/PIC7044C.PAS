unit Pic7044c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib;

  procedure Form_TextFile;

var
  s1 : TstringList;
  s2 : TstringList;
  outf : TextFile;

implementation
uses pic7041c;

procedure Form_TextFile;
var
  f   : file of pic7041c.inText;
  d   : pic7041c.inText;
  lrec,rec ,i: integer;
  pagecnt  : integer;
  sw : integer;
  procedure PageHeader;
  begin
   AddMacroBlock(s1,s2,'pageheader');
  end;

  procedure Text_Write;
  var
    i   : integer;
  begin
{    AddMacroBlock(s1,s2,'tail');
    for i := 0 to s2.count - 1 do writeln(outf,s2.strings[i]);
    writeln(outf,'');}
    for i := 0 to s2.count - 2 do writeln(outf,s2.strings[i]);
    addmacroblock(s1,s2,'tail');
    writeln(outf,s2.strings[s2.count-2]);
    writeln(outf,'');
  end;

begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;

   if FileExists(HomeDir+'\bin\ibin\pic7040c.Frm') = False then begin
      MessageBox(pic7041cForm.Handle,PChar(HomeDir+'\bin\ibin\pic7040c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(outf,HomeDir+'\list\pic7040c.out');
   rewrite(outf);
   AssignFile(f,HomeDir+'\list\pic7040c.tmp');
   reset(f);
   AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic7040c.frm');
   rec := 1; pagecnt := 1; lrec := 1;
   AddMacroBlock(s1,s2,'head');
   pageheader;

   while not Eof(F) do begin
       read(F,d);
       if (d.gubun = 'P') and (not eof(f))  then begin
          Text_Write;
          if d.gubun = 'P' then
             lrec := 1
           else begin rec := 1; lrec := 1 end;
          AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic7040c.frm');
          AddMacroBlock(s1,s2,'head');
          PageHeader;
          continue;
       end;
       AddMacroBlock(s1,s2,'body');
       PrnRightSet(s2,'empno',      d.empno);
       PrnRightSet(s2,'korname',    d.korname);
       PrnRightSet(s2,'deptname',   d.deptname);
       PrnRightSet(s2,'payra',      d.payra);
       prnRightSet(s2,'paycl',      d.paycl);
       PrnRightSet(s2,'bdeptname',  d.bdeptname);
       PrnRightSet(s2,'bpayra',     d.bpayra);
       PrnRightSet(s2,'jgubun',     d.jgubun);
       if (lrec < 21) and (not eof(f)) then begin
          AddMacroBlock(s1,s2,'linebody');
       end;
       inc(rec); inc(pagecnt); inc(lrec);
   end;
   if eof(f) then begin
//      Text_Write;
        addmacroblock(s1,s2,'tail');
        for i := 0 to s2.count - 1 do writeln(outf,s2.strings[i]);
        writeln(outf,'');
    end;
   system.close(outf);
   system.close(f);
end;

end.
