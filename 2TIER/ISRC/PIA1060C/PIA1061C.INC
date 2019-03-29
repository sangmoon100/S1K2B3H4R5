
type
   DataSource_insa = record
      gubun       : string[1];
      korname	    : string[12];	// 성명
      chnname     : string[12];	// 한자성명  2002.08.19 shm 추가
      empno	      : string[4];	// 사번
      deptname	  : string[60];	// 소속
      jikdeptname : string[30]; //직무그룹name 2001.12.19 shm 추가
      payranm	    : string[14];	// 직위
      paygr1	    : string[14];	// 직급+호봉
      paycldate   : string[8];	// 직급일
      orgempdate  : string[8];	// 하나로입사일
      paygr2	    : string[14];	// 입사시 직급,호봉
      empdate	    : string[8];	// 최초입사일
      Groupempdate  : string[8];	// 그룹입사일 dsa2000  201.06. Add      
      empcode	    : string[15];	// 입사구분
      cardate     : string[10];  // 경력일
      jobplace    : string[16];  // 근무지
      trlimfrto   : string[17];  // 전보제한기간
      licalkind   : string[20];  // 자격선임
      jobline     : string[20];  // 입사직렬
      empjobplace : string[20];  // 입사근무지
      juminid	    : string[14];	// 주민번호
      korage      : string[8];   // 연령
      usaageSex   : string[8];	// 나이,성별
      marrigeyn   : string[4];	// 혼인여부
      //ability	 : string[10];	// 특기
      armykind	  : string[10];	// 군별
      armyfrto    : string[21];	// 군복무기간
      curaddr     : string[50];  // 현주소
      regaddr     : string[50];  // 본적
      telno       : string[16];  // 전화번호
      bornarea    : string[12];  // 출생지
      junpay_amt  : string[18];  // 전년도연봉
      jungita_amt : string[18];  // 전년도 기타급여
      danpay_amt  : string[18];  // 당년도연봉
      pstate      : string[20];  // 인사상태
      psdate      : string[22];  // 인사상태에서의 기간
      bcaryy      : string[2];   // 입사전총경력년월
      bcarmm      : string[2];
      prnDate     : string[10];  // 출력일자
      exduym      : string[11];  // 총근속제외년,월
      caramt      : string[4];   // 총경력
      weddingdate : string[10];   // 결혼기념일
      birthday    : string[10];   // 생년월일
      birthgubun  : string[6];   // 생일구분
   // --------학력사항----------------------------------
      schgr	 : array[1..4] of string[10];   // 학력구분
      schnm	 : array[1..4] of string[24];  // 학교명
      schfrtoym	 : array[1..4] of string[11];   // 졸업일
      majorcode  : array[1..4] of string[24];  // 전공학과
   // --------가족사항----------------------------------
      facode     : array[1..6] of string[8];  // 관계
      faname     : array[1..6] of string[12]; // 성명
      fabirth    : array[1..6] of string[10]; // 생일
      faschgr    : array[1..6] of string[10]; // 학력
      faplace    : array[1..6] of string[20]; // 직위
   // --------교육사항----------------------------------
      edufrtodate : array[1..5] of string[17];
      educourse   : array[1..5] of string[80];
      edutype     : array[1..5] of string[20];
      edutime     : array[1..5] of string[20];
      eduscore    : array[1..5] of string[20];
      edugubun    : array[1..5] of string[20];

   // --------입사전경력--------------------------------
//==============================================================================//
//30.85   2002.11.20    손종운  자체            계약직 직무 오류 수정, field 길이 수정
//==============================================================================//
//      carplace   : array[1..4] of string[20]; // 근무처
      carplace   : array[1..4] of string[30]; // 근무처
      carymd     : array[1..4] of string[11]; // 기간
      carym	 : array[1..4] of string[20]; // 경력년월
//      cardept    : array[1..4] of string[26]; // 근무부서(직위)
      cardept    : array[1..4] of string[30]; // 근무부서(직위)
//==============================================================================//
      carjobnm   : array[1..4] of string[30]; // 담당직무
   // --------자격증사항--------------------------------
      licekind    : array[1..2] of string[20];
      licgr      : array[1..2] of string[10]; // 등급
      licgetdate : array[1..2] of string[10]; // 취득일
      licalfield : array[1..2] of string[30]; // 선임분야
   // --------외국어 사항--------------------------------
      langname    : array[1..2] of string[15]; // 외국어
      examname    : array[1..2] of string[10]; // 시험명
      examscore   : array[1..2] of string[4]; // 점수
      examdate    : array[1..2] of string[10]; // 검정일
   // --------인사고과는 -------------------------------
      intodate   : array[1..6] of string[4];
      ipaycl     : array[1..6] of string[6];
      ie1scr     : array[1..6] of string[16];
      ie2scr     : array[1..6] of string[16];
      adjclass   : array[1..6] of string[10];
   // --------상향평가는 -------------------------------
      aptodate   : array[1..3] of string[4];
      apaycl     : array[1..3] of string[6];
      aclass     : array[1..3] of string[4];
      ascore     : array[1..3] of string[6];
   // --------포상사항----------------------------------
      rekindnm   : array[1..2] of string[20]; // 포상명
      reorgnm    : array[1..2] of string[12]; // 포상권자
      redate     : array[1..2] of string[10];  // 포상일자
   // --------징계사항----------------------------------
      pukindnm   : array[1..2] of string[20]; // 징계명
      pucause    : array[1..2] of string[36]; // 징계사유
      pudate     : array[1..2] of string[10];  // 징계일
      
   // 1999.07.28 추가 
	empterm		: string[20];		// 입사기수
	remark		: string[20];		// 특기사항
	lschgr		: string[20];		// 최종학력
      	tjobduty	: string[40];		// 계약직무
      	height		: string[10];		// 신장
     	weight		: string[10];		// 체중
      	blood		: string[05];		// 혈액형
      	religion	: string[20];		// 종교
      	habit		: string[15];		// 취미
      	ability		: string[15];		// 특기
      	armycl		: string[20];		// 계급
      	armyfield 	: string[20];		// 병과
      	armydis		: string[20];		// 제대구분
      	armyfrdate	: string[10];		// 복무기간Fr
      	armytodate	: string[10];		// 복무기간To

 	// 비정규학력
      	eduorgnm	: array[1..4] of string[30];
      	educontent	: array[1..4] of string[30];
      	edudate		: array[1..4] of string[11];
      	
      	scgubun		: string[20];		// 특례구분
      	scentdate	: string[10];		// 편입일
      	scpredate	: string[10];		// 만료예정일
      	scenddate	: string[10];		// 만료일
      	
      	bohungubun	: string[20];		// 보훈구분
      	bohunnm		: string[12];		// 유공자
      	bohunrel	: string[20];		// 보훈구분

      	obskind		: string[20];		// 장애유형
      	obsgr		: string[20];		// 장애등급
      	obsstate	: string[30];		// 장애상태
  // 조직전보일
        realtrdate      : string[8];            // 전보일
        offtrdate       : string[8];            // 조직전보일
  // 노조사항
        noGubun    : string[20]; //노조구분
   // --------발령사항----------------------------------
(*2017.02.20.hjku..
      ancode     : array[1..20] of string[12];
      andate     : array[1..20] of string[21];
      anpaycl    : array[1..20] of string[12];
      anpayra    : array[1..20] of string[12];
      anpayra2   : array[1..20] of string[12];
      andept     : array[1..20] of string[120];
*)
      ancode     : array[1..200] of string[12];
      andate     : array[1..200] of string[21];
      anpaycl    : array[1..200] of string[12];
      anpayra    : array[1..200] of string[12];
      anpayra2   : array[1..200] of string[12];
      andept     : array[1..200] of string[120];

        
end;
