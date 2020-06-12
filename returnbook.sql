create OR REPLACE procedure retrn(book_id varchar2, mem_id number)
is
fine number(20);
memid number(20);
retrn_date date not null := '30-AUG-16';
dat varchar2(5);
dd date;
begin
select mem_no into memid from trans where mem_no = mem_id and book_no=book_id;
update trans set return_date='30-AUG-16' where book_no=book_id and mem_no=memid;
select due_date into dd from trans where book_no=book_id and mem_no=memid;
fine := (retrn_date - dd)*5;
dbms_output.put_line('Fine is '||fine);
update member set total_fine = fine where mem_no=memid;
select to_char(SYSDATE,'DY') into dat from dual;
if dat = 'SUN'
then
dbms_output.put_line('It is '||to_char(SYSDATE,'DAY')||' so you cannot return book.');
end if;
if dat = 'SAT'
then
dbms_output.put_line('It is '||to_char(SYSDATE,'DAY')||' so you cannot return book.');
end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('There is no book issued to this member.');
end;
/
