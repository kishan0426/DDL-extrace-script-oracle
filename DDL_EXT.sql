
--Extract DDL 

set lines 200 pages 1000
col TAB_DDL for a15
col IND_DDL for a15
col MV_DDL for a15
def IND="'INDEX'"
def TAB="'TABLE'"
def MVIEW="'MATERIALIZED_VIEW'"
def IND="'INDEX','XPK_XTBL1'"
def TAB="'TABLE','XTBL'"
def MVIEW="'MATERIALIZED_VIEW','MVSAL'"
select DBMS_METADATA.GET_DDL(&TAB) as TAB_DDL,
       DBMS_METADATA.GET_DDL(&IND) as IND_DDL,
       DBMS_METADATA.GET_DDL(&MVIEW) as MV_DDL
  from dual;

--Extract DDL in a format

set lines 200 pages 1000
col DDLS for a100
set numwidth 50
set long 100000000
def IND="'INDEX'"
def TAB="'TABLE'"
def MVIEW="'MATERIALIZED_VIEW'"
def IND="'INDEX','XPK_XTBL1'"
def TAB="'TABLE','XTBL'"
def MVIEW="'MATERIALIZED_VIEW','MVSAL'"
select '(TAB_DDL)~~~~~~~~~~~~~~~~~~~~~~~~~'||DBMS_METADATA.GET_DDL(&TAB)||'' as DDLS from dual
 union all
select '(IND_DDL)~~~~~~~~~~~~~~~~~~~~~~~~~'||DBMS_METADATA.GET_DDL(&IND)||'' from dual
 union all
select '(MV_DDL)~~~~~~~~~~~~~~~~~~~~~~~~~'||DBMS_METADATA.GET_DDL(&MVIEW)||'' from dual;