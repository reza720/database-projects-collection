Use library_management;

-- Set the Book is_available to false after the book is added to Book_Transaction
DELIMITER $$
create trigger trg_book_issue
after insert on Book_Transaction
for each row
begin
	update Book
    set is_available=false
    where isbn=NeW.book_isbn;
end $$
DELIMITER ;

-- Set the Book is_available to true after the book is returned
DELIMITER $$
create trigger trg_book_return
after update on Book_Transaction
for each row
begin 
	if NEW.is_returned = true then
		update Book
        set is_available = true
        where isbn= NEW.book_isbn;
	end if;
end $$ 
DELIMITER ;







