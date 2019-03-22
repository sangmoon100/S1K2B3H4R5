type
   DataSource_insa = record
      gubun      : string[1];
      korname	 : string[12];	{성명}
      empno	 : string[4];	{사번}
      deptname	 : string[60];	{소속}
      jobline	 : string[10];	{직렬}
      paycl	 : string[10];	{직급+호봉}
      empcode	 : string[10];	{채용구분}
      empdate	 : string[8];	{입사일}
      empterm	 : string[3];	{입사기수}
      empschgr	 : string[16];	{입사시 학력}
      cardate	 : string[8];	{경력일}
      Sex	 : string[4];	{성별}
      religion	 : string[10];	{종교}
      habit	 : string[14];	{취미}
      ability	 : string[14];	{특기}
      height	 : string[3];	{키}
      weight	 : string[3];	{몸무게}
      blood	 : string[3];	{혈액형}
      juminid	 : string[14];	{주민번호}
      holdname	 : string[8];	{호주성명}
      holdrel	 : string[8];	{호주와의 관계}
      retgubun	 : string[10];	{퇴사사유}
      retdate	 : string[8];	{퇴사일}
      retsayu	 : string[12];	{퇴사사유}
      armykind	 : string[4];	{군별}
      armycl	 : string[4];	{계급}
      armyfield  : string[8];	{병과}
      armydis	 : string[10];	{제대구분}
      armyex	 : string[12];	{면제사유}
      armydate	 : string[11];	{복무기간}
      curaddr	 : string[40];	{현주소}
      regaddr	 : string[40];	{본적}
      telno	 : string[15];	{전화번호}
      bornarea	 : string[14];	{출생지}
      bcarym	 : string[4];	{입사전총경력}
   {--------학력사항----------------------------------}
      schgr	 : array[1..7] of string[10];   {학력구분}
      schnm	 : array[1..7] of string[18];  {학교명}
      schtoym	 : array[1..7] of string[11];	{졸업일}
      majorcode  : array[1..7] of string[16];  {전공학과}
      schkind	 : array[1..7] of string[2];   {구분}
      stopic1	 : string[40];	{석사논문}
      stopic2	 : string[40];	{박사논문}
   {--------입사전경력--------------------------------}
      carplace	 : array[1..12] of string[30]; {근무처}
      carymd	 : array[1..12] of string[13]; {기간}
      cardept	 : array[1..12] of string[30]; {근무부서(직위)}
      carjobnm	 : array[1..12] of string[40]; {담당직무}
   {--------자격증사항--------------------------------}
      lickind	 : array[1..6] of string[20]; {자격명}
      licgr	 : array[1..6] of string[10];  {등급}
      licgetdate : array[1..6] of string[8]; {취득일자}
      licno	 : array[1..6] of string[15]; {자격번호}
   {--------포상사항----------------------------------}
      rekindnm	 : array[1..4] of string[18]; {포상명}
      redate     : array[1..4] of string[8];  {포상일자}
      reorgnm	 : array[1..4] of string[12]; {포상권자}
      recause	 : array[1..4] of string[26]; {포상사유}
   {--------징계사항----------------------------------}
      pukindnm	 : array[1..4] of string[18]; {징계명}
      pudate     : array[1..4] of string[8];  {징계일자}
      puorgnm	 : array[1..4] of string[12]; {징계권자}
      pucause	 : array[1..4] of string[26]; {징계사유}
   {--------가족사항----------------------------------}
      facode	 : array[1..11] of string[6];  {관계}
      faname	 : array[1..11] of string[8];  {성명}
      fabirth	 : array[1..11] of string[2];  {생일}
      faschgr	 : array[1..11] of string[10]; {학력}
      faplace	 : array[1..11] of string[20]; {직위}
   {--------비정규학력--------------------------------}
      eduorgnm   : array[1..4] of string[20];  {교육기관명}
      edudate    : array[1..4] of string[11];  {교육기간}
      educontent : array[1..4] of string[20];  {교육내용}
end;

type
   DataSource_insa2 = record
      gubun      : string[1];
      empno      : string[4];
      korname    : string[12];
      ancode     : string[12];
      andate     : string[17];
      paycl      : string[6];
      paygr      : string[2];
      bpaygr     : string[2];
      andata     : string[46];
      payra      : string[12];
      payra2     : string[12];
      tjobduty   : string[18];
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
      //annono     : string[7];
      annono     : string[9];
end;

type
   DataSource_insa3 = record
      gubun      : string[1];
      empno      : string[4];
      korname    : string[12];
      ancode     : string[14]; {발령구분}
      andate     : string[8];  {발령일}
      paycl      : string[6];
      paygr      : string[2];  {발령전호봉}
      bpaygr     : string[2];  {발령후호봉}
      andata     : string[26]; {발령내역}
{ ----------------------------------------------------------------------------
    버전   수정일      수정자  관련근거        수정내용
    30.01  1999.12.31  윤형식  Y2k             인사발령 6자리 --> 8자리 크기변경
 ---------------------------------------------------------------------------}
//      annono     : string[7];  {발령번호}
      annono     : string[9];  {발령번호}
      {인사고과는 추후설계}
      intodate   : string[8];
      paycl2     : string[6];
      adjclass   : string[1];
      adjscore   : string[6];
      payclrank  : string[5];
      totrank    : string[5];
end;

type
   DataSource_insa4 = record
      gubun      : string[1];
      empno      : string[4];
      korname    : string[12];
      // 교육사항
      edutype    : array[1..25] of string[18];
      edugubun   : array[1..25] of string[10];
      edudate    : array[1..25] of string[19];
      educourse  : array[1..25] of string[50];
      edutime    : array[1..25] of string[10];
      eduscore   : array[1..25] of string[10];
      edubigo    : array[1..25] of string[30];
      //포상사항
      rekindnm   : array[1..15] of string[14];
      redate     : array[1..15] of string[8];
      recause    : array[1..15] of string[26];
      reorgnm    : array[1..15] of string[14];
      //징계사항
      pukindnm   : array[1..15] of string[14];
      pudate     : array[1..15] of string[8];
      pucause    : array[1..15] of string[26];
      pucontent  : array[1..15] of string[20];
      // 외국어 사항
      langname   : array[1..10] of string[8];
      examname   : array[1..10] of string[8];
      examdate   : array[1..10] of string[8];
      score      : array[1..10] of string[15];
      examplace  : array[1..10] of string[20];
end;

type
   DataSource_insa5 = record
      gubun         : string[1];    
      empno         : string[4];    
      korname       : string[12];   
      JOBFIELDNAME  : string[20];   //직군
      DUTYKINDNAME  : string[30];   //직종
      DUTYNAME      : string[34];   //직무
      PAYCLNAME     : string[20];   //직급
      DUTYDATE      : string[19];   //직무일자
      YY            : string[42];   //직무기간 년
      MM            : string[42];   //직무기간 월
      DUTYTEXT      : string[80];   //담장직무
      DUTY          : string[10];   //직무코드
end;
