create or replace trigger move_trigger
before delete on trans
for each row
begin
insert into transaction_history  values(:old.book_no,:old.mem_no,:old.issue_date,:old.due_date,:old.return_date);
end;
/