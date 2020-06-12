
declare

book_name varchar2(50);

author varchar2(20);

price varchar2(20);

no_of_books number(5);

book_id varchar2(20);

begin

book_id:='&bookno';

book_name:='&bknam';

author:='&auth';

price:=&tot;

no_of_books:=&no;



insert into book values(book_id,book_name,author,price,no_of_books);

end;

/