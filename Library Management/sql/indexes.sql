use Library_Management;

-- Address Index
create index idx_address_location
on Address(province, district, street);

-- Person Index
create index idx_person_fullname
on Person (first_name, last_name);

-- Book Indexes
create index idx_book_genre
on Book (genre_id);

create index idx_book_publisher
on Book (publisher_id);

create index idx_book_title
on Book (title);

-- Book_Author Index
create index idx_book_author
on Book_Author (author_id);

-- Book_Transaction Indexes
create index idx_book_transaction_member
on Book_Transaction (member_id);

create index idx_book_transaction_book_isbn
on Book_Transaction (book_isbn);

create index idx_has_member_returned
on Book_Transaction (member_id, is_returned);

create index idx_is_book_returned
on Book_Transaction (book_isbn, is_returned);

-- Schedule Index
create index idx_schedule_staff
on Schedule (staff_id);

-- Log Index
create index idx_log_staff
on Log (staff_id);



