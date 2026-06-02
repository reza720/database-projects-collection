use library_management;

-- Direct Data Insertion: Inserting data directly into tables

-- Inserting 5 Members; Before insertting members, we need to insert their supertypes(Person) and addresses
insert into Person(first_name, last_name)
values 
("Ali Reza", "Panahi"),
("Dawood","Farhi"),
("Bashir","Noori"),
("Isac","Jawid"),
("Ali","Khairi");

insert into Address(province, district, street, house_number)
values
("Kabul","Karti-e-Char","1st", "B34"),
("Kabul","Karti-e-Naw","3th", "D4"),
("Ghazni","Cinama","13th", "C3"),
("Parwan","Char-e-Kar","3th", "A56"),
("Zabul","Qalat","Kabul Highway", "A12");

insert into Member(id, email, membership_type, address_id, phone_number, membership_status)
values
(1, "AliReza@gmail.com", "Basic", 1, "0093768927654", "Active"),
(2, "Dfarhi@gmail.com", "Standard", 2, "0093760907654", "Active"),
(3, "BashirNoor@gmail.com", "Basic", 3, "0093798907654", "Active"),
(4, "JawidIsac@gmail.com", "Standard", 4, "0096768907654", "Active"),
(5, "AliKh@gmail.com", "Premium", 5, "0093768450794", "Active");


-- Inserting 3 Staff; first, we need to add each staff's supertype (Person) and address. Also, we add 1 log and 1 schedule for each staff

insert into Person(first_name, last_name)
values
("Nowrooz", "Rahi"),
("Ahmad","Jalal"),
("Oshur","Ahmadi");
select * from Address;
insert into Address(province, district, street, house_number)
values
("Kabul","Barchi","12th","G12"),
("Herat","Central City","11th","T34"),
("Baghlan","Poli-e-Khomri Naw","4th","F3");

insert into Staff(id, address_id, role)
values
(6, 6, "Admin"),
(7, 7, "Employee"),
(8, 8, "Employee");

insert into Log(staff_id)
values (8);

insert into Schedule(staff_id, day_of_week, start_time, end_time)
values (7, "Monday", "7:00:00", "16:00:00");


-- Inserting 6 Books; before inserting books, we must add publishers and genres. We also add a few authors with their supertype (Person), and after insterting Books, populate the book_author relationship table as well

insert into Genre(name, description)
values
("Philosophy", "Western and eastern Philosophical books"),
("Business", "Most books are classic business books"),
("Religion", "Only Islamic Books"),
("Technology", "IT and Software engineering Books");

insert into Publisher(name)
values
("Mooj"),
("Khorishid Islam"),
("Qube");

insert into Book(isbn, title, publisher_id, genre_id, publication_year, edition, price, is_available)
values
("9781000000001", "Ib Sina Cause and Existence", 1, 1, "2003", 1, 1200, true),
("9781000000002", "Imam Al Ghazali", 1, 1, "2012", 1, 1550, true),
("9781000000003", "Ibn Rushid and Ibn Sina on Reasoning", 1, 1, "1998", null, 1000, true),
("9781000000004", "Java Explained", 3, 4, "2023", 4, 500, true),
("9781000000005", "Python 3", 3, 4, "2012", 2, 300, true),
("9781000000006", "TCP/IP", 3, 4, "2025", 1, 1200, true),
("9781000000007", "Hadith 3", 2, 3, null, null, 1400, true),
("9781000000008", "Quran Stories", 2, 3, null, null, 900, true),
("9781000000009", "AFG Business Intro", 1, 2, "2023", 1, 700, true),
("9781000000010", "Modern Business", 1, 2, "2025", 2, 1000, true);

insert into Person(first_name, last_name)
values
("Jamal", "Khodaddi"),
("Hussain", "Baqeri"),
("Baqir", "Rezaei"),
("Rasul", "Naderi"),
("Shamshad", "Osmani"),
("Jabar", "Omari"),
("Yasin", "Khalid"),
("Sarwar", "Ashtari"),
("Hassan", "Parwani"),
("Mahdi", "Bamyani");

insert into Author(id, date_of_birth)
values
(9, null),
(10, null),
(11, "1970-06-23"),
(12, null),
(13, "1980-03-12"),
(14, null),
(15, null),
(16, null),
(17, null),
(18, "1950-11-28");

insert into Book_Author(book_isbn, author_id)
values
("9781000000001", 13),
("9781000000001", 15),
("9781000000002", 9),
("9781000000003", 15),
("9781000000003", 13),
("9781000000003", 9),
("9781000000004", 10),
("9781000000005", 10),
("9781000000005", 11),
("9781000000005", 12),
("9781000000006", 14),
("9781000000007", 16),
("9781000000008", 17),
("9781000000009", 18),
("9781000000010", 18);

-- Inserting 7 Book_Transactions; also add fines for some of them
insert into Book_Transaction(member_id, book_isbn, due_date, is_returned)
values
(1,"9781000000001", "2026-12-29", false),
(1,"9781000000002", "2026-10-29", false),
(1,"9781000000003", "2026-11-29", false),
(1,"9781000000004", "2026-12-29", false),
(1,"9781000000005", "2026-9-29", false),
(1,"9781000000006", "2026-6-29", false),
(1,"9781000000007", "2026-7-29", false);

insert into Fine(book_transaction_id, amount, is_paid)
values
(7, 100, false),
(6, 50, false);



-- Transactional Data Insertion: Inserting data through stored procedures with transactions