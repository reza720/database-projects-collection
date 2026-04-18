## Scenario
### Library Management Database System
The library management system efficiently manages the library operations. In this database system, we store information about books, book borrowers, and library staff, and so on. 

The main objective of this database design project idea is help to 
- Keep a record of the books available in the library 
- Automate the process of book lending and returns
- Assisting easily in book searches and availability checks
- It also helps to keep a record of the staff details and the fines paid by late returners 

---

## Logical Design

### Entities and attriutes:

- **Address**
    - address id (PK, surrogate key)
    - province (text, not null)
    - district (text, not null)
    - street (text, not null)
    - house number (text, not null)
    - created at (timestamp)
    - update at (timestamp)

- **Person**
    - id (PK, surrogate key)
    - first name (text, not null)
    - last name (text, not null)
    - created at (timestamp)
    - update at (timestamp)

- **Author**
    - id (number, PK, FK -> Person.id, on delete:cascade)
    - date of birth (date, nullable)
    - created at (timestamp)
    - update at (timestamp)

- **Member**
    - id (number, PK, FK -> Person.id, on delete:cascade)
    - email (text, not null, unique)
    - membership type (values:Basic/Standard/Premium, not null, default: Basic)
    - address id (number, not null, FK -> Addresses.id)
    - phone number (text, not null, length = 12)
    - membership status (values:Active/Expired, not null, default: Active)
    - created at (timestamp)
    - update at (timestamp)

- **Staff**
    - id (number, PK, FK -> Person.id, on delete:cascade)
    - address id (number, not null, FK -> Addresses.id)
    - role (values:Admin/Employee, not null, default:Employee)
    - created at (timestamp)
    - update at (timestamp)

- **Publisher**
    - id (PK, surrogate key)
    - name (text, unique, not null)
    - establish year (year date, nullable)

- **Genre**
    - id (PK, surrogate key)
    - name (text, not null, unique)
    - description (text, nullable)

- **Book**
    - isbn (text, PK)
    - title (text, not null)
    - publisher id (number, not null, FK -> Publishers.id)
    - genre id (number, not null, FK -> Genres.id)
    - publication year (year, nullable)
    - edition (text, not null)
    - price (Decimal, not null, price > 0)
    - is_available (boolean, not null, default: true)
    - created at (timestamp)
    - update at (timestamp)

- **Book_Author**
    - book isbn (text, not null, FK -> Book.ISBN)
    - author id (number, not null, FK -> Authors.id)
    - PK (book isbn, author id)

- **Transaction**
    - id (PK, surrogate key)
    - member id (number, not null, FK -> Members.id) 
    - book isbn (text, not null, FK -> Books.ISBN)
    - book issue date (date, not null, default: current date)
    - book return date (date, nullable)
    - is returned (boolean, not null, default: false)
    - created at (timestamp)
    - update at (timestamp)

- **Fine**
    - transaction id (PK, FK -> Transactions.id)
    - amount (decimal, not null, default: 0)
    - is paid (boolean, not null, default: false)

- **Schedule**
    - id (PK, surrogate key)
    - staff id (number, not null, FK -> Staff.id, on delete: cascade)
    - day of week (values: days of week, not null)
    - start time (time, not null)
    - end time (time, not null)
    - created at (timestamp)
    - update at (timestamp)

- **Log**
    - id (PK, surrogate key)
    - staff id (number, not null, FK -> Staff.id, on delete:cascade) 
    - login time (datetime, not null)
    - logout time (datetime, not null, logout time > login time)
    - created at (timestamp)
    - update at (timestamp)

### Relationships
- Person (1) ---- (1) Author -> One person is exactly one author, and one author is exactly one person.
- Person (1) ---- (1) Staff -> One person is exactly one staff member, and one staff member is exactly one person.
- Person (1) ---- (1) Member -> One person is exactly one member, and one member is exactly one person.

- Member (1) ----< (N) Address -> One member can have many addresses, but each address belongs to one member.
- Staff (1) ----< (N) Address -> One staff member can have many addresses, but each address belongs to one staff member.

- Publisher (1) ----< (N) Book -> One publisher can publish many books, but each book belongs to one publisher.
- Genre (1) ----<  (N) Book -> One genre can include many books, but each book belongs to one genre.

- Book (M) ----< Book_Authors >---- (M) Author -> One book can have many authors, and one author can write many books (many-to-many relationship resolved using a junction table).

- Member (1) ----< (N) Transaction -> One member can make many transactions, but each transaction belongs to one member.
- Book (1) ----< (N) Transaction -> One book can appear in many transactions, but each transaction is linked to one book.
- Transaction (1) ---- (0..1) Fine -> A transaction may or may not have a fine, but each fine belongs to exactly one transaction.

- Staff (1) ----< (N) Schedule -> One staff member can have many schedules, but each schedule belongs to one staff member.
- Staff (1) ----< (N) Log -> One staff member can have many logs, but each log belongs to one staff member.

### Entity Relationship Diagram (ERD)

![ERD](assets/ERD.png)

### Normalization Summary
This Design has pass three normal form of normalization  
- **1NF:**
    - Each table has a primary key that uniquely identifies each row
    - All attributes contain atomic/indivisible values
    - There are no repeating groups attributes

- **2NF:**
    - Already in 1NF
    - No partial dependencies exist in any table

- **3NF:**
    - Already in 2NF
    - There are no transitive dependencies between non-key attributes


---


## Physical Design Considerations

### Defining Use Case Queries
- **Staff Queries**
    - Full Staff Profile: Person + Staff + Address
    - List all Staff with full profile
    - List Staff Logs
    - List Staff Schedules
- **Member Queries**
    - Full Member Profile: Person + Member + Address
    - List all Member with full Profile
    - List all Member transactions
    - List all Member fines
    - List Members based on membership type
    - List Members based on membership status
- **Book Queries**
    - Full Book Profile: Book, Authors, Genre, Publisher
    - List all Books with full profile
    - List all book transactions
    - List Books of an Author
    - List Authors of a Book
    - List Books based on publisher
    - List Books based on genre
    - List Books based on publication year
    - List Books based on price range
    - List all available Books
- **Other Queries**
    - Full Profile of Author: Person + Author
    - List all Authors with full profile
    - List all Publishers
    - List all Genres
    - List all Transactions
    - List all Fines
    - List all unpaied/Paid Fines
    - List all Schedules
    - List all Logs


### Indexing
In addition to automatically created indexes, the following indexes are defined to optimize query performance

- **Address Table**
    - Composite index on (city, district, street)  
- **Person Table**
    - Composite index on (firstname, last name)  
- **Book Table**
    - Index on genre id 
    - Index on publisher id  
    - Index on title 
- **Book_Author Table**
    - Index on author id: This index ensures optimized queries when filtering by author id alone
- **Transaction Table**
    - Index on member id  
    - Index on book isbn    
    - Composite index on (member id, is returned): Supports queries identifying returned vs. unreturned books per member.
    - Composite index on (book isbn, is returned): Optimizes retrieval of return status for specific books.
- **Schedule Table**
    - Index on staff id
- **Logs Table**
    - Index on staff id

### Partitioning of Large Tables
In this database, no tables require partitioning due to data size; however, for learning purposes, partitioning strategies are applied to selected tables based on their access patterns.
- **Address Table**
    - Partitioned by province
- **Author Table**
    - Partitioned by date of birth
- **Member Table**
    - Partitioned by membership status
    - Partitioned by membership type
- **Staff Table**
    - Partitioned by role
- **Book Table**
    - Partitioned by publisher id
    - Partitioned by genre id
    - Partitioned by publication year
    - Partitioned by is available
- **Transaction Table**
    - Partitioned by book issue date
- **Log Table**
    - Partitioned by login time

### Defining Views
- **member_details_view**
    - Tables involved: Person, Member, and Address
- **staff_details_view**
    - Tables involved: Person, Staff, and Address
- **author_details_view**
    - Tables involved: Person and Author
- **book_details_view**
    - Tables involved: Book, Publisher, Genre, Book_Author, Author, and Person
- **transaction_details_view**
    - Tables involved: Transaction, Member, Person, and Book
- **fine_details_view**
    - Tables involved: Fine, Transaction, Member, Person, and Book
- **staff_activity_view**
    - Tables involved: Staff, Person, Logs, and Schedule

### ACID Transactions
- **Issue Book Transaction**
    - Check book is available, Insert into Transaction, and Set is available = false
- **Return Book Transaction**
    - Update Transaction (set return date, is returned = true) and Set is available = true
- **Fine Payment Transaction**
    - Set is paid = true
- **Member Registration Transaction**
    - Add Person, Member, and Address
- **Staff Registration Transaction**
    - Add Person, Staff, and Address
- **Author Registration Transaction**
    - Add Person and Author

### Controlling Access of Users
- **Admin**
    - Has full system privileges and can create, read, update, and delete all data across the system.
- **Employee**
    - Has restricted access, Cannot manage staff, log, and schedul.
