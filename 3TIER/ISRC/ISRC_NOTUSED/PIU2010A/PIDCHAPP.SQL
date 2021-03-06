CREATE TABLE PIDCHAPP ( 
  EMPNO      VARCHAR2 (4), 
  KORNAME    VARCHAR2 (12), 
  PAYCL      VARCHAR2 (2), 
  PAYRA      VARCHAR2 (2), 
  ORGNUM     VARCHAR2 (3), 
  DEPTCODE   VARCHAR2 (5),  
  
  STATUS     VARCHAR2 (1), /*1:임시저장, 2:접수*/
  GUBUN      VARCHAR2 (1), /*5:5년이상, 3:3년이상*/
  
  LONGDESC   VARCHAR2 (600),
  
  APPDEPT1   VARCHAR2 (5), 
  MOVEYYMM1  VARCHAR2 (20), 
  APPSAYU1   VARCHAR2 (1000), 
  SPEDESC1   VARCHAR2 (1000),
 
  APPDEPT2   VARCHAR2 (5), 
  MOVEYYMM2  VARCHAR2 (20), 
  APPSAYU2   VARCHAR2 (1000),
  SPEDESC2   VARCHAR2 (1000), 
  
  APPDEPT3   VARCHAR2 (5), 
  MOVEYYMM3  VARCHAR2 (20), 
  APPSAYU3   VARCHAR2 (1000), 
  SPEDESC3   VARCHAR2 (1000),
  
  WRITETIME  VARCHAR2 (15), 
  WRITEMAN   VARCHAR2 (4))