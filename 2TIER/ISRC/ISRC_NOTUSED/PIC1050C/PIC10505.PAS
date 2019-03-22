unit pic10505;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib;

  procedure Form_TextFile(Filenm : string);

var
  s1 : TstringList;
  s2 : TstringList;
  outf : TextFile;

implementation
uses pic10501;

procedure Form_TextFile(Filenm : string);
var
  f   : file of pic10501.TDatain;
  D   : pic10501.TDatain;
  PageCnt : integer;
  pageCheck : Boolean;

  procedure PageHeader;
  begin
   AddMacroBlock(s1,s2,'head');
   prnRightSet(s2,'pagecnt', inttostr(pagecnt));
   prnRightSet(s2,'annono',  d.annono);
   prnRightSet(s2,'dispatch',MainForm.L_Date.caption);
  end;

  procedure Text_Write(Flag : integer);
  var
    i   : integer;
  begin
    AddMacroBlock(s1,s2,'tail');
    for i := 0 to s2.count - 1 do writeln(outf,s2.strings[i]);
  end;

begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;
   pageCnt := 1;
   if FileExists(HomeDir+'\bin\ibin\pic1050c.Frm') = False then begin
      MessageBox(MainForm.Handle,pChar(HomeDir+'\bin\ibin\pic1050c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(f,HomeDir+'\list\pic1050c.tmp');  reset(f);
   read(f,D);
   AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic1050c.frm');
   PageHeader;
   system.close(f);

   AssignFile(outf,Filenm); rewrite(outf);
   AssignFile(f,HomeDir+'\list\pic1050c.tmp');    reset(f);
   while not Eof(f) do begin
       read(f,D);
       if d.Flag = 'F' then continue;
       if d.Flag = 'N' then continue;
       if PageCheck = True then PageHeader;
       PageCheck := False;
       if (d.Flag = 'E') then begin
          Text_Write(0);
          AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic1050c.frm');
          inc(pagecnt); PageCheck := True;
          continue;
       end;
       AddMacroBlock(s1,s2,'body');
       PrnRightSet(s2,'dispatch', MainForm.ME_dispatch.Text);
       PrnRightSet(s2,'korname',  d.korname);
       PrnRightSet(s2,'empno',    d.empno);
       PrnRightSet(s2,'ancodename',copy(d.ancode_name,1,10));
       if trim(d.antodate) = '' then begin
          PrnRightSet(s2,'anfrtodate',d.anfrdate);
       end else begin
          PrnRightSet(s2,'anfrtodate',d.anfrdate+'~'+d.antodate);
       end;
       PrnRightSet(s2,'bpaycl',   copy(d.bpaycl,1,6));
       PrnRightSet(s2,'bdeptname',copy(d.bdeptname,1,52));
       PrnRightSet(s2,'bpayra',   copy(d.bpayra_name,1,10));
       PrnRightSet(s2,'paycl',    copy(d.paycl,1,6));
       PrnRightSet(s2,'deptname', copy(d.deptname,1,52));
       PrnRightSet(s2,'payra',    copy(d.payra_name,1,10));
       PrnRightSet(s2,'mark',     copy(d.mark,1,52));
   end;
   AddMacroBlock(s1,s2,'end');
   writeln(outf,s2.strings[s2.Count-1]);
   system.close(outf);  system.close(f);
end;

end.
