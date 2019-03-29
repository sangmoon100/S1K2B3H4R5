unit Pic7064c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,prnlib;

  procedure Form_TextFile;

var
  s1 : TstringList;
  s2 : TstringList;
  outf : TextFile;

implementation
uses pic7061c;

procedure Form_TextFile;
var
  f   : file of pic7061c.inText;
  d   : pic7061c.inText;
  lrec,rec : integer;
  pagecnt  : integer;
  procedure PageHeader;
  begin
   AddMacroBlock(s1,s2,'pageheader');
  end;

  procedure Text_Write;
  var
    i   : integer;
  begin
    AddMacroBlock(s1,s2,'tail');
    for i := 0 to s2.count - 1 do writeln(outf,s2.strings[i]);
    writeln(outf,'');
  end;

begin
   s1 := TstringList.Create;
   s2 := TstringList.Create;

   if FileExists(HomeDir+'\bin\ibin\pic7060c.Frm') = False then begin
      MessageBox(pic7061cForm.Handle,PChar(HomeDir+'\bin\ibin\pic7060c.Frm 화일이 있는지 확인하십시오 !!.'),
                 '에  러',MB_OK or $0010);
      system.Exit;
   end;

   AssignFile(outf,HomeDir+'\list\pic7060c.out');
   rewrite(outf);
   AssignFile(f,HomeDir+'\list\pic7060c.tmp');
   reset(f);
   AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic7060c.frm');
   rec := 1; pagecnt := 1; lrec := 1;
   AddMacroBlock(s1,s2,'head');
   pageheader;


   while not Eof(F) do begin
       read(F,d);
       if (d.gubun = 'P') or (d.gubun = 'S') then begin
          Text_Write;
          if d.gubun = 'P' then lrec := 1 else begin rec := 1; lrec := 1 end;

          AddFormfile(s1,s2,HomeDir+'\bin\ibin\pic7060c.frm');
          PageHeader;
          continue;
       end;
       AddMacroBlock(s1,s2,'body');
       PrnLeftSet(s2,'p11',      FormatFloat('##,###',d.PropCnt[1, 1]),4);
       PrnLeftSet(s2,'p12',      FormatFloat('##,###',d.PropCnt[2, 1]),4);
       PrnLeftSet(s2,'p13',      FormatFloat('##,###',d.PropCnt[3, 1]),4);
       PrnLeftSet(s2,'p14',      FormatFloat('##,###',d.PropCnt[4, 1]),4);
       PrnLeftSet(s2,'p15',      FormatFloat('##,###',d.PropCnt[5, 1]),4);
       PrnLeftSet(s2,'p16',      FormatFloat('##,###',d.PropCnt[6, 1]),4);
       PrnLeftSet(s2,'p17',      FormatFloat('##,###',d.PropCnt[7, 1]),4);
       PrnLeftSet(s2,'p18',      FormatFloat('##,###',d.PropCnt[8, 1]),4);
       PrnLeftSet(s2,'p19',      FormatFloat('##,###',d.PropCnt[9, 1]),4);
       PrnLeftSet(s2,'p110',     FormatFloat('##,###',d.PropCnt[10,1]),4);
       PrnLeftSet(s2,'p111',     FormatFloat('##,###',d.PropCnt[11,1]),4);
       PrnLeftSet(s2,'p112',     FormatFloat('##,###',d.PropCnt[12,1]),4);
       PrnLeftSet(s2,'p113',     FormatFloat('##,###',d.PropCnt[13,1]),4);
       PrnLeftSet(s2,'p114',     FormatFloat('##,###',d.PropCnt[14,1]),4);
       PrnLeftSet(s2,'p115',     FormatFloat('##,###',d.PropCnt[15,1]),4);
       PrnLeftSet(s2,'p116',     FormatFloat('##,###',d.PropCnt[16,1]),4);

       PrnLeftSet(s2,'p21',      FormatFloat('##,###',d.PropCnt[1, 2]),4);
       PrnLeftSet(s2,'p22',      FormatFloat('##,###',d.PropCnt[2, 2]),4);
       PrnLeftSet(s2,'p23',      FormatFloat('##,###',d.PropCnt[3, 2]),4);
       PrnLeftSet(s2,'p24',      FormatFloat('##,###',d.PropCnt[4, 2]),4);
       PrnLeftSet(s2,'p25',      FormatFloat('##,###',d.PropCnt[5, 2]),4);
       PrnLeftSet(s2,'p26',      FormatFloat('##,###',d.PropCnt[6, 2]),4);
       PrnLeftSet(s2,'p27',      FormatFloat('##,###',d.PropCnt[7, 2]),4);
       PrnLeftSet(s2,'p28',      FormatFloat('##,###',d.PropCnt[8, 2]),4);
       PrnLeftSet(s2,'p29',      FormatFloat('##,###',d.PropCnt[9, 2]),4);
       PrnLeftSet(s2,'p210',     FormatFloat('##,###',d.PropCnt[10,2]),4);
       PrnLeftSet(s2,'p211',     FormatFloat('##,###',d.PropCnt[11,2]),4);
       PrnLeftSet(s2,'p212',     FormatFloat('##,###',d.PropCnt[12,2]),4);
       PrnLeftSet(s2,'p213',     FormatFloat('##,###',d.PropCnt[13,2]),4);
       PrnLeftSet(s2,'p214',     FormatFloat('##,###',d.PropCnt[14,2]),4);
       PrnLeftSet(s2,'p215',     FormatFloat('##,###',d.PropCnt[15,2]),4);
       PrnLeftSet(s2,'p216',     FormatFloat('##,###',d.PropCnt[16,2]),4);

       PrnLeftSet(s2,'p31',      FormatFloat('##,###',d.PropCnt[1, 3]),4);
       PrnLeftSet(s2,'p32',      FormatFloat('##,###',d.PropCnt[2, 3]),4);
       PrnLeftSet(s2,'p33',      FormatFloat('##,###',d.PropCnt[3, 3]),4);
       PrnLeftSet(s2,'p34',      FormatFloat('##,###',d.PropCnt[4, 3]),4);
       PrnLeftSet(s2,'p35',      FormatFloat('##,###',d.PropCnt[5, 3]),4);
       PrnLeftSet(s2,'p36',      FormatFloat('##,###',d.PropCnt[6, 3]),4);
       PrnLeftSet(s2,'p37',      FormatFloat('##,###',d.PropCnt[7, 3]),4);
       PrnLeftSet(s2,'p38',      FormatFloat('##,###',d.PropCnt[8, 3]),4);
       PrnLeftSet(s2,'p39',      FormatFloat('##,###',d.PropCnt[9, 3]),4);
       PrnLeftSet(s2,'p310',     FormatFloat('##,###',d.PropCnt[10,3]),4);
       PrnLeftSet(s2,'p311',     FormatFloat('##,###',d.PropCnt[11,3]),4);
       PrnLeftSet(s2,'p312',     FormatFloat('##,###',d.PropCnt[12,3]),4);
       PrnLeftSet(s2,'p313',     FormatFloat('##,###',d.PropCnt[13,3]),4);
       PrnLeftSet(s2,'p314',     FormatFloat('##,###',d.PropCnt[14,3]),4);
       PrnLeftSet(s2,'p315',     FormatFloat('##,###',d.PropCnt[15,3]),4);
       PrnLeftSet(s2,'p316',     FormatFloat('##,###',d.PropCnt[16,3]),4);


       PrnLeftSet(s2,'p41',      FormatFloat('##,###',d.PropCnt[1, 4]),4);
       PrnLeftSet(s2,'p42',      FormatFloat('##,###',d.PropCnt[2, 4]),4);
       PrnLeftSet(s2,'p43',      FormatFloat('##,###',d.PropCnt[3, 4]),4);
       PrnLeftSet(s2,'p44',      FormatFloat('##,###',d.PropCnt[4, 4]),4);
       PrnLeftSet(s2,'p45',      FormatFloat('##,###',d.PropCnt[5, 4]),4);
       PrnLeftSet(s2,'p46',      FormatFloat('##,###',d.PropCnt[6, 4]),4);
       PrnLeftSet(s2,'p47',      FormatFloat('##,###',d.PropCnt[7, 4]),4);
       PrnLeftSet(s2,'p48',      FormatFloat('##,###',d.PropCnt[8, 4]),4);
       PrnLeftSet(s2,'p49',      FormatFloat('##,###',d.PropCnt[9, 4]),4);
       PrnLeftSet(s2,'p410',     FormatFloat('##,###',d.PropCnt[10,4]),4);
       PrnLeftSet(s2,'p411',     FormatFloat('##,###',d.PropCnt[11,4]),4);
       PrnLeftSet(s2,'p412',     FormatFloat('##,###',d.PropCnt[12,4]),4);
       PrnLeftSet(s2,'p413',     FormatFloat('##,###',d.PropCnt[13,4]),4);
       PrnLeftSet(s2,'p414',     FormatFloat('##,###',d.PropCnt[14,4]),4);
       PrnLeftSet(s2,'p415',     FormatFloat('##,###',d.PropCnt[15,4]),4);
       PrnLeftSet(s2,'p416',     FormatFloat('##,###',d.PropCnt[16,4]),4);

       PrnLeftSet(s2,'p51',      FormatFloat('##,###',d.PropCnt[1, 5]),4);
       PrnLeftSet(s2,'p52',      FormatFloat('##,###',d.PropCnt[2, 5]),4);
       PrnLeftSet(s2,'p53',      FormatFloat('##,###',d.PropCnt[3, 5]),4);
       PrnLeftSet(s2,'p54',      FormatFloat('##,###',d.PropCnt[4, 5]),4);
       PrnLeftSet(s2,'p55',      FormatFloat('##,###',d.PropCnt[5, 5]),4);
       PrnLeftSet(s2,'p56',      FormatFloat('##,###',d.PropCnt[6, 5]),4);
       PrnLeftSet(s2,'p57',      FormatFloat('##,###',d.PropCnt[7, 5]),4);
       PrnLeftSet(s2,'p58',      FormatFloat('##,###',d.PropCnt[8, 5]),4);
       PrnLeftSet(s2,'p59',      FormatFloat('##,###',d.PropCnt[9, 5]),4);
       PrnLeftSet(s2,'p510',     FormatFloat('##,###',d.PropCnt[10,5]),4);
       PrnLeftSet(s2,'p511',     FormatFloat('##,###',d.PropCnt[11,5]),4);
       PrnLeftSet(s2,'p512',     FormatFloat('##,###',d.PropCnt[12,5]),4);
       PrnLeftSet(s2,'p513',     FormatFloat('##,###',d.PropCnt[13,5]),4);
       PrnLeftSet(s2,'p514',     FormatFloat('##,###',d.PropCnt[14,5]),4);
       PrnLeftSet(s2,'p515',     FormatFloat('##,###',d.PropCnt[15,5]),4);
       PrnLeftSet(s2,'p516',     FormatFloat('##,###',d.PropCnt[16,5]),4);

       PrnLeftSet(s2,'p61',      FormatFloat('##,###',d.PropCnt[1, 6]),4);
       PrnLeftSet(s2,'p62',      FormatFloat('##,###',d.PropCnt[2, 6]),4);
       PrnLeftSet(s2,'p63',      FormatFloat('##,###',d.PropCnt[3, 6]),4);
       PrnLeftSet(s2,'p64',      FormatFloat('##,###',d.PropCnt[4, 6]),4);
       PrnLeftSet(s2,'p65',      FormatFloat('##,###',d.PropCnt[5, 6]),4);
       PrnLeftSet(s2,'p66',      FormatFloat('##,###',d.PropCnt[6, 6]),4);
       PrnLeftSet(s2,'p67',      FormatFloat('##,###',d.PropCnt[7, 6]),4);
       PrnLeftSet(s2,'p68',      FormatFloat('##,###',d.PropCnt[8, 6]),4);
       PrnLeftSet(s2,'p69',      FormatFloat('##,###',d.PropCnt[9, 6]),4);
       PrnLeftSet(s2,'p610',     FormatFloat('##,###',d.PropCnt[10,6]),4);
       PrnLeftSet(s2,'p611',     FormatFloat('##,###',d.PropCnt[11,6]),4);
       PrnLeftSet(s2,'p612',     FormatFloat('##,###',d.PropCnt[12,6]),4);
       PrnLeftSet(s2,'p613',     FormatFloat('##,###',d.PropCnt[13,6]),4);
       PrnLeftSet(s2,'p614',     FormatFloat('##,###',d.PropCnt[14,6]),4);
       PrnLeftSet(s2,'p615',     FormatFloat('##,###',d.PropCnt[15,6]),4);
       PrnLeftSet(s2,'p616',     FormatFloat('##,###',d.PropCnt[16,6]),4);

       PrnLeftSet(s2,'p71',      FormatFloat('##,###',d.PropCnt[1, 7]),4);
       PrnLeftSet(s2,'p72',      FormatFloat('##,###',d.PropCnt[2, 7]),4);
       PrnLeftSet(s2,'p73',      FormatFloat('##,###',d.PropCnt[3, 7]),4);
       PrnLeftSet(s2,'p74',      FormatFloat('##,###',d.PropCnt[4, 7]),4);
       PrnLeftSet(s2,'p75',      FormatFloat('##,###',d.PropCnt[5, 7]),4);
       PrnLeftSet(s2,'p76',      FormatFloat('##,###',d.PropCnt[6, 7]),4);
       PrnLeftSet(s2,'p77',      FormatFloat('##,###',d.PropCnt[7, 7]),4);
       PrnLeftSet(s2,'p78',      FormatFloat('##,###',d.PropCnt[8, 7]),4);
       PrnLeftSet(s2,'p79',      FormatFloat('##,###',d.PropCnt[9, 7]),4);
       PrnLeftSet(s2,'p710',     FormatFloat('##,###',d.PropCnt[10,7]),4);
       PrnLeftSet(s2,'p711',     FormatFloat('##,###',d.PropCnt[11,7]),4);
       PrnLeftSet(s2,'p712',     FormatFloat('##,###',d.PropCnt[12,7]),4);
       PrnLeftSet(s2,'p713',     FormatFloat('##,###',d.PropCnt[13,7]),4);
       PrnLeftSet(s2,'p714',     FormatFloat('##,###',d.PropCnt[14,7]),4);
       PrnLeftSet(s2,'p715',     FormatFloat('##,###',d.PropCnt[15,7]),4);
       PrnLeftSet(s2,'p716',     FormatFloat('##,###',d.PropCnt[16,7]),4);

       PrnLeftSet(s2,'p81',      FormatFloat('##,###',d.PropCnt[1, 8]),4);
       PrnLeftSet(s2,'p82',      FormatFloat('##,###',d.PropCnt[2, 8]),4);
       PrnLeftSet(s2,'p83',      FormatFloat('##,###',d.PropCnt[3, 8]),4);
       PrnLeftSet(s2,'p84',      FormatFloat('##,###',d.PropCnt[4, 8]),4);
       PrnLeftSet(s2,'p85',      FormatFloat('##,###',d.PropCnt[5, 8]),4);
       PrnLeftSet(s2,'p86',      FormatFloat('##,###',d.PropCnt[6, 8]),4);
       PrnLeftSet(s2,'p87',      FormatFloat('##,###',d.PropCnt[7, 8]),4);
       PrnLeftSet(s2,'p88',      FormatFloat('##,###',d.PropCnt[8, 8]),4);
       PrnLeftSet(s2,'p89',      FormatFloat('##,###',d.PropCnt[9, 8]),4);
       PrnLeftSet(s2,'p810',     FormatFloat('##,###',d.PropCnt[10,8]),4);
       PrnLeftSet(s2,'p811',     FormatFloat('##,###',d.PropCnt[11,8]),4);
       PrnLeftSet(s2,'p812',     FormatFloat('##,###',d.PropCnt[12,8]),4);
       PrnLeftSet(s2,'p813',     FormatFloat('##,###',d.PropCnt[13,8]),4);
       PrnLeftSet(s2,'p814',     FormatFloat('##,###',d.PropCnt[14,8]),4);
       PrnLeftSet(s2,'p815',     FormatFloat('##,###',d.PropCnt[15,8]),4);
       PrnLeftSet(s2,'p816',     FormatFloat('##,###',d.PropCnt[16,8]),4);
//   전환

       PrnLeftSet(s2,'c11',      FormatFloat('##,###',d.ChanCnt[1, 1]),4);
       PrnLeftSet(s2,'c12',      FormatFloat('##,###',d.ChanCnt[2, 1]),4);
       PrnLeftSet(s2,'c13',      FormatFloat('##,###',d.ChanCnt[3, 1]),4);
       PrnLeftSet(s2,'c14',      FormatFloat('##,###',d.ChanCnt[4, 1]),4);
       PrnLeftSet(s2,'c15',      FormatFloat('##,###',d.ChanCnt[5, 1]),4);
       PrnLeftSet(s2,'c16',      FormatFloat('##,###',d.ChanCnt[6, 1]),4);
       PrnLeftSet(s2,'c17',      FormatFloat('##,###',d.ChanCnt[7, 1]),4);
       PrnLeftSet(s2,'c18',      FormatFloat('##,###',d.ChanCnt[8, 1]),4);
       PrnLeftSet(s2,'c19',      FormatFloat('##,###',d.ChanCnt[9, 1]),4);
       PrnLeftSet(s2,'c110',     FormatFloat('##,###',d.ChanCnt[10,1]),4);
       PrnLeftSet(s2,'c111',     FormatFloat('##,###',d.ChanCnt[11,1]),4);
       PrnLeftSet(s2,'c112',     FormatFloat('##,###',d.ChanCnt[12,1]),4);
       PrnLeftSet(s2,'c113',     FormatFloat('##,###',d.ChanCnt[13,1]),4);
       PrnLeftSet(s2,'c114',     FormatFloat('##,###',d.ChanCnt[14,1]),4);
       PrnLeftSet(s2,'c115',     FormatFloat('##,###',d.ChanCnt[15,1]),4);
       PrnLeftSet(s2,'c116',     FormatFloat('##,###',d.ChanCnt[16,1]),4);

       PrnLeftSet(s2,'c21',      FormatFloat('##,###',d.ChanCnt[1, 2]),4);
       PrnLeftSet(s2,'c22',      FormatFloat('##,###',d.ChanCnt[2, 2]),4);
       PrnLeftSet(s2,'c23',      FormatFloat('##,###',d.ChanCnt[3, 2]),4);
       PrnLeftSet(s2,'c24',      FormatFloat('##,###',d.ChanCnt[4, 2]),4);
       PrnLeftSet(s2,'c25',      FormatFloat('##,###',d.ChanCnt[5, 2]),4);
       PrnLeftSet(s2,'c26',      FormatFloat('##,###',d.ChanCnt[6, 2]),4);
       PrnLeftSet(s2,'c27',      FormatFloat('##,###',d.ChanCnt[7, 2]),4);
       PrnLeftSet(s2,'c28',      FormatFloat('##,###',d.ChanCnt[8, 2]),4);
       PrnLeftSet(s2,'c29',      FormatFloat('##,###',d.ChanCnt[9, 2]),4);
       PrnLeftSet(s2,'c210',     FormatFloat('##,###',d.ChanCnt[10,2]),4);
       PrnLeftSet(s2,'c211',     FormatFloat('##,###',d.ChanCnt[11,2]),4);
       PrnLeftSet(s2,'c212',     FormatFloat('##,###',d.ChanCnt[12,2]),4);
       PrnLeftSet(s2,'c213',     FormatFloat('##,###',d.ChanCnt[13,2]),4);
       PrnLeftSet(s2,'c214',     FormatFloat('##,###',d.ChanCnt[14,2]),4);
       PrnLeftSet(s2,'c215',     FormatFloat('##,###',d.ChanCnt[15,2]),4);
       PrnLeftSet(s2,'c216',     FormatFloat('##,###',d.ChanCnt[16,2]),4);


       PrnLeftSet(s2,'c31',      FormatFloat('##,###',d.ChanCnt[1, 3]),4);
       PrnLeftSet(s2,'c32',      FormatFloat('##,###',d.ChanCnt[2, 3]),4);
       PrnLeftSet(s2,'c33',      FormatFloat('##,###',d.ChanCnt[3, 3]),4);
       PrnLeftSet(s2,'c34',      FormatFloat('##,###',d.ChanCnt[4, 3]),4);
       PrnLeftSet(s2,'c35',      FormatFloat('##,###',d.ChanCnt[5, 3]),4);
       PrnLeftSet(s2,'c36',      FormatFloat('##,###',d.ChanCnt[6, 3]),4);
       PrnLeftSet(s2,'c37',      FormatFloat('##,###',d.ChanCnt[7, 3]),4);
       PrnLeftSet(s2,'c38',      FormatFloat('##,###',d.ChanCnt[8, 3]),4);
       PrnLeftSet(s2,'c39',      FormatFloat('##,###',d.ChanCnt[9, 3]),4);
       PrnLeftSet(s2,'c310',     FormatFloat('##,###',d.ChanCnt[10,3]),4);
       PrnLeftSet(s2,'c311',     FormatFloat('##,###',d.ChanCnt[11,3]),4);
       PrnLeftSet(s2,'c312',     FormatFloat('##,###',d.ChanCnt[12,3]),4);
       PrnLeftSet(s2,'c313',     FormatFloat('##,###',d.ChanCnt[13,3]),4);
       PrnLeftSet(s2,'c314',     FormatFloat('##,###',d.ChanCnt[14,3]),4);
       PrnLeftSet(s2,'c315',     FormatFloat('##,###',d.ChanCnt[15,3]),4);
       PrnLeftSet(s2,'c316',     FormatFloat('##,###',d.ChanCnt[16,3]),4);

       PrnLeftSet(s2,'c41',      FormatFloat('##,###',d.ChanCnt[1, 4]),4);
       PrnLeftSet(s2,'c42',      FormatFloat('##,###',d.ChanCnt[2, 4]),4);
       PrnLeftSet(s2,'c43',      FormatFloat('##,###',d.ChanCnt[3, 4]),4);
       PrnLeftSet(s2,'c44',      FormatFloat('##,###',d.ChanCnt[4, 4]),4);
       PrnLeftSet(s2,'c45',      FormatFloat('##,###',d.ChanCnt[5, 4]),4);
       PrnLeftSet(s2,'c46',      FormatFloat('##,###',d.ChanCnt[6, 4]),4);
       PrnLeftSet(s2,'c47',      FormatFloat('##,###',d.ChanCnt[7, 4]),4);
       PrnLeftSet(s2,'c48',      FormatFloat('##,###',d.ChanCnt[8, 4]),4);
       PrnLeftSet(s2,'c49',      FormatFloat('##,###',d.ChanCnt[9, 4]),4);
       PrnLeftSet(s2,'c410',     FormatFloat('##,###',d.ChanCnt[10,4]),4);
       PrnLeftSet(s2,'c411',     FormatFloat('##,###',d.ChanCnt[11,4]),4);
       PrnLeftSet(s2,'c412',     FormatFloat('##,###',d.ChanCnt[12,4]),4);
       PrnLeftSet(s2,'c413',     FormatFloat('##,###',d.ChanCnt[13,4]),4);
       PrnLeftSet(s2,'c414',     FormatFloat('##,###',d.ChanCnt[14,4]),4);
       PrnLeftSet(s2,'c415',     FormatFloat('##,###',d.ChanCnt[15,4]),4);
       PrnLeftSet(s2,'c416',     FormatFloat('##,###',d.ChanCnt[16,4]),4);

       PrnLeftSet(s2,'c51',      FormatFloat('##,###',d.ChanCnt[1, 5]),4);
       PrnLeftSet(s2,'c52',      FormatFloat('##,###',d.ChanCnt[2, 5]),4);
       PrnLeftSet(s2,'c53',      FormatFloat('##,###',d.ChanCnt[3, 5]),4);
       PrnLeftSet(s2,'c54',      FormatFloat('##,###',d.ChanCnt[4, 5]),4);
       PrnLeftSet(s2,'c55',      FormatFloat('##,###',d.ChanCnt[5, 5]),4);
       PrnLeftSet(s2,'c56',      FormatFloat('##,###',d.ChanCnt[6, 5]),4);
       PrnLeftSet(s2,'c57',      FormatFloat('##,###',d.ChanCnt[7, 5]),4);
       PrnLeftSet(s2,'c58',      FormatFloat('##,###',d.ChanCnt[8, 5]),4);
       PrnLeftSet(s2,'c59',      FormatFloat('##,###',d.ChanCnt[9, 5]),4);
       PrnLeftSet(s2,'c510',     FormatFloat('##,###',d.ChanCnt[10,5]),4);
       PrnLeftSet(s2,'c511',     FormatFloat('##,###',d.ChanCnt[11,5]),4);
       PrnLeftSet(s2,'c512',     FormatFloat('##,###',d.ChanCnt[12,5]),4);
       PrnLeftSet(s2,'c513',     FormatFloat('##,###',d.ChanCnt[13,5]),4);
       PrnLeftSet(s2,'c514',     FormatFloat('##,###',d.ChanCnt[14,5]),4);
       PrnLeftSet(s2,'c515',     FormatFloat('##,###',d.ChanCnt[15,5]),4);
       PrnLeftSet(s2,'c516',     FormatFloat('##,###',d.ChanCnt[16,5]),4);

       PrnLeftSet(s2,'c61',      FormatFloat('##,###',d.ChanCnt[1, 6]),4);
       PrnLeftSet(s2,'c62',      FormatFloat('##,###',d.ChanCnt[2, 6]),4);
       PrnLeftSet(s2,'c63',      FormatFloat('##,###',d.ChanCnt[3, 6]),4);
       PrnLeftSet(s2,'c64',      FormatFloat('##,###',d.ChanCnt[4, 6]),4);
       PrnLeftSet(s2,'c65',      FormatFloat('##,###',d.ChanCnt[5, 6]),4);
       PrnLeftSet(s2,'c66',      FormatFloat('##,###',d.ChanCnt[6, 6]),4);
       PrnLeftSet(s2,'c67',      FormatFloat('##,###',d.ChanCnt[7, 6]),4);
       PrnLeftSet(s2,'c68',      FormatFloat('##,###',d.ChanCnt[8, 6]),4);
       PrnLeftSet(s2,'c69',      FormatFloat('##,###',d.ChanCnt[9, 6]),4);
       PrnLeftSet(s2,'c610',     FormatFloat('##,###',d.ChanCnt[10,6]),4);
       PrnLeftSet(s2,'c611',     FormatFloat('##,###',d.ChanCnt[11,6]),4);
       PrnLeftSet(s2,'c612',     FormatFloat('##,###',d.ChanCnt[12,6]),4);
       PrnLeftSet(s2,'c613',     FormatFloat('##,###',d.ChanCnt[13,6]),4);
       PrnLeftSet(s2,'c614',     FormatFloat('##,###',d.ChanCnt[14,6]),4);
       PrnLeftSet(s2,'c615',     FormatFloat('##,###',d.ChanCnt[15,6]),4);
       PrnLeftSet(s2,'c616',     FormatFloat('##,###',d.ChanCnt[16,6]),4);


       PrnLeftSet(s2,'c71',      FormatFloat('##,###',d.ChanCnt[1, 7]),4);
       PrnLeftSet(s2,'c72',      FormatFloat('##,###',d.ChanCnt[2, 7]),4);
       PrnLeftSet(s2,'c73',      FormatFloat('##,###',d.ChanCnt[3, 7]),4);
       PrnLeftSet(s2,'c74',      FormatFloat('##,###',d.ChanCnt[4, 7]),4);
       PrnLeftSet(s2,'c75',      FormatFloat('##,###',d.ChanCnt[5, 7]),4);
       PrnLeftSet(s2,'c76',      FormatFloat('##,###',d.ChanCnt[6, 7]),4);
       PrnLeftSet(s2,'c77',      FormatFloat('##,###',d.ChanCnt[7, 7]),4);
       PrnLeftSet(s2,'c78',      FormatFloat('##,###',d.ChanCnt[8, 7]),4);
       PrnLeftSet(s2,'c79',      FormatFloat('##,###',d.ChanCnt[9, 7]),4);
       PrnLeftSet(s2,'c710',     FormatFloat('##,###',d.ChanCnt[10,7]),4);
       PrnLeftSet(s2,'c711',     FormatFloat('##,###',d.ChanCnt[11,7]),4);
       PrnLeftSet(s2,'c712',     FormatFloat('##,###',d.ChanCnt[12,7]),4);
       PrnLeftSet(s2,'c713',     FormatFloat('##,###',d.ChanCnt[13,7]),4);
       PrnLeftSet(s2,'c714',     FormatFloat('##,###',d.ChanCnt[14,7]),4);
       PrnLeftSet(s2,'c715',     FormatFloat('##,###',d.ChanCnt[15,7]),4);
       PrnLeftSet(s2,'c716',     FormatFloat('##,###',d.ChanCnt[16,7]),4);

       PrnLeftSet(s2,'c81',      FormatFloat('##,###',d.ChanCnt[1, 8]),4);
       PrnLeftSet(s2,'c82',      FormatFloat('##,###',d.ChanCnt[2, 8]),4);
       PrnLeftSet(s2,'c83',      FormatFloat('##,###',d.ChanCnt[3, 8]),4);
       PrnLeftSet(s2,'c84',      FormatFloat('##,###',d.ChanCnt[4, 8]),4);
       PrnLeftSet(s2,'c85',      FormatFloat('##,###',d.ChanCnt[5, 8]),4);
       PrnLeftSet(s2,'c86',      FormatFloat('##,###',d.ChanCnt[6, 8]),4);
       PrnLeftSet(s2,'c87',      FormatFloat('##,###',d.ChanCnt[7, 8]),4);
       PrnLeftSet(s2,'c88',      FormatFloat('##,###',d.ChanCnt[8, 8]),4);
       PrnLeftSet(s2,'c89',      FormatFloat('##,###',d.ChanCnt[9, 8]),4);
       PrnLeftSet(s2,'c810',     FormatFloat('##,###',d.ChanCnt[10,8]),4);
       PrnLeftSet(s2,'c811',     FormatFloat('##,###',d.ChanCnt[11,8]),4);
       PrnLeftSet(s2,'c812',     FormatFloat('##,###',d.ChanCnt[12,8]),4);
       PrnLeftSet(s2,'c813',     FormatFloat('##,###',d.ChanCnt[13,8]),4);
       PrnLeftSet(s2,'c814',     FormatFloat('##,###',d.ChanCnt[14,8]),4);
       PrnLeftSet(s2,'c815',     FormatFloat('##,###',d.ChanCnt[15,8]),4);
       PrnLeftSet(s2,'c816',     FormatFloat('##,###',d.ChanCnt[16,8]),4);

       PrnLeftSet(s2,'c91',      FormatFloat('##,###',d.ChanCnt[1, 9]),4);
       PrnLeftSet(s2,'c92',      FormatFloat('##,###',d.ChanCnt[2, 9]),4);
       PrnLeftSet(s2,'c93',      FormatFloat('##,###',d.ChanCnt[3, 9]),4);
       PrnLeftSet(s2,'c94',      FormatFloat('##,###',d.ChanCnt[4, 9]),4);
       PrnLeftSet(s2,'c95',      FormatFloat('##,###',d.ChanCnt[5, 9]),4);
       PrnLeftSet(s2,'c96',      FormatFloat('##,###',d.ChanCnt[6, 9]),4);
       PrnLeftSet(s2,'c97',      FormatFloat('##,###',d.ChanCnt[7, 9]),4);
       PrnLeftSet(s2,'c98',      FormatFloat('##,###',d.ChanCnt[8, 9]),4);
       PrnLeftSet(s2,'c99',      FormatFloat('##,###',d.ChanCnt[9, 9]),4);
       PrnLeftSet(s2,'c910',     FormatFloat('##,###',d.ChanCnt[10,9]),4);
       PrnLeftSet(s2,'c911',     FormatFloat('##,###',d.ChanCnt[11,9]),4);
       PrnLeftSet(s2,'c912',     FormatFloat('##,###',d.ChanCnt[12,9]),4);
       PrnLeftSet(s2,'c913',     FormatFloat('##,###',d.ChanCnt[13,9]),4);
       PrnLeftSet(s2,'c914',     FormatFloat('##,###',d.ChanCnt[14,9]),4);
       PrnLeftSet(s2,'c915',     FormatFloat('##,###',d.ChanCnt[15,9]),4);
       PrnLeftSet(s2,'c916',     FormatFloat('##,###',d.ChanCnt[16,9]),4);

   end;
   Text_Write;
   system.close(outf);
   system.close(f);
end;

end.
