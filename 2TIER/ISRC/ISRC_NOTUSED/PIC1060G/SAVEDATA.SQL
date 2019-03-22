drop procedure mod_pimpmas;
/
create procedure mod_pimpmas(a in varchar2)
as begin
   select * from pimpmas where empno = a;
end;
/
