CREATE OR REPLACE TRIGGER incr_trigger
AFTER INSERT OR UPDATE ON trans
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    	UPDATE book
      	SET no_of_books = no_of_books-1
      	WHERE book_no = :NEW.book_no;
	UPDATE MEMBER
      	SET no_of_books = no_of_books+1
      	WHERE mem_no = :NEW.mem_no;
  ELSIF UPDATING THEN 
       	UPDATE book
      	SET no_of_books = no_of_books+1
      	WHERE book_no = :old.book_no;
	UPDATE MEMBER
      	SET no_of_books = no_of_books-1
      	WHERE mem_no = :NEW.mem_no;
    	END IF;
END;
/
