unit pie20504;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib;

procedure Form_TextFile;

var
  s1   : TstringList;
  s2   : TstringList;
  outf : TextFile;
  fcom : TextFile;
  i    : integer;
  buff,titstr : string;
implementation
uses pie20501;

procedure Form_TextFile;
var
  f   : file of pie20501.TDatain;
  d   : pie20501.TDatain;
  lrec,rec : integer;
  pagecnt  : integer;
  procedure PageHeader;
  begin
     AddMacroBlock(s1,s2,'pageheader');
     titstr :='[작업년월] : '+copy(MainForm.ME_WorkDate.Text,1,4)+'년'+
                              copy(MainForm.ME_WorkDate.Text,5,2)+'월';
     prnRightSet(s2,'mtit',titstr);
     titstr := '';
     titstr := MainForm.L_Date.Caption;
     prnRightSet(s2,'mdate',titstr);
     prnRightSet(s2,'mpage',inttostr(rec));
  end;
  procedure Text_Write;
  var
    i   : integer;
  begin
    addmacroblock(s1,s2,'tail');
    for i := 0 to s2.count - 4 do writeln(outf,s2.strings[i]);
    writeln(outf,s2.strings[s2.count-2]);
    writeln(outf,'');
  end;
begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;

   if FileExists(HomeDir+'\bin\ibin\pie2050c.Frm') = False then begin
      MessageBox(MainForm.Handle,PChar(HomeDir+'\bin\ibin\pie2050c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(outf,HomeDir+'\list\pie2050c.out');
   rewrite(outf);
   AssignFile(f,HomeDir+'\list\pie2050c.tmp');
   reset(f);
   AssignFile(Fcom,HomeDir+'\list\pie2050c.dat');
   reset(Fcom);

   AddFormfile(s1,s2,HomeDir+'\bin\ibin\pie2050c.frm');
   rec := 1; pagecnt := 1; lrec := 1;
   AddMacroBlock(s1,s2,'head');
   pageheader;
   while not Eof(F) do begin
       read(F,d);
       if (d.flag = 'P') and   (not Eof(f)) then begin
          Text_Write;
            inc(pagecnt);   lrec := 1;
          if d.flag = 'P' then lrec := 1 else begin rec := 1; lrec := 1 end;
             AddFormfile(s1,s2,HomeDir+'\bin\ibin\pie2050c.frm');
//             AddMacroBlock(s1,s2,'head');
             inc(rec);
             PageHeader;
             continue;
       end;
       if d.flag  = 'C'  then begin
          if trim(d.ttotal) = '()'  then   d.ttotal := '';
          if trim(d.ptotal) = '()'  then   d.ptotal := '';
          if trim(d.pdirsum) = '()' then   d.pdirsum := '';
          if trim(d.ppos1) = '()'   then   d.ppos1 := '';
          if trim(d.ppos2) = '()'   then   d.ppos2 := '';
          if trim(d.ppos3) = '()'   then   d.ppos3 := '';
          if trim(d.ppos4) = '()'   then   d.ppos4 := '';
          if trim(d.ppos5) = '()'   then   d.ppos5 := '';
          if trim(d.ppos6) = '()'   then   d.ppos6 := '';
          if trim(d.ppos7) = '()'   then   d.ppos7 := '';
          if trim(d.pspe)  = '()'   then   d.pspe  := '';
          if trim(d.pemp)  = '()'   then   d.pemp  := '';
          if trim(d.pextrsum) = '()' then d.pextrsum := '';
          if trim(d.psum) = '()'     then d.psum   := '';
          if trim(d.ptempsum) = '()' then d.ptempsum := '';

          AddMacroBlock(s1,s2,'body');
          PrnRightSet(s2,'deptname', d.deptname);
          PrnLeftSet(s2,'a1', d.ttotal,6);
          PrnLeftSet(s2,'a2', d.ptotal,6);
          PrnLeftSet(s2,'a3', d.ptempsum,6);
          PrnLeftSet(s2,'a4', d.pdirsum,4);
          PrnLeftSet(s2,'a5', d.ppos1,4);
          PrnLeftSet(s2,'a6', d.ppos2,4);
          PrnLeftSet(s2,'a7', d.ppos3,4);
          PrnLeftSet(s2,'a8', d.ppos4,4);
          PrnLeftSet(s2,'a9', d.ppos5,4);
          PrnLeftSet(s2,'a10',d.ppos6,4);
          PrnLeftSet(s2,'a11',d.ppos7,4);
          PrnLeftSet(s2,'a12',d.pspe,4);
          PrnLeftSet(s2,'a13',d.pemp,6);
          PrnLeftSet(s2,'a14',d.pextrsum,6);
          PrnLeftSet(s2,'a15',d.psum,    6);
          inc(pagecnt);
          inc(lrec);
      end  else
          if (d.flag = 'S') and (not eof(f))  then  begin
              AddMacroBlock(s1,s2,'linebody');
              inc(lrec);
          end;
   end;
   if eof(f) then  begin
      for i := 0 to s2.count - 1 do writeln(outf,s2.strings[i]);
      addmacroblock(s1,s2,'tail');
      writeln(outf,s2.strings[s2.count-2]);
      writeln(outf,'');
   end;

   while not Eof(Fcom) do begin
       readLn(Fcom,buff);
       if trim(buff) <> 'PAGESKIP'  then  begin
           WriteLn(outf,buff);
       end;
    end;
   system.close(outf);
   system.close(f);
   system.close(Fcom);
 end;
end.
