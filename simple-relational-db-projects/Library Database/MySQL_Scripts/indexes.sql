use Library_Management;

-- Indexes
create index idx_address_district_street_house_number
on Address(district, street, house_number);

create index idx_person_firstname_lastname
on Person (first_name, last_name);

create index idx_book_title
on Book (title);

create index idx_attendance_date
on Attendance (date);

create index idx_customer_status
on Customer (status);

create index idx_borrow_duedate_returndate
on Borrow (due_date, return_date);




