create or replace package BODY uwem_first_pkg as


procedure XYZ(p_name in varchar2, p_age in number, p_add in varchar2, p_sal in number) is 
counter number  :=0;
v_id    number;

begin
select max(id) into v_id from customer_b;
v_id:=v_id+1;
insert into customer_b --(id,NAME,AGE,ADDRESS,SALARY)
values(v_id, p_name,p_age,p_add,p_sal);

exception
when others
then 
raise_application_error(-20000, 'Error saving Document '||SQLERRM||' '||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
end;


END;
