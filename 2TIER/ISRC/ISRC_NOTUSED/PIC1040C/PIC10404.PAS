unit pic10404;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib;

  procedure Form_TextFile(Filenm : string);

var
  s1 : TstringList;
  s2 : TstringList;
  outf : TextFile;

implementation
uses pic10401;

procedure Form_TextFile(Filenm : string);
var
  f   : file of pic10401.TDatain;
  D   : pic10401.TDatain;
  PageCnt : integer;
  pageCheck : Boolean;
  temp : string;

  procedure PageHeader;
  begin
   AddMacroBlock(s1,s2,'head');
   prnRightSet(s2,'annono',  d.annono);
  end;

    procedure Text_Write(Flag : integer);
  var
    i   : integer;
  begin
    for i := 0 to s2.count - 2 do writeln(outf,s2.strings[i]);
    AddMacroBlock(s1,s2,'tail');
    writeln(outf,s2.strings[s2.count-1]);
  end;

begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;
   pageCnt := 1;
   if FileExists(HomeDir+'\bin\ibin\pic1040c.Frm') = False then begin
      MessageBox(MainForm.Handle,pChar(HomeDir+'\bin\ibin\pic1040c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(f,HomeDir+'\list\pic1040c.tmp');  reset(f);
   read(f,D);
   AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic1040c.frm');
   PageHeader;
   AddMacroBlock(s1,s2,'body1');
   prnRightSet(s2,'pagecnt', inttostr(pagecnt));
   system.close(f);

   AssignFile(outf,Filenm); rewrite(outf);
   AssignFile(f,HomeDir+'\list\pic1040c.tmp');    reset(f);
   while not Eof(f) do begin
       read(f,D);
       if d.Flag = 'F' then begin
          continue;
       end;
       if d.Flag = 'N' then continue;
       if PageCheck = True then begin
          AddMacroBlock(s1,s2,'body1');
          prnRightSet(s2,'pagecnt', inttostr(pagecnt));
       end;
       PageCheck := False;
       if (d.Flag = 'E') then begin    // tail
          Text_Write(0);
          AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic1040c.frm');
          inc(pagecnt); PageCheck := True;
          continue;
       end;
       AddMacroBlock(s1,s2,'body2');
       PrnRightSet(s2,'korname',  d.korname);
       PrnRightSet(s2,'empno',    d.empno);
       if trim(d.empno) = '' then begin
          PrnRightSet(s2,'b',  '');
          PrnRightSet(s2,'f',  '');
       end else begin
          PrnRightSet(s2,'b',  '전');
          PrnRightSet(s2,'f',  '후');
       end;
       PrnRightSet(s2,'ancode',copy(d.ancode_name,1,10));
       PrnRightSet(s2,'anfrdate',d.anfrdate);
       PrnRightSet(s2,'antodate',d.antodate);
       PrnRightSet(s2,'bc',       copy(d.bpaycl,1,6));
       PrnRightSet(s2,'bpayra',   copy(d.bpayra_name,1,10));
       PrnleftSet(s2,'bg',   d.bpaygr,4);
       PrnRightSet(s2,'bdeptname', copy(d.bdeptname,1,50));

       if d.paycl = d.bpaycl then
           PrnRightSet(s2,'cl','')
       else
           PrnRightSet(s2,'cl', copy(d.paycl,1,6));
       if d.paygr = d.bpaygr then
           PrnRightSet(s2,'gr',   '')
       else
           PrnLeftSet(s2,'gr',   d.paygr,4);
       if d.payra_name = d.bpayra_name then
           PrnrightSet(s2,'payra','')
       else
           PrnRightSet(s2,'payra',    copy(d.payra_name,1,10));
      if d.deptname = d.bdeptname then
           PrnRightSet(s2,'deptname', '')
      else
          PrnRightSet(s2,'deptname', copy(d.deptname,1,50));
      PrnRightSet(s2,'mark',     copy(d.mark,1,52));
      AddMacroBlock(s1,s2,'line');
   end;
   AddMacroBlock(s1,s2,'end');
   writeln(outf,s2.strings[s2.Count-1]);
   system.close(outf);  system.close(f);


end;


end.
