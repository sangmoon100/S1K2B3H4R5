type
   DataSource_insa = record
      gubun       : string[1];
      korname	    : string[12];	// ����
      chnname     : string[12];	// ���ڼ���  2002.08.19 shm �߰�
      empno	      : string[4];	// ���
      deptname	  : string[60];	// �Ҽ�
      jikdeptname : string[30]; //�����׷�name 2001.12.19 shm �߰�
      payranm	    : string[14];	// ����
      paygr1	    : string[14];	// ����+ȣ��
      paycldate   : string[8];	// ������
      orgempdate  : string[8];	// �ϳ����Ի���
      paygr2	    : string[14];	// �Ի�� ����,ȣ��
      empdate	    : string[8];	// �����Ի���
      Groupempdate  : string[8];	// �׷��Ի��� dsa2000  201.06. Add      
      empcode	    : string[15];	// �Ի籸��
      cardate     : string[10];  // �����
      jobplace    : string[16];  // �ٹ���
      trlimfrto   : string[17];  // �������ѱⰣ
      licalkind   : string[20];  // �ڰݼ���
      jobline     : string[20];  // �Ի�����
      empjobplace : string[20];  // �Ի�ٹ���
      juminid	    : string[14];	// �ֹι�ȣ
      korage      : string[8];   // ����
      usaageSex   : string[8];	// ����,����
      marrigeyn   : string[4];	// ȥ�ο���
      //ability	 : string[10];	// Ư��
      armykind	  : string[10];	// ����
      armyfrto    : string[21];	// �������Ⱓ
      curaddr     : string[50];  // ���ּ�
      regaddr     : string[50];  // ����
      telno       : string[16];  // ��ȭ��ȣ
      bornarea    : string[12];  // �����
      junpay_amt  : string[18];  // ���⵵����
      jungita_amt : string[18];  // ���⵵ ��Ÿ�޿�
      danpay_amt  : string[18];  // ��⵵����
      pstate      : string[20];  // �λ����
      psdate      : string[22];  // �λ���¿����� �Ⱓ
      bcaryy      : string[2];   // �Ի����Ѱ�³��
      bcarmm      : string[2];
      prnDate     : string[10];  // �������
      exduym      : string[11];  // �ѱټ����ܳ�,��
      caramt      : string[4];   // �Ѱ��
      weddingdate : string[10];   // ��ȥ�����
      birthday    : string[10];   // �������
      birthgubun  : string[6];   // ���ϱ���
   // --------�з»���----------------------------------
      schgr	 : array[1..4] of string[10];   // �з±���
      schnm	 : array[1..4] of string[24];  // �б���
      schfrtoym	 : array[1..4] of string[11];   // ������
      majorcode  : array[1..4] of string[24];  // �����а�
   // --------��������----------------------------------
      facode     : array[1..6] of string[8];  // ����
      faname     : array[1..6] of string[12]; // ����
      fabirth    : array[1..6] of string[10]; // ����
      faschgr    : array[1..6] of string[10]; // �з�
      faplace    : array[1..6] of string[20]; // ����
   // --------�߷ɻ���----------------------------------
      ancode     : array[1..20] of string[12];
      andate     : array[1..20] of string[21];
      anpaycl    : array[1..20] of string[12];
      anpayra    : array[1..20] of string[12];
      anpayra2   : array[1..20] of string[12];
      andept     : array[1..20] of string[120];
   // --------��������----------------------------------
      edufrtodate : array[1..5] of string[17];
      educourse   : array[1..5] of string[80];
      edutype     : array[1..5] of string[20];
      edutime     : array[1..5] of string[20];
      eduscore    : array[1..5] of string[20];
      edugubun    : array[1..5] of string[20];

   // --------�Ի������--------------------------------
//==============================================================================//
//30.85   2002.11.20    ������  ��ü            ����� ���� ���� ����, field ���� ����
//==============================================================================//
//      carplace   : array[1..4] of string[20]; // �ٹ�ó
      carplace   : array[1..4] of string[30]; // �ٹ�ó
      carymd     : array[1..4] of string[11]; // �Ⱓ
      carym	 : array[1..4] of string[20]; // ��³��
//      cardept    : array[1..4] of string[26]; // �ٹ��μ�(����)
      cardept    : array[1..4] of string[30]; // �ٹ��μ�(����)
//==============================================================================//
      carjobnm   : array[1..4] of string[30]; // �������
   // --------�ڰ�������--------------------------------
      licekind    : array[1..2] of string[20];
      licgr      : array[1..2] of string[10]; // ���
      licgetdate : array[1..2] of string[10]; // �����
      licalfield : array[1..2] of string[30]; // ���Ӻо�
   // --------�ܱ��� ����--------------------------------
      langname    : array[1..2] of string[15]; // �ܱ���
      examname    : array[1..2] of string[10]; // �����
      examscore   : array[1..2] of string[4]; // ����
      examdate    : array[1..2] of string[10]; // ������
   // --------�λ������ -------------------------------
      intodate   : array[1..6] of string[4];
      ipaycl     : array[1..6] of string[6];
      ie1scr     : array[1..6] of string[16];
      ie2scr     : array[1..6] of string[16];
      adjclass   : array[1..6] of string[10];
   // --------�����򰡴� -------------------------------
      aptodate   : array[1..3] of string[4];
      apaycl     : array[1..3] of string[6];
      aclass     : array[1..3] of string[4];
      ascore     : array[1..3] of string[6];
   // --------�������----------------------------------
      rekindnm   : array[1..2] of string[20]; // �����
      reorgnm    : array[1..2] of string[12]; // �������
      redate     : array[1..2] of string[10];  // ��������
   // --------¡�����----------------------------------
      pukindnm   : array[1..2] of string[20]; // ¡���
      pucause    : array[1..2] of string[36]; // ¡�����
      pudate     : array[1..2] of string[10];  // ¡����
      
   // 1999.07.28 �߰� 
	empterm		: string[20];		// �Ի���
	remark		: string[20];		// Ư�����
	lschgr		: string[20];		// �����з�
      	tjobduty	: string[40];		// �������
      	height		: string[10];		// ����
     	weight		: string[10];		// ü��
      	blood		: string[05];		// ������
      	religion	: string[20];		// ����
      	habit		: string[15];		// ���
      	ability		: string[15];		// Ư��
      	armycl		: string[20];		// ���
      	armyfield 	: string[20];		// ����
      	armydis		: string[20];		// ���뱸��
      	armyfrdate	: string[10];		// �����ⰣFr
      	armytodate	: string[10];		// �����ⰣTo

 	// �������з�
      	eduorgnm	: array[1..4] of string[30];
      	educontent	: array[1..4] of string[30];
      	edudate		: array[1..4] of string[11];
      	
      	scgubun		: string[20];		// Ư�ʱ���
      	scentdate	: string[10];		// ������
      	scpredate	: string[10];		// ���Ό����
      	scenddate	: string[10];		// ������
      	
      	bohungubun	: string[20];		// ���Ʊ���
      	bohunnm		: string[12];		// ������
      	bohunrel	: string[20];		// ���Ʊ���

      	obskind		: string[20];		// �������
      	obsgr		: string[20];		// ��ֵ��
      	obsstate	: string[30];		// ��ֻ���
  // ����������
        realtrdate      : string[8];            // ������
        offtrdate       : string[8];            // ����������
  // ��������
        noGubun    : string[20]; //��������
end;