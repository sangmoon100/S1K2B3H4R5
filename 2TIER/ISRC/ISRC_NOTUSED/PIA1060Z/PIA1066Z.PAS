unit pia1066Z;

interface
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DBCtrls,prnlib;

  {$I pia1061z.inc}

procedure Form_TextFile(const jeon : string);

var
  F   : file of DataSource_insa;
  OutF: TextFile;
  P   : DataSource_insa;
  s1  : TstringList;
  s2  : TstringList;

implementation
uses pia1061z;

{-------------------------------------------------------------------------------
 버전     수정일      수정자   관련근거       수정내용
 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
                                            (text 화일변경 )
 -------------------------------------------------------------------------------}
procedure Form_TextFile(const jeon : string);
var
  i : integer;
begin
 s1 := TstringList.Create;
 s2 := TstringList.Create;

 if FileExists(HomeDir+'\list\pia1060c.tmp') = False then System.Exit;

 AssignFile(F,HomeDir+'\list\pia1060c.tmp');
 ReSet(F);

 AssignFile(outf,jeon);
 ReWrite(outf);

 AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1060c.frm');
 while not Eof(F) do begin
   Read(F,p);
   if p.gubun = 'P' then begin
      for i := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
      Writeln(outf,'');
      Writeln(outf,'');
      AddFormFile(s1,s2,HomeDir+'\bin\ibin\pia1060c.frm');
      continue;
   end;

   AddMacroBlock(s1,s2,'head');
   AddMacroBlock(s1,s2,'body');

   prnRightSet(s2,'korname'   ,p.korname);
   prnRightSet(s2,'empno'     ,p.empno);
   prnRightSet(s2,'payra'     ,p.payranm);
   prnRightSet(s2,'deptname'  ,p.deptname);
   prnRightSet(s2,'jikdeptname'  ,p.jikdeptname);   
   prnRightSet(s2,'paycldate','['+Format('%4s',[copy(p.paycldate,1,4)])+'.'+
                                  Format('%2s',[copy(p.paycldate,5,2)])+'.'+
                                  Format('%2s',[copy(p.paycldate,7,2)])+']');
   prnRightSet(s2,'paygr1',p.paygr1);

   prnRightSet(s2,'empdate','(최초 : '+Format('%2s',[copy(p.empdate,3,2)])+'.'+
                          Format('%2s',[copy(p.empdate,5,2)])+'.'+
                          Format('%2s',[copy(p.empdate,7,2)])+')');
{
   prnRightSet(s2,'empdate',Format('%2s',[copy(p.empdate,3,2)])+'.'+
                            Format('%2s',[copy(p.empdate,5,2)])+'.'+
                            Format('%2s',[copy(p.empdate,7,2)]));
 }
   prnRightSet(s2,'orgempdate',Format('%2s',[copy(p.orgempdate,3,2)])+'.'+
                            Format('%2s',[copy(p.orgempdate,5,2)])+'.'+
                            Format('%2s',[copy(p.orgempdate,7,2)]));

   prnRightSet(s2,'paygr2',Format('%8s',[p.paygr2]));
   prnRightSet(s2,'jobline',p.jobline);
   prnRightSet(s2,'jobplace',p.jobplace);
   prnRightSet(s2,'licalkind',p.licalkind);
   prnRightSet(s2,'trlimfrto',p.trlimfrto);
//   prnRightSet(s2,'empline',p.empjobline);
   prnRightSet(s2,'empplac',p.empjobplace);
   prnRightSet(s2,'empcode',p.empcode);
   prnRightSet(s2,'cardate',p.cardate);
   prnRightSet(s2,'juminid',p.juminid);
   prnRightSet(s2,'korag'  ,p.korage);
   prnRightSet(s2,'armyfrto',p.armyfrto);
   prnRightSet(s2,'maryn',p.marrigeyn);
   prnRightSet(s2,'ability',copy(p.ability,1,10));
   prnRightSet(s2,'armyki',p.armykind);
   prnRightSet(s2,'curaddr',p.curaddr);
   prnRightSet(s2,'regaddr',p.regaddr);
   prnRightSet(s2,'telno',p.telno);
   prnRightSet(s2,'bornarea',p.bornarea);
   {조직전보일}
   prnRightSet(s2,'realtrdate',p.realtrdate);
   prnRightSet(s2,'offtrdate',p.offtrdate);

   {급여사항출력.........................}
   prnLeftSet(s2,'junpay',p.junpay_amt,18);
   prnLeftSet(s2,'gita',p.jungita_amt,18);
   prnLeftSet(s2,'danpay',p.danpay_amt,18);

   prnRightSet(s2,'pstate',p.pstate);
   prnRightSet(s2,'kigan',p.psdate);
   prnRightSet(s2,'antotdate',copy(p.caramt,1,2)+' 년 '+copy(p.caramt,3,2)+' 월');
   prnRightSet(s2,'anexdate','                    ]');
    {학력사항..............................}
   prnRightSet(s2,'schgr1',p.schgr[1]);
   prnRightSet(s2,'schgr2',p.schgr[2]);
   prnRightSet(s2,'schgr3',p.schgr[3]);
   prnRightSet(s2,'schgr4',p.schgr[4]);

   prnRightSet(s2,'schnm1',p.schnm[1]);
   prnRightSet(s2,'schnm2',p.schnm[2]);
   prnRightSet(s2,'schnm3',p.schnm[3]);
   prnRightSet(s2,'schnm4',p.schnm[4]);

   prnRightSet(s2,'sym1',p.schfrtoym[1]);
   prnRightSet(s2,'sym2',p.schfrtoym[2]);
   prnRightSet(s2,'sym3',p.schfrtoym[3]);
   prnRightSet(s2,'sym4',p.schfrtoym[4]);

   prnRightSet(s2,'majorcode1',p.majorcode[1]);
   prnRightSet(s2,'majorcode2',p.majorcode[2]);
   prnRightSet(s2,'majorcode3',p.majorcode[3]);
   prnRightSet(s2,'majorcode4',p.majorcode[4]);

    {자격증사항을 출력한다.......................}
   prnRightSet(s2,'lickind1',p.licekind[1]);
   prnRightSet(s2,'lickind2',p.licekind[2]);
   prnRightSet(s2,'licg1',p.licgr[1]);
   prnRightSet(s2,'licg2',p.licgr[2]);
   prnRightSet(s2,'licdate1',p.licgetdate[1]);
   prnRightSet(s2,'licdate2',p.licgetdate[2]);
  {외국어사항..................................}
   prnRightSet(s2,'langna1',p.langname[1]);
   prnRightSet(s2,'langna2',p.langname[2]);
   prnRightSet(s2,'exna1',p.examname[1]);
   prnRightSet(s2,'exna2',p.examname[2]);
   prnRightSet(s2,'ex1',p.examscore[1]);
   prnRightSet(s2,'ex2',p.examscore[2]);
   prnRightSet(s2,'exdate1',p.examdate[1]);
   prnRightSet(s2,'exdate2',p.examdate[2]);

  {교육사항..................................}
   prnRightSet(s2,'edufrtodate1',p.edufrtodate[1]);
   prnRightSet(s2,'educourse1',p.educourse[1]);
   prnRightSet(s2,'edutype1',p.edutype[1]);
   prnRightSet(s2,'time1',p.edutime[1]);
   prnRightSet(s2,'scor1',p.eduscore[1]);
   prnRightSet(s2,'edugubun1',p.edugubun[1]);

   prnRightSet(s2,'edufrtodate2',p.edufrtodate[2]);
   prnRightSet(s2,'educourse2',p.educourse[2]);
   prnRightSet(s2,'edutype2',p.edutype[2]);
   prnRightSet(s2,'time2',p.edutime[2]);
   prnRightSet(s2,'scor2',p.eduscore[2]);
   prnRightSet(s2,'edugubun2',p.edugubun[2]);

   prnRightSet(s2,'edufrtodate3',p.edufrtodate[3]);
   prnRightSet(s2,'educourse3',p.educourse[3]);
   prnRightSet(s2,'edutype3',p.edutype[3]);
   prnRightSet(s2,'time3',p.edutime[3]);
   prnRightSet(s2,'scor3',p.eduscore[3]);
   prnRightSet(s2,'edugubun3',p.edugubun[3]);

   prnRightSet(s2,'edufrtodate4',p.edufrtodate[4]);
   prnRightSet(s2,'educourse4',p.educourse[4]);
   prnRightSet(s2,'edutype4',p.edutype[4]);
   prnRightSet(s2,'time4',p.edutime[4]);
   prnRightSet(s2,'scor4',p.eduscore[4]);
   prnRightSet(s2,'edugubun4',p.edugubun[4]);

   prnRightSet(s2,'edufrtodate5',p.edufrtodate[5]);
   prnRightSet(s2,'educourse5',p.educourse[5]);
   prnRightSet(s2,'edutype5',p.edutype[5]);
   prnRightSet(s2,'time5',p.edutime[5]);
   prnRightSet(s2,'scor5',p.eduscore[5]);
   prnRightSet(s2,'edugubun5',p.edugubun[5]);

    {가족사항..............................}
   prnRightSet(s2,'faco1',p.facode[1]);
   prnRightSet(s2,'faco2',p.facode[2]);
   prnRightSet(s2,'faco3',p.facode[3]);
   prnRightSet(s2,'faco4',p.facode[4]);
   prnRightSet(s2,'faco5',p.facode[5]);
   prnRightSet(s2,'faco6',p.facode[6]);

   prnRightSet(s2,'faname1',p.faname[1]);
   prnRightSet(s2,'faname2',p.faname[2]);
   prnRightSet(s2,'faname3',p.faname[3]);
   prnRightSet(s2,'faname4',p.faname[4]);
   prnRightSet(s2,'faname5',p.faname[5]);
   prnRightSet(s2,'faname6',p.faname[6]);

   prnRightSet(s2,'fabi1',p.fabirth[1]);
   prnRightSet(s2,'fabi2',p.fabirth[2]);
   prnRightSet(s2,'fabi3',p.fabirth[3]);
   prnRightSet(s2,'fabi4',p.fabirth[4]);
   prnRightSet(s2,'fabi5',p.fabirth[5]);
   prnRightSet(s2,'fabi6',p.fabirth[6]);

   prnRightSet(s2,'fasch1',p.faschgr[1]);
   prnRightSet(s2,'fasch2',p.faschgr[2]);
   prnRightSet(s2,'fasch3',p.faschgr[3]);
   prnRightSet(s2,'fasch4',p.faschgr[4]);
   prnRightSet(s2,'fasch5',p.faschgr[5]);
   prnRightSet(s2,'fasch6',p.faschgr[6]);

   prnRightSet(s2,'faplace1',p.faplace[1]);
   prnRightSet(s2,'faplace2',p.faplace[2]);
   prnRightSet(s2,'faplace3',p.faplace[3]);
   prnRightSet(s2,'faplace4',p.faplace[4]);
   prnRightSet(s2,'faplace5',p.faplace[5]);
   prnRightSet(s2,'faplace6',p.faplace[6]);
    {교육사항..............................}
   prnRightSet(s2,'educourse1',p.educourse[1]);
   prnRightSet(s2,'educourse2',p.educourse[2]);
   prnRightSet(s2,'educourse3',p.educourse[3]);
   prnRightSet(s2,'educourse4',p.educourse[4]);
   prnRightSet(s2,'educourse5',p.educourse[5]);
   prnRightSet(s2,'edufrtodate1',p.edufrtodate[1]);
   prnRightSet(s2,'edufrtodate2',p.edufrtodate[2]);
   prnRightSet(s2,'edufrtodate3',p.edufrtodate[3]);
   prnRightSet(s2,'edufrtodate4',p.edufrtodate[4]);
   prnRightSet(s2,'edufrtodate5',p.edufrtodate[5]);
   prnRightSet(s2,'edutype1',p.edutype[1]);
   prnRightSet(s2,'edutype2',p.edutype[2]);
   prnRightSet(s2,'edutype3',p.edutype[3]);
   prnRightSet(s2,'edutype4',p.edutype[4]);
   prnRightSet(s2,'edutype5',p.edutype[5]);
   prnRightSet(s2,'edugubun1',p.edugubun[1]);
   prnRightSet(s2,'edugubun2',p.edugubun[2]);
   prnRightSet(s2,'edugubun3',p.edugubun[3]);
   prnRightSet(s2,'edugubun4',p.edugubun[4]);
   prnRightSet(s2,'edugubun5',p.edugubun[5]);
   prnRightSet(s2,'edutime1',p.edutime[1]);
   prnRightSet(s2,'edutime2',p.edutime[2]);
   prnRightSet(s2,'edutime3',p.edutime[3]);
   prnRightSet(s2,'edutime4',p.edutime[4]);
   prnRightSet(s2,'edutime5',p.edutime[5]);
   prnRightSet(s2,'eduscore1',p.eduscore[1]);
   prnRightSet(s2,'eduscore2',p.eduscore[2]);
   prnRightSet(s2,'eduscore3',p.eduscore[3]);
   prnRightSet(s2,'eduscore4',p.eduscore[4]);
   prnRightSet(s2,'eduscore5',p.eduscore[5]);


    {입사전경력..............................}
   prnRightSet(s2,'carplace1',p.carplace[1]);
   prnRightSet(s2,'carplace2',p.carplace[2]);
   prnRightSet(s2,'carplace3',p.carplace[3]);
   prnRightSet(s2,'carplace4',p.carplace[4]);

   prnRightSet(s2,'cardate1',p.carymd[1]);
   prnRightSet(s2,'cardate2',p.carymd[2]);
   prnRightSet(s2,'cardate3',p.carymd[3]);
   prnRightSet(s2,'cardate4',p.carymd[4]);

   prnRightSet(s2,'cardept1',p.cardept[1]);
   prnRightSet(s2,'cardept2',p.cardept[2]);
   prnRightSet(s2,'cardept3',p.cardept[3]);
   prnRightSet(s2,'cardept4',p.cardept[4]);

//copy(p.ability,1,10)
   prnRightSet(s2,'carjob1',p.carjobnm[1]);
   prnRightSet(s2,'carjob2',p.carjobnm[2]);
   prnRightSet(s2,'carjob3',p.carjobnm[3]);
   prnRightSet(s2,'carjob4',p.carjobnm[4]);

   prnRightSet(s2,'totcardate',p.bcaryy+' 년 '+p.bcarmm+' 월');
   {고과사항..............................}
   prnRightSet(s2,'iy1',p.intodate[1]);
   prnRightSet(s2,'iy2',p.intodate[2]);
   prnRightSet(s2,'iy3',p.intodate[3]);
   prnRightSet(s2,'iy4',p.intodate[4]);
   prnRightSet(s2,'iy5',p.intodate[5]);
   prnRightSet(s2,'iy6',p.intodate[6]);

   prnRightSet(s2,'ipay1',p.ipaycl[1]);
   prnRightSet(s2,'ipay2',p.ipaycl[2]);
   prnRightSet(s2,'ipay3',p.ipaycl[3]);
   prnRightSet(s2,'ipay4',p.ipaycl[4]);
   prnRightSet(s2,'ipay5',p.ipaycl[5]);
   prnRightSet(s2,'ipay6',p.ipaycl[6]);

   prnRightSet(s2,'ie1scr1',p.ie1scr[1]);
   prnRightSet(s2,'ie1scr2',p.ie1scr[2]);
   prnRightSet(s2,'ie1scr3',p.ie1scr[3]);
   prnRightSet(s2,'ie1scr4',p.ie1scr[4]);
   prnRightSet(s2,'ie1scr5',p.ie1scr[5]);
   prnRightSet(s2,'ie1scr6',p.ie1scr[6]);

   prnRightSet(s2,'ie2scr1',p.ie2scr[1]);
   prnRightSet(s2,'ie2scr2',p.ie2scr[2]);
   prnRightSet(s2,'ie2scr3',p.ie2scr[3]);
   prnRightSet(s2,'ie2scr4',p.ie2scr[4]);
   prnRightSet(s2,'ie2scr5',p.ie2scr[5]);
   prnRightSet(s2,'ie2scr6',p.ie2scr[6]);

   prnRightSet(s2,'adjcla1',p.adjclass[1]);
   prnRightSet(s2,'adjcla2',p.adjclass[2]);
   prnRightSet(s2,'adjcla3',p.adjclass[3]);
   prnRightSet(s2,'adjcla4',p.adjclass[4]);
   prnRightSet(s2,'adjcla5',p.adjclass[5]);
   prnRightSet(s2,'adjcla6',p.adjclass[6]);
   {상향평가사항을 출력한다.....................}
   prnRightSet(s2,'ay1',p.aptodate[1]);
   prnRightSet(s2,'ay2',p.aptodate[2]);
   prnRightSet(s2,'ay3',p.aptodate[3]);

   prnRightSet(s2,'apay1',p.apaycl[1]);
   prnRightSet(s2,'apay2',p.apaycl[2]);
   prnRightSet(s2,'apay3',p.apaycl[3]);

   prnRightSet(s2,'aclass1',p.aclass[1]);
   prnRightSet(s2,'aclass2',p.aclass[2]);
   prnRightSet(s2,'aclass3',p.aclass[3]);

   prnRightSet(s2,'ascore1',p.ascore[1]);
   prnRightSet(s2,'ascore2',p.ascore[2]);
   prnRightSet(s2,'ascore3',p.ascore[3]);

    {포상사항을 출력한다.......................}
   prnRightSet(s2,'rekindnm1',p.rekindnm[1]);
   prnRightSet(s2,'rekindnm2',p.rekindnm[2]);
   prnRightSet(s2,'reorgnm1',p.reorgnm[1]);
   prnRightSet(s2,'reorgnm2',p.reorgnm[2]);
   prnRightSet(s2,'redate1',p.redate[1]);
   prnRightSet(s2,'redate2',p.redate[2]);
    {징계사항을 출력한다.......................}
   prnRightSet(s2,'pukindnm1',p.pukindnm[1]);
   prnRightSet(s2,'pukindnm2',p.pukindnm[2]);
   prnRightSet(s2,'pucause1',p.pucause[1]);
   prnRightSet(s2,'pucause2',p.pucause[2]);
   prnRightSet(s2,'pudate1',p.pudate[1]);
   prnRightSet(s2,'pudate2',p.pudate[2]);
    {발령사항을 출력한다.......................}
   prnRightSet(s2,'ancode1',p.ancode[1]);
   prnRightSet(s2,'ancode2',p.ancode[2]);
   prnRightSet(s2,'ancode3',p.ancode[3]);
   prnRightSet(s2,'ancode4',p.ancode[4]);
   prnRightSet(s2,'ancode5',p.ancode[5]);
   prnRightSet(s2,'ancode6',p.ancode[6]);
   prnRightSet(s2,'ancode7',p.ancode[7]);
   prnRightSet(s2,'ancode8',p.ancode[8]);
   prnRightSet(s2,'ancode9',p.ancode[9]);
   prnRightSet(s2,'ancode10',p.ancode[10]);
   prnRightSet(s2,'ancode11',p.ancode[11]);
   prnRightSet(s2,'ancode12',p.ancode[12]);
   prnRightSet(s2,'ancode13',p.ancode[13]);
   prnRightSet(s2,'ancode14',p.ancode[14]);
   prnRightSet(s2,'ancode15',p.ancode[15]);
   prnRightSet(s2,'ancode16',p.ancode[16]);
   prnRightSet(s2,'ancode17',p.ancode[17]);
   prnRightSet(s2,'ancode18',p.ancode[18]);
   prnRightSet(s2,'ancode19',p.ancode[19]);
   prnRightSet(s2,'ancode20',p.ancode[20]);

   prnRightSet(s2,'andate1',p.andate[1]);
   prnRightSet(s2,'andate2',p.andate[2]);
   prnRightSet(s2,'andate3',p.andate[3]);
   prnRightSet(s2,'andate4',p.andate[4]);
   prnRightSet(s2,'andate5',p.andate[5]);
   prnRightSet(s2,'andate6',p.andate[6]);
   prnRightSet(s2,'andate7',p.andate[7]);
   prnRightSet(s2,'andate8',p.andate[8]);
   prnRightSet(s2,'andate9',p.andate[9]);
   prnRightSet(s2,'andate10',p.andate[10]);
   prnRightSet(s2,'andate11',p.andate[11]);
   prnRightSet(s2,'andate12',p.andate[12]);
   prnRightSet(s2,'andate13',p.andate[13]);
   prnRightSet(s2,'andate14',p.andate[14]);
   prnRightSet(s2,'andate15',p.andate[15]);
   prnRightSet(s2,'andate16',p.andate[16]);
   prnRightSet(s2,'andate17',p.andate[17]);
   prnRightSet(s2,'andate18',p.andate[18]);
   prnRightSet(s2,'andate19',p.andate[19]);
   prnRightSet(s2,'andate20',p.andate[20]);


   prnRightSet(s2,'anpay1',p.anpaycl[1]);
   prnRightSet(s2,'anpay2',p.anpaycl[2]);
   prnRightSet(s2,'anpay3',p.anpaycl[3]);
   prnRightSet(s2,'anpay4',p.anpaycl[4]);
   prnRightSet(s2,'anpay5',p.anpaycl[5]);
   prnRightSet(s2,'anpay6',p.anpaycl[6]);
   prnRightSet(s2,'anpay7',p.anpaycl[7]);
   prnRightSet(s2,'anpay8',p.anpaycl[8]);
   prnRightSet(s2,'anpay9',p.anpaycl[9]);
   prnRightSet(s2,'anpay10',p.anpaycl[10]);
   prnRightSet(s2,'anpay11',p.anpaycl[11]);
   prnRightSet(s2,'anpay12',p.anpaycl[12]);
   prnRightSet(s2,'anpay13',p.anpaycl[13]);
   prnRightSet(s2,'anpay14',p.anpaycl[14]);
   prnRightSet(s2,'anpay15',p.anpaycl[15]);
   prnRightSet(s2,'anpay16',p.anpaycl[16]);
   prnRightSet(s2,'anpay17',p.anpaycl[17]);
   prnRightSet(s2,'anpay18',p.anpaycl[18]);
   prnRightSet(s2,'anpay19',p.anpaycl[19]);
   prnRightSet(s2,'anpay20',p.anpaycl[20]);


   prnRightSet(s2,'anpayra1',p.anpayra[1]);
   prnRightSet(s2,'anpayra2',p.anpayra[2]);
   prnRightSet(s2,'anpayra3',p.anpayra[3]);
   prnRightSet(s2,'anpayra4',p.anpayra[4]);
   prnRightSet(s2,'anpayra5',p.anpayra[5]);
   prnRightSet(s2,'anpayra6',p.anpayra[6]);
   prnRightSet(s2,'anpayra7',p.anpayra[7]);
   prnRightSet(s2,'anpayra8',p.anpayra[8]);
   prnRightSet(s2,'anpayra9',p.anpayra[9]);
   prnRightSet(s2,'anpayra10',p.anpayra[10]);
   prnRightSet(s2,'anpayra11',p.anpayra[11]);
   prnRightSet(s2,'anpayra12',p.anpayra[12]);
   prnRightSet(s2,'anpayra13',p.anpayra[13]);
   prnRightSet(s2,'anpayra14',p.anpayra[14]);
   prnRightSet(s2,'anpayra15',p.anpayra[15]);
   prnRightSet(s2,'anpayra16',p.anpayra[16]);
   prnRightSet(s2,'anpayra17',p.anpayra[17]);
   prnRightSet(s2,'anpayra18',p.anpayra[18]);
   prnRightSet(s2,'anpayra19',p.anpayra[19]);
   prnRightSet(s2,'anpayra20',p.anpayra[20]);


   prnRightSet(s2,'mark1',p.andept[1]);
   prnRightSet(s2,'mark2',p.andept[2]);
   prnRightSet(s2,'mark3',p.andept[3]);
   prnRightSet(s2,'mark4',p.andept[4]);
   prnRightSet(s2,'mark5',p.andept[5]);
   prnRightSet(s2,'mark6',p.andept[6]);
   prnRightSet(s2,'mark7',p.andept[7]);
   prnRightSet(s2,'mark8',p.andept[8]);
   prnRightSet(s2,'mark9',p.andept[9]);
   prnRightSet(s2,'mark10',p.andept[10]);
   prnRightSet(s2,'mark11',p.andept[11]);
   prnRightSet(s2,'mark12',p.andept[12]);
   prnRightSet(s2,'mark13',p.andept[13]);
   prnRightSet(s2,'mark14',p.andept[14]);
   prnRightSet(s2,'mark15',p.andept[15]);
   prnRightSet(s2,'mark16',p.andept[16]);
   prnRightSet(s2,'mark17',p.andept[17]);
   prnRightSet(s2,'mark18',p.andept[18]);
   prnRightSet(s2,'mark19',p.andept[19]);
   prnRightSet(s2,'mark20',p.andept[20]);

   AddMacroBlock(s1,s2,'tail');
   prnRightSet(s2,'writedate',p.prnDate);
 end;

 for i := 0 to s2.Count -1 do Writeln(outf,s2.Strings[i]);
 Writeln(outf,'');
 Writeln(outf,'');

 System.Close(F);
 System.Close(outf);
end;

end.
