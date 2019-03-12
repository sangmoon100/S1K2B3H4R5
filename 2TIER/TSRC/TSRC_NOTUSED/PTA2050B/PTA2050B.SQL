select f.empno,
       f.korname,
       i.jobgun,
       f.paycl,
       f.examscore1,
       f.examscore2,
       f.examscore12,
       f.examname,
       max(f.examdate) examdate,
       i.empdate,
       i.paycldate,
       i.cpaycldate,
       i.cardate,
       i.empcode,
       c.leveli,
       c.examscore
from pihfore f, pimpmas i, forecode c,
     (
      select yearyy, empno, max(examscore12) max_score
      from
          (
           select c.yearyy yearyy, f.empno empno, f.examdate examdate, f.examscore12 examscore12
           from pimpmas i, pihfore f, forecode c
           where i.empno = f.empno
             and i.paycl = f.paycl
             and i.jobgun= c.jobgun
             and f.paycl between c.payclfr and c.paycltr
             and f.examscore12 between c.toeicfr and c.toeictr
             and decode(c.leveli,'1', '1999', f.examdate) between '1999' and '2002'
             and c.yearyy = '2001'
          )
      group by yearyy, empno
     ) max_f
where i.empno = f.empno
  and i.paycl = f.paycl
  and i.jobgun= c.jobgun
  and i.paycl between c.payclfr and c.paycltr
  and f.examscore12 between c.toeicfr and c.toeictr
  and decode(c.leveli,'1', '1999', f.examdate) between '1999' and '2002'
  and c.yearyy = '2001'
  and i.empno = max_f.empno and f.examscore12 >= max_f.max_score
group by f.empno,
       f.korname,
       i.jobgun,
       f.paycl,
       f.examscore1,
       f.examscore2,
       f.examscore12,
       f.examname,
--       f.examdate,
       i.empdate,
       i.paycldate,
       i.cpaycldate,
       i.cardate,
       i.empcode,
       c.leveli,
       c.examscore
/
