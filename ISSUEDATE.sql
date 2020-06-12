create or replace procedure insert1(book_id varchar2,mem_id number)
is
a boolean default false;
b boolean default false;
c boolean default false;
d boolean default false;
mep number(4);
tep number(4);
sep number(4);
bep number(4);
mb number(4);
dat varchar2(10);
typ varchar2(10);
expiry_date date;
ddate date;


begin
select count(*) into tep from book where book_no = book_id;
if tep = 1
then
dbms_output.put_line('The book '||book_id||' exsist in the library');
else
dbms_output.put_line('The book '||book_id||' does not exsist in the library');
end if;


select count(*) into mep from member where mem_no = mem_id;
if mep = 1
then
dbms_output.put_line('The user '||mem_id||' is a member of club');
else
dbms_output.put_line('The user '||mem_id||'  is not a member of club');
end if;


select count(*) into sep from trans where book_no = book_id and mem_no = mem_id and return_date is null;
if sep = 1
then
dbms_output.put_line('The user already have this book');
end if;

select mem_type into typ from member where mem_no=mem_id;
expiry_date := add_months(ROUND(SYSDATE,'MONTH'),1);
ddate := ROUND(SYSDATE,'YEAR');
if typ='M' 
then

	if expiry_date < SYSDATE+7
	then
	a:=true;
	dbms_output.put_line('Your membership expiry date '||expiry_date||' is before due date '||SYSDATE+7);
	end if;
elsif typ='Y'
then

	if ddate < SYSDATE+7
	then
	a:=true;
	dbms_output.put_line('Your membership expiry date '||expiry_date||' is before due date '||SYSDATE+7);
	end if;
elsif typ='L'
then

	dbms_output.put_line('You have lifetime membership');

end if;


select no_of_books into mb from member where mem_no=mem_id;
if typ='M'
then 

	if mb >= 4
	then 
	b:=true;
	dbms_output.put_line('Your have reached monthly borrow limit of 4 books');
	end if;
elsif typ='Y'
then

	if mb >= 2
	then 
	b:=true;
	dbms_output.put_line('Your have reached yearly borrow limit of 2 books');
	end if;
elsif typ='L'
then

	if mb >= 6
	then 
	b:=true;
	dbms_output.put_line('Your have reached lifetime borrow limit of 6 books');
	end if;

end if;


select to_char(SYSDATE,'DY') into dat from dual;
if dat = 'SUN'
then
dbms_output.put_line('It is '||to_char(SYSDATE,'DAY')||' so cannot issue book.');
elsif dat = 'SAT'
then
dbms_output.put_line('It is '||to_char(SYSDATE,'DAY')||' so cannot issue book.');
else
c:=true;
dbms_output.put_line('It is '||to_char(SYSDATE,'DAY')||' so can issue book.');
end if;

select no_of_books into bep from book where book_no=book_id;
if bep >= 1
then
d:= true;
	dbms_output.put_line(' The book is available in the library ');
end if;


if (tep is not null and mep is not null and b is not null and a is not null and  d is not null and c is not null)
then
insert into trans values(book_id,mem_id,SYSDATE,SYSDATE+7,NULL);
dbms_output.put_line('Issuing book to member '||mem_id);
end if;		

EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('Sorry book does not exsist in the library');

end;
/
