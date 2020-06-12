declare
member_name varchar2(15);
member_type varchar2(20);
no varchar2(20);
id varchar2(20);
begin
member_name:='&name';
member_type:='&type';
select MAX(mem_no) into no from member;
if no is not null then
id:=no+1;
else
id:=1;
end if;
insert into member values(id,member_name,member_type,0,0);
dbms_output.put_line('Mr/Mrs/Miss. '||member_name||', your membership id is '||id);
end;
/

