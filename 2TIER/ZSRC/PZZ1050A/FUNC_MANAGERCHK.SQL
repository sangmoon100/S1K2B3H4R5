[프로그램별 사번 하드코딩 대체 Table 및 Function 배포]

Table : PZManager
DB Function : Func_ManagerChk
Delphi Function : Func.pas(OraSqlOpen), TmaxFunc.pas(TmaxSqlOpen)

[사용법]
0.PzManager 테이블에 등록
Insert Into Pzmanager Values ('2','2','PKA1010A','2563','Y','','D006',To_Char(Sysdate,'YYYYMMDDHH24MISS'));
Insert Into Pzmanager Values ('2','5','PZA00000','G011','Y','','D006',To_Char(Sysdate,'YYYYMMDDHH24MISS'));
Select * From PZManager;
Commit;

1.ODAC 
  vAdmin := 'Select Func_ManagerChk(''2'',''2'',''PKA1010A'','''+Pempno 또는 Pgrade+''','''') From Dual';   //VarLoading 필요;
  If OraSqlOpen(vAdmin) = '1' then ShowMessage('관리자');

2.TMax
  vAdmin := 'Select Func_ManagerChk(''3'',''1'',''PKA4040A'','''+Pempno 또는 Pgrade+''','''') From Dual';  //VarLoading 필요;
  FM_Tmax           := TFM_Tmax.Create(nil);
  FM_Tmax.T_Session := TMaxSession;
  If FM_Tmax.TmaxSqlOpen(vAdmin) = '1' then ShowMessage('관리자');

Select Hper.Func_ManagerChk('2','2','PKA1010A','2563','') From Dual;

※ Delphi Function(OraSqlOpen, TmaxSqlOpen)은 다른 프로그램에서도 재사용 가능.

/******************************************************************************/

Create or Replace FUNCTION Func_ManagerChk(vTier VARCHAR2, vGubun VARCHAR2, vProgid VARCHAR2, vEmpno VARCHAR2, vSubkey VARCHAR2) 
RETURN NUMBER IS vCnt NUMBER;
/******************************************************************************
 Ver   Date       Author   Description
 1.0   2017-02    강륜종   프로그램별 사번 하드코딩 대체(RETURN = 1 이면 관리자)
 
Select Hper.Func_ManagerChk('2','2','PKA1010A','2563','') vCnt From Dual; 
Select Hper.Func_ManagerChk('2','5','PZA00000','G011','') vCnt From Dual; 
******************************************************************************/
BEGIN
  vCnt := 0;

  Select Count(*)
    Into vCnt
    From Hper.PZManager
   Where Tier  =vTier
     And Gubun =vGubun
     And Progid=vProgid
     And Empno =vEmpno
     And Nvl(Subkey,'OK')=Nvl(vSubkey,'OK')
     And Useyn ='Y';

 IF vCnt is null THEN vCnt := 0;
 ELSIF Substr(vEmpno,1,1)='D' THEN vCnt := 1;  /*개발자*/
 END IF;
 
 RETURN vCnt;
   
 EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN 0;
    
END Func_ManagerChk;

Create Public Synonym Func_ManagerChk For Func_ManagerChk;
-----------------------------------------------------------------------------------------------

Drop TABLE HPER.PZMANAGER ;
CREATE TABLE HPER.PZMANAGER 
(TIER VARCHAR2(1 BYTE) NOT NULL ENABLE, 
 GUBUN VARCHAR2(1 BYTE) NOT NULL ENABLE, 
 PROGID VARCHAR2(8 BYTE) NOT NULL ENABLE, 
 EMPNO VARCHAR2(4 BYTE) NOT NULL ENABLE, 
 USEYN VARCHAR2(1 BYTE) NOT NULL ENABLE, 
 SUBKEY VARCHAR2(20 BYTE), 
 WRITEMAN VARCHAR2(4 BYTE),
 WRITETIME VARCHAR2(15 BYTE)  ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE INSA_DATA3 ;

   COMMENT ON COLUMN HPER.PZMANAGER.TIER IS 'TIER';
   COMMENT ON COLUMN HPER.PZMANAGER.GUBUN IS '업무구분 (1인사 2급여 3평가 4복리후생 5기타 7교육)';
   COMMENT ON COLUMN HPER.PZMANAGER.PROGID IS '프로그램ID';
   COMMENT ON COLUMN HPER.PZMANAGER.EMPNO IS '담당자 사번 or 그룹ID';
   COMMENT ON COLUMN HPER.PZMANAGER.USEYN IS '사용여부';
   COMMENT ON COLUMN HPER.PZMANAGER.SUBKEY IS '프로그램별 특이점 적용값';
   COMMENT ON TABLE HPER.PZMANAGER  IS '프로그램 담당자 지정(하드코딩대체)';

  CREATE UNIQUE INDEX HPER.PZMANAGER_1 ON HPER.PZMANAGER (TIER, GUBUN, PROGID, EMPNO) 
  PCTFREE 5 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 65536 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE INSA_DATA2 ;


Create Public Synonym PZManager For PZManager;

-----------------------------------------------------------


