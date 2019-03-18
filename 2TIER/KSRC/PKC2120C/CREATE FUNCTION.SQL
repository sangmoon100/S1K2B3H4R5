CREATE OR REPLACE FUNCTION HPER.FT_SWEEK
(in_date IN varchar2)
  RETURN number IS
  iIdx   number := 0;
  iCnt   number := 0;
  iDcnt  number := 0;
  v_tot  number := 0;
  iChk   varchar2(1) := '';
BEGIN
   SELECT LAST_DAY(TO_DATE(in_date,'yyyymm')) - TO_DATE(in_date,'yyyymm') + 1
     INTO iDcnt   
     FROM DUAL ;
  
  FOR iIdx IN 1..iDcnt LOOP   

	SELECT TO_CHAR(TO_DATE(in_date || LPAD(iIdx,2,0),'yyyymmdd' ),'d')
	  INTO iChk
	 FROM dual ;  

	IF ((iChk = '1') or (iChk = '7'))  THEN  
	   v_tot := v_tot ;
	ELSE
	   v_tot := v_tot + 1;
	END IF; 

  END LOOP; 

  SELECT count(*) 
    INTO iCnt
    FROM PKCHOLI 
   WHERE holidate like in_date || '%'
     AND TO_CHAR( TO_DATE(holidate,'yyyymmdd'), 'd') not in ('1','7');
         
  RETURN(v_tot - iCnt);
END;
/
