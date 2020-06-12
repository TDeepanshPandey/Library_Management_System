-- table member
create table member(mem_no varchar2(20) primary key, mem_name varchar2
(20) not null, mem_type varchar2(20), no_of_books number(4), total_fine number(4));

-- table book
create table book(book_no varchar2(20) primary key, book_name varchar2(20) not null , author varchar2(20), price varchar2(20), no_of_books number(4));

-- table trans
create table trans(book_no varchar2(20), mem_no varchar2(20),issue_date date,due_date date ,return_date date, constraint bid_fkey FOREIGN KEY (book_no) REFERENCES book(book_no),constraint mid_fkey FOREIGN KEY (mem_no) REFERENCES member(mem_no));

--table transaction history
create table transaction_history(book_no varchar2(20), mem_no varchar2(20),issue_date date,due_date date ,return_date date, constraint bid_fkey1 FOREIGN KEY (book_no) REFERENCES book(book_no),constraint mid_fkey1 FOREIGN KEY (mem_no) REFERENCES member(mem_no))
/


/
