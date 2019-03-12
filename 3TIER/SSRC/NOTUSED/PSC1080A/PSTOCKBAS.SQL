CREATE TABLE PSTOCKbas
(
  basedate   VARCHAR2(8 BYTE),
  cprice     NUMBER(7),
  WRITETIME  VARCHAR2(15 BYTE),
  WRITEMAN   VARCHAR2(4 BYTE)
)
TABLESPACE INSA_DATA3
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          34K
            NEXT             136K
            MINEXTENTS       1
            MAXEXTENTS       10240
            PCTINCREASE      100
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON TABLE PSTOCKbas IS '스톡옵션 행사기준가';

COMMENT ON COLUMN PSTOCKbas.basedate is '기준일자';
COMMENT ON COLUMN PSTOCKbas.cprice   is '기준종가';
COMMENT ON COLUMN PSTOCKbas.WRITETIME IS '작업일시';
COMMENT ON COLUMN PSTOCKbas.WRITEMAN IS '작업자';

CREATE INDEX I1_PSTOCKbas ON PSTOCKbas
(basedate)
LOGGING
TABLESPACE INSA_DATA2
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          8K
            NEXT             16K
            MINEXTENTS       1
            MAXEXTENTS       121
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE PUBLIC SYNONYM PSTOCKbas FOR PSTOCKbas;

GRANT SELECT ON  PSTOCKbas TO HPERINFO;

GRANT DELETE, INSERT, SELECT, UPDATE ON  PSTOCKbas TO HPERSON;

