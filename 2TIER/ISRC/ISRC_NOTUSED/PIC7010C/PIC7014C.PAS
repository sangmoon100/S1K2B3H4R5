unit Pic7014c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib;

  procedure Form_TextFile;

var
  s1 : TstringList;
  s2 : TstringList;
  outf : TextFile;

implementation
uses pic7011c;

procedure Form_TextFile;
var
  f   : file of pic7011c.inText;
  d   : pic7011c.inText;
  lrec,rec,i : integer;
  pagecnt  : integer;

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
    writeln(outf,'');                                         }
    for i := 0 to s2.count - 4 do writeln(outf,s2.strings[i]);
       addmacroblock(s1,s2,'tail');
    writeln(outf,s2.strings[s2.count-2]);
    writeln(outf,'');
  end;

begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;

   if FileExists(HomeDir+'\bin\ibin\pic7010c.Frm') = False then begin
      MessageBox(pic7011cForm.Handle,PChar(HomeDir+'\bin\ibin\pic7010c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(outf,HomeDir+'\list\pic7010c.out');
   rewrite(outf);
   AssignFile(f,HomeDir+'\list\pic7010c.tmp');
   reset(f);
   AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic7010c.frm');
   rec := 1; pagecnt := 1; lrec := 1;

   while not Eof(F) do begin
       read(F,d);
       if pagecnt = 1 then begin
          AddMacroBlock(s1,s2,'head');
          pageheader;
       end;
       if (d.gubun = 'P') and (not eof(f))then begin
          Text_Write;
          if d.gubun = 'P' then lrec := 1 else begin rec := 1; lrec := 1 end;
          AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic7010c.frm');
          PageHeader;
          continue;
       end;
       AddMacroBlock(s1,s2,'body');
       PrnRightSet(s2,'bdeptabbr',  d.bdeptabbr);
       PrnRightSet(s2,'deptabbr',   d.deptabbr);
       PrnRightSet(s2,'remark',     d.remark);
       if (lrec < 25)  and (not eof(f))then
         AddMacroBlock(s1,s2,'linebody');
       inc(rec); inc(pagecnt); inc(lrec);
   end;
   if eof(f) then begin
//      Text_Write;
        for i := 0 to s2.count - 3 do writeln(outf,s2.strings[i]);
        addmacroblock(s1,s2,'tail');
        writeln(outf,s2.strings[s2.count-2]);
        writeln(outf,'');
   end;
   system.close(outf);
   system.close(f);
end;

end.
