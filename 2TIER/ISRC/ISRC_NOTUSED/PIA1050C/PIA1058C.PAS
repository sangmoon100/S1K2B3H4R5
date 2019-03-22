unit pia1058c;
interface
uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DBCtrls, prnlib, QRPrntr;

  {$I pia1050c.inc}
procedure Form_TextFile1(const PageCnt : integer);procedure Form1Text;
procedure Form2Text;
procedure Form3Text;
procedure Form4Text;
procedure Form5Text;

var
  OutF: TextFile;
  F1  : file of DataSource_insa;
  F2  : file of DataSource_insa2;
  F3  : file of DataSource_insa3;
  F4  : file of DataSource_insa4;
  F5  : file of DataSource_insa5;

  P   : DataSource_insa;
  P2  : DataSource_insa2;
  P3  : DataSource_insa3;
  P4  : DataSource_insa4;
  P5  : DataSource_insa5;
  s1  : TstringList;
  s2  : TstringList;
  rcnt : integer;


implementation
uses pia1051c;

procedure Form_TextFile1(const PageCnt : integer);begin
     AssignFile(outf,HomeDir+'\list\pia1050c.out'); ReWrite(outf);
     rcnt := 1;
     while rcnt <= pagecnt do
     begin
          Form1Text;
          Form2Text;
          Form3Text;
          Form4Text;
          Form5Text;
          inc(rcnt);
     end;
     System.Close(outf);
end;


procedure Form1Text;var
     i : integer;
begin
     s1 := TstringList.Create;
     s2 := TstringList.Create;

     // 첫번째 폼을 찍는다..     if FileExists(HomeDir+'\list\pia1050c.tmp') = True then
     begin
      //    showmessage(homedir);
          AssignFile(F1,HomeDir+'\list\pia1050c.tmp');
      //    showmessage(homedir);
          ReSet(F1);
      //    showmessage(homedir);
          AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1051c.frm');
      //    showmessage(homedir);

          Seek(F1,(rcnt-1)*2); Read(F1,p);          AddMacroBlock(s1,s2,'head');
          AddMacroBlock(s1,s2,'body');

          prnRightSet(s2,'korname'   ,p.korname);          prnRightSet(s2,'empno'     ,p.empno);
          prnRightSet(s2,'deptname'  ,p.deptname);
          prnRightSet(s2,'empdate',Format('%4s',[copy(p.empdate,1,4)])+'.'+
                                   Format('%2s',[copy(p.empdate,5,2)])+'.'+
                                   Format('%2s',[copy(p.empdate,7,2)]) );
          prnRightSet(s2,'jobline'   ,p.jobline);
          prnRightSet(s2,'retdate',Format('%4s',[copy(p.retdate,1,4)])+'.'+
                                   Format('%2s',[copy(p.retdate,5,2)])+'.'+
                                   Format('%2s',[copy(p.retdate,7,2)]) );
          prnRightSet(s2,'payclgr',p.paycl);
          prnRightSet(s2,'empgubun',p.empcode);
          prnRightSet(s2,'retgubun',p.retgubun);
          prnRightSet(s2,'cardate',Format('%4s',[copy(p.cardate,1,4)])+'.'+
                                   Format('%2s',[copy(p.cardate,5,2)])+'.'+
                                   Format('%2s',[copy(p.cardate,7,2)]) );
          prnRightSet(s2,'empterm',p.empterm);
          prnRightSet(s2,'retcause',p.retsayu);
          prnRightSet(s2,'juminid',p.juminid);
          prnRightSet(s2,'sex','('+p.sex+')');
          prnRightSet(s2,'holdname',p.holdname);
          prnRightSet(s2,'holdrel','('+p.holdrel+')');
          prnRightSet(s2,'religion',p.religion);
          prnLeftSet(s2,'height',p.height+ ' Cm',7);
          prnRightSet(s2,'habit',p.habit);
          prnLeftSet(s2,'weight',p.weight+ ' Kg',7);
          prnRightSet(s2,'ability',p.ability);
          prnLeftSet(s2,'blood',p.blood,6);

          //학력사항을 찍는다..
          for i := 1 to 7 do
          begin
               prnRightSet(s2,'schgr'+inttostr(i),p.schgr[i]);
               prnRightSet(s2,'schnm'+inttostr(i),p.schnm[i]);
               prnRightSet(s2,'schtoym'+inttostr(i),p.schtoym[i]);
               prnRightSet(s2,'majorcode'+inttostr(i),p.majorcode[i]);
               prnRightSet(s2,'sg'+inttostr(i),p.schkind[i]);
          end;
          prnRightSet(s2,'stopic1',p.stopic1);
          prnRightSet(s2,'stopic2',p.stopic2);
          prnRightSet(s2,'empschgr',p.empschgr);

          //비정규학력사항을 찍는다..
          for i := 1 to 4 do
          begin
               prnRightSet(s2,'eduorgnm'+inttostr(i),p.eduorgnm[i]);
               prnRightSet(s2,'edudate'+inttostr(i),p.edudate[i]);
               prnRightSet(s2,'educontent'+inttostr(i),p.educontent[i]);
          end;

          //자격사항을 찍는다..          for i := 1 to 6 do
          begin
               prnRightSet(s2,'lickind'+inttostr(i),p.lickind[i]);
               prnRightSet(s2,'licgr'+inttostr(i),p.licgr[i]);
               prnRightSet(s2,'licget'+inttostr(i),p.licgetdate[i]);
               prnRightSet(s2,'licno'+inttostr(i),p.licno[i]);
          end;

          //입사전경력을 찍는다..
          for i := 1 to 12 do
          begin
               prnRightSet(s2,'carymd'+inttostr(i),p.carymd[i]);
               prnRightSet(s2,'carplace'+inttostr(i),p.carplace[i]);
               prnRightSet(s2,'cardept'+inttostr(i),p.cardept[i]);
               prnRightSet(s2,'carjobnm'+inttostr(i),p.carjobnm[i]);
          end;
          prnRightSet(s2,'bcarym',copy(p.bcarym,1,2)+' 년 '+copy(p.bcarym,3,2)+' 월');

          //포상사항을 찍는다          for i := 1 to 4 do
          begin
               prnRightSet(s2,'rekindnm'+inttostr(i),p.rekindnm[i]);
               prnRightSet(s2,'redate'+inttostr(i),p.redate[i]);
               prnRightSet(s2,'recause'+inttostr(i),p.recause[i]);
               prnRightSet(s2,'reorgnm'+inttostr(i),p.reorgnm[i]);
          end;

          //징계사항을 찍는다          for i := 1 to 4 do
          begin
               prnRightSet(s2,'pukindnm'+inttostr(i),p.pukindnm[i]);
               prnRightSet(s2,'pudate'+inttostr(i),p.pudate[i]);
               prnRightSet(s2,'pucause'+inttostr(i),p.pucause[i]);
               prnRightSet(s2,'puorgnm'+inttostr(i),p.puorgnm[i]);
          end;

          //가족사항을 찍는다          for i := 1 to 11 do
          begin
               prnRightSet(s2,'fco'+inttostr(i),p.facode[i]);
               prnRightSet(s2,'fname'+inttostr(i),p.faname[i]);
               prnRightSet(s2,'f'+inttostr(i),p.fabirth[i]);
               prnRightSet(s2,'fschgr'+inttostr(i),p.faschgr[i]);
               prnRightSet(s2,'fplace'+inttostr(i),p.faplace[i]);
          end;
          prnRightSet(s2,'curaddr',p.curaddr);
          prnRightSet(s2,'telno',p.telno);
          prnRightSet(s2,'regaddr',p.regaddr);
          prnRightSet(s2,'bornarea',p.bornarea);
          prnRightSet(s2,'ag',p.armykind);
          prnRightSet(s2,'armyfi',p.armyfield);
          prnRightSet(s2,'apl',   p.armycl);
          prnRightSet(s2,'armydis',p.armydis);
          prnRightSet(s2,'armydate',p.armydate);
          prnRightSet(s2,'armyex',p.armyex);

          AddMacroBlock(s1,s2,'tail');          for i := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
          Writeln(outf,''); Writeln(outf,'');
          System.Close(F1);
     end; // if FileExists('c:\insa\pia1050c.tmp') = True then begin
end;


 // 두번째 폼을 찍는다..procedure Form2Text;
var
     i,j : integer;
begin
     if FileExists(HomeDir+'\list\pia1051c.tmp') = True then
     begin
          AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1052c.frm');
          AssignFile(F2,HomeDir+'\list\pia1051c.tmp');
          ReSet(F2);
          AddMacroBlock(s1,s2,'head');
          i := 1; Seek(F2,(rcnt-1)*62);

          while (i <= 62) do
          begin
               Read(F2,p2);
               if p2.gubun = 'L' then
               begin
                  AddMacroBlock(s1,s2,'tail'); inc(i);
                  continue;
               end;

               if p2.gubun = 'P' then
               begin
                  for j := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
                  Writeln(outf,'');  Writeln(outf,''); inc(i);
                  continue;
               end;

               AddMacroBlock(s1,s2,'body');
               prnRightSet(s2,'korname'   ,p2.korname);
               prnRightSet(s2,'empno'     ,p2.empno);
               prnRightSet(s2,'ancode'    ,p2.ancode);
               prnRightSet(s2,'andate'    ,p2.andate);
               prnRightSet(s2,'paycl'     ,p2.paycl);
               prnRightSet(s2,'g'         ,p2.paygr);
               prnRightSet(s2,'andata'    ,p2.andata);
               prnRightSet(s2,'payra'     ,p2.payra);
               prnRightSet(s2,'tjobduty'  ,p2.tjobduty);
               prnRightSet(s2,'annono'    ,p2.annono);
               inc(i);
          end;
          System.Close(F2);
     end; //if FileExists('c:\insa\pia1051c.tmp') = True then begin
end;


 // 세번째 폼을 찍는다..
procedure Form3Text;var
     i,j : integer;
begin
     if FileExists(HomeDir+'\list\pia1052c.tmp') = True then
     begin
          AssignFile(F3,HomeDir+'\list\pia1052c.tmp');   ReSet(F3);
          AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1053c.frm');
          AddMacroBlock(s1,s2,'head');
          i := 1;  Seek(F3,(rcnt-1)*62);
          while (i <= 62) do
          begin
               Read(F3,p3);

               if p3.gubun = 'L' then
               begin
                    AddMacroBlock(s1,s2,'tail');  inc(i);
                    continue;
               end;

               if p3.gubun = 'P' then
               begin
                    for j := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
                    Writeln(outf,''); Writeln(outf,'');  inc(i);
                    continue;
               end;

               AddMacroBlock(s1,s2,'body');
               prnRightSet(s2,'korname'   ,p3.korname);
               prnRightSet(s2,'empno'     ,p3.empno);
               prnRightSet(s2,'ancode'    ,p3.ancode);
               prnRightSet(s2,'andate'    ,p3.andate);
               prnRightSet(s2,'paycl'     ,p3.paycl);
               prnRightSet(s2,'g'         ,p3.paygr);
               prnRightSet(s2,'andata'    ,p3.andata);
               prnRightSet(s2,'annono'    ,p3.annono);
               prnRightSet(s2,'intodat'   ,p3.intodate);
               prnRightSet(s2,'pay2'      ,p3.paycl2);
               prnRightSet(s2,'gr'        ,p3.adjclass);
               prnLeftSet(s2,'adjscore'   ,p3.adjscore,6);
               prnLeftSet(s2,'trank'      ,p3.totrank,5);
               prnLeftSet(s2,'crank'      ,p3.payclrank,5);
               inc(i);
          end;
          System.Close(F3);
     end; //if FileExists('c:\insa\pia1052c.tmp') = False then begin
end;


 // 네번째 폼을 찍는다..
procedure Form4Text;var
     i : integer;
begin
     if FileExists(HomeDir+'\list\pia1053c.tmp') = True then
     begin
          AssignFile(F4,HomeDir+'\list\pia1053c.tmp');   ReSet(F4);
          AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1054c.frm');
          Seek(F4,(rcnt-1)*2); Read(F4,p4);
          AddMacroBlock(s1,s2,'head');
          AddMacroBlock(s1,s2,'body');
          prnRightSet(s2,'korname'   ,p4.korname);
          prnRightSet(s2,'empno'     ,p4.empno);

          //교육사항을 찍는다..          for i := 1 to 25 do
          begin
               prnRightSet(s2,'edutype'+inttostr(i),p4.edutype[i]);
               prnRightSet(s2,'edudate'+inttostr(i),p4.edudate[i]);
               prnRightSet(s2,'educourse'+inttostr(i),p4.educourse[i]);
               prnRightSet(s2,'edugubun'+inttostr(i),p4.edugubun[i]);
               prnRightSet(s2,'edutime'+inttostr(i),p4.edutime[i]);
               prnRightSet(s2,'eduscore'+inttostr(i),p4.eduscore[i]);
               prnRightSet(s2,'edubigo'+inttostr(i),p4.edubigo[i]);
          end;

          //외국어사항을 찍는다          for i := 1 to 10 do
          begin
               prnRightSet(s2,'lang'+inttostr(i),p4.langname[i]);
               prnRightSet(s2,'exam'+inttostr(i),p4.examname[i]);
               prnRightSet(s2,'examd'+inttostr(i),p4.examdate[i]);
               prnRightSet(s2,'score'+inttostr(i),p4.score[i]);
               prnRightSet(s2,'examplace'+inttostr(i),p4.examplace[i]);
          end;

          //포상사항을 찍는다          for i := 1 to 15 do
          begin
               prnRightSet(s2,'rekindnm'+inttostr(i),p4.rekindnm[i]);
               prnRightSet(s2,'redat'+inttostr(i),p4.redate[i]);
               prnRightSet(s2,'recause'+inttostr(i),p4.recause[i]);
               prnRightSet(s2,'reorgnm'+inttostr(i),p4.reorgnm[i]);
          end;

          //징계사항을 찍는다          for i := 1 to 15 do
          begin
               prnRightSet(s2,'pukindnm'+inttostr(i),p4.pukindnm[i]);
               prnRightSet(s2,'pudat'+inttostr(i),p4.pudate[i]);
               prnRightSet(s2,'pucause'+inttostr(i),p4.pucause[i]);
               prnRightSet(s2,'puorgnm'+inttostr(i),p4.pucontent[i]);
          end;

          AddMacroBlock(s1,s2,'tail');

          for i := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
          Writeln(outf,''); Writeln(outf,'');
          System.Close(F4);
     end; // if FileExists('c:\insa\pia1053c.tmp') = True then begin
end;


  // 다섯번째 폼을 찍는다..procedure Form5Text;
var
     i,j : integer;
begin
     if FileExists(HomeDir+'\list\pia1054c.tmp') = True then
     begin
          AssignFile(F5,HomeDir+'\list\pia1054c.tmp');   ReSet(F5);
          AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1055c.frm');
          AddMacroBlock(s1,s2,'head');
          i := 1; Seek(F5,(rcnt-1)*62);

          while (i <= 62) do
          begin
               Read(F5,p5);

               if p5.gubun = 'L' then
               begin
                  AddMacroBlock(s1,s2,'tail');  inc(i);
                  continue;
               end;

               if p5.gubun = 'P' then
               begin
                  for j := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
                  Writeln(outf,'');  Writeln(outf,'');  inc(i);
                  continue;
               end;
               
               AddMacroBlock(s1,s2,'body');
               prnRightSet(s2,'korname'      ,p5.korname);
               prnRightSet(s2,'empno'        ,p5.empno);
               prnRightSet(s2,'JOBFIELDNAME' ,p5.JOBFIELDNAME);
               prnRightSet(s2,'DUTYKINDNAME' ,p5.DUTYKINDNAME);
               prnRightSet(s2,'DUTYNAME'     ,p5.DUTYNAME);
               prnRightSet(s2,'PAYCLNAME'    ,p5.PAYCLNAME);
               prnRightSet(s2,'DUTYDATE'     ,p5.DUTYDATE);
               prnRightSet(s2,'YY'           ,p5.YY);
               prnRightSet(s2,'MM'           ,p5.MM);
               prnRightSet(s2,'DUTYTEXT'     ,p5.DUTYTEXT);
               prnRightSet(s2,'DUTY'         ,p5.DUTY);
               inc(i);
          end;
          System.Close(F5);
     end; //if FileExists('c:\insa\pia1054c.tmp') = False then begin
end;

end.
