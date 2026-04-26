## Scenario
### Library Management Database System
The library management system efficiently manages the library operations. In this database system, we store information about books, book borrowers, and library staff, and so on. 

The main objective of this database design project idea is help to 
- Keep a record of the books available in the library 
- Automate the process of book lending and returns
- Assisting easily in book searches and availability checks
- It also helps to keep a record of the staff details and the fines paid by late returners 

---

## Conceptual Design

### Domain Objects and Their Attributes

- **Address**
    - province 
    - district 
    - street 
    - house_number 
- **Person**
    - first_name
    - last_name
- **Author**
    - date_of_birth
- **Member**
    - email 
    - membership_type: values:Basic/Standard/Premium
    - phone_number 
    - membership_status: values:Active/Expired
- **Staff**
    - role: values:Admin/Employee
- **Publisher**
    - name
    - establish_year 
- **Genre**
    - name 
    - description 
- **Book**
    - isbn 
    - title 
    - publication_year 
    - edition 
    - price 
- **Book_Transaction**
    - book_issue_date 
    - due_date 
- **Fine**
    - amount 
- **Schedule**
    - day_of_week 
    - start_time 
    - end_time 
- **Log**
    - login_time
    - logout_time

### Relationships Between Domain Objects
- Every Author is a Person (1:1)
- Every Staff is a Person (1:1)
- Every Member is a Person (1:1)
- Every Member has an Address (1:1)
- Every Staff has an Address (1:1)
- Every Book is published by a Publisher (1:N)
- Every Book fits in a Genre (1:N)
- Every Book has Many Author and Each Author may have written many Books (M:N)
- A Member makes Transactions (1:N)
- A Book is involved in Transactions (1:N)
- A Transaction may generate a Fine (0..1)
- Every Staff has Schedules (1:N)
- Every Staff has Logs (1:N)

### Entity Relationship Diagram (ERD)

![ERD](assets/ERD.png)

### Use Case Queries
- **Staff Queries**
    - Full Staff Profile by id: Person + Staff + Address
    - List all Staff with full profile, supports(sorting & pagination)
    - List Staff Logs, supports(sorting & pagination)
    - List Staff Schedules, supports(sorting & pagination)
    - Search Staff by fist name/last name, supports(sorting & pagination) 

- **Member Queries**
    - Full Member Profile by id/email: Person + Member + Address
    - List all Member with full Profile, supports(sorting & pagination)
    - List all Member transactions, supports(sorting & pagination)
    - List all Member fines, supports(sorting & pagination)
    - List Members based on membership type, supports(sorting & pagination)
    - List Members based on membership status, supports(sorting & pagination)
    - Search Member by first name/last name, supports(sorting & pagination)

- **Book Queries**
    - Full Book Profile by isbn: Book, Authors, Genre, Publisher
    - List all Books with full profile, supports(sorting & pagination)
    - List all book transactions, supports(sorting & pagination)
    - List Books of an Author, supports(sorting & pagination)
    - List Authors of a Book, supports(sorting & pagination)
    - List Books based on publisher, supports(sorting & pagination)
    - List Books based on genre, supports(sorting & pagination)
    - List Books based on publication year, supports(sorting & pagination)
    - List Books based on price range, supports(sorting & pagination)
    - List all available Books, supports(sorting & pagination)
    - Search Book by title, supports(sorting & pagination)

- **Other Queries**
    - Full Profile of Author by id: Person + Author
    - List all Authors with full profile, supports(sorting & pagination)
    - List all Publishers, supports(sorting & pagination)
    - List all Genres, supports(sorting & pagination)
    - List all Transactions, supports(sorting & pagination)
    - List all Fines, supports(sorting & pagination)
    - List all unpaied/Paid Fines,supports(sorting & pagination)
    - List all Schedules, supports(sorting & pagination)
    - List all Logs, supports(sorting & pagination)
    - Search Author by first name/last name, supports(sorting & pagination) 
    - Search Publisher by id/name, supports(sorting & pagination)
    - Search Genre by id/name, supports(sorting & pagination)

- **Dashboard Queries**
    - **Core**
        - Total Authors
        - Total Members
        - Total Publishers
        - Total Genres
        - Total Books
        - Total Transactions
        - Sum of Fines
        - Total available Books
        - Total unavailable Books
        - Total unpaid Fines
        - Min Books Price
        - Max Books Price
        - Average Books Price
        - Percentage/ratio of Members membership types
        - Percentaeg/ratio of Members membership status
        - Percentage/ration of Book availablity
        - Distribution of Books Price
        - Variance of Books Price
        - Standard Deviation of Books Price
        - Total books issued per month
    - **Segmented**
        - Total Members per province
        - Total Members per membership type
        - Total Members per membership status
        - Total Books per publisher
        - Total Books per genre
        - Total Books available
        - Total Books unavailable
        - Total Books per Author
        - Total Transaction per Member
        - Total Transaction per Book
        - Total Logs per Staff
        - Total Schedule per Staff
    - **Ranking**
        - Top 5 province with most Members
        - Top 3 Authors with most Books
        - Top 3 Genre with most Books
        - Top 3 Publisher with most Books
        - Top 10 Members with most Transactions
        - Top 10 Books with most Transactions
        - Top 3 Staff with most Schedules 
    - **Comparative** 
        - Compare province based on their total Members
        - Compare membership types by their total of Transactions
        - Compare Genre based on their Transactions

---

## Logical Design

### Tables
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
    - edition (number, not nullable)
    - price (Decimal, not null, price > 0)
    - is_available (boolean, not null, default: true)
    - created at (timestamp)
    - update at (timestamp)

- **Book_Author**
    - book isbn (text, not null, FK -> Book.ISBN)
    - author id (number, not null, FK -> Authors.id)
    - PK (book isbn, author id)

- **Book_Transaction**
    - id (PK, surrogate key)
    - member id (number, not null, FK -> Members.id) 
    - book isbn (text, not null, FK -> Books.ISBN)
    - book issue date (date, not null, default: current date)
    - due_date (date, not null)
    - is returned (boolean, not null, default: false)
    - created at (timestamp)
    - update at (timestamp)

- **Fine**
    - book transaction id (PK, FK -> Transactions.id)
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
    - logout time (datetime, nullable, logout time > login time)
    - created at (timestamp)
    - update at (timestamp)


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

## Physical Design 

### Indexing Strategy
In addition to automatically created indexes, the following indexes are defined to optimize Use Case Queries performance

- **Address Table**
    - Composite index on (province, district, street)  
- **Person Table**
    - Composite index on (firstname, last name)  
- **Book Table**
    - Index on genre id 
    - Index on publisher id  
    - Index on title 
- **Book_Author Table**
    - Index on author id: This index ensures optimized queries when filtering by author id alone
- **Book_Transaction Table**
    - Index on member id  
    - Index on book isbn    
    - Composite index on (member id, is returned): Supports queries identifying returned vs. unreturned books per member.
    - Composite index on (book isbn, is returned): Optimizes retrieval of return status for specific books.
- **Schedule Table**
    - Index on staff id
- **Logs Table**
    - Index on staff id

### Table Partitioning Strategy
In this database, no tables require partitioning due to data size; however, for learning purposes, partitioning strategies can be applied as follow based on their access patterns. 
Since these columns are not part of the primary key, MySQL does not support this partitioning, but some DBMSs like PostgreSQL can handle it. 
- **Address Table**
    - Partitioned by province: Supported in PostgreSQL, but not in MySQL.
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
- **Transaction Table**
    - Partitioned by book issue date
- **Log Table**
    - Partitioned by login time

- **Admin**
    - Has full system privileges and can create, read, update, and delete all data across the system.
- **Employee**
    - Has restricted access, Cannot manage staff, log, and schedul.

---

## Implementation Phase

### Logical Data Views
To simplify data retrieval for use case queries that require joins, create views.
- **Staff Views**
    - Full Staff Profile: Person + Staff + Address
    - Staff Logs: Person + Staff + Log
    - Staff Schedules: Person + Staff + Schedule
- **Member Views**
    - Full Member Profile: Person + Member + Address
    - Member Fines: Fine + Transaction + Member + Person
    - Member Transactions: Book_Transaction + Member + Book
- **Book Views**
    - Book Details: Book + Publisher + Genre
    - Book Authors: Book_Author + Person
    - Full Author Profile: Person + Author

### Database Utility Functions
Use stored functions as reusable helper functios for calculations in use case queries specifically Dashboard Queries that require computed results.
For simple calculations don’t need SQL functions and are better written directly inside queries.
- **Member Total Fine Function**
- **Member Transaction Count Function** 
- **Member Active Status Function**
- **Book Availability Check Function**
- **Transaction Overdue Check Function**

### Transactional Operations
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

### Transactional Procedure Layer
For each Transaction define a stored procedure
- Issue Book Procedure
- Return Book Procedure
- Fine Payment Procedure
- Member Registration Procedure
- Staff Registration Procedure
- Author Registration Procedure

### Event-Driven Database Rules
Use Triggers to automatically run the events of Transactions.
- **Book Issue Trigger**
    - Mark Book as unavailable
- **Book Return Triggers**
    - Mark Book as available

### Role-Based Access Control
