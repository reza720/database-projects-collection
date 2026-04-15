## Scenario
### Library Management Database System
The library management system efficiently manages the library operations. In this database system, we store information about books, book names and numbers, details of the book borrower and library staff details, and so on. 

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

- **Logs**
    - id (PK, surrogate key)
    - staff id (number, not null, FK -> Staff.id, on delete:cascade) 
    - login time (datetime, not null)
    - logout time (datetime, not null, logout time > login time)
    - created at (timestamp)
    - update at (timestamp)

### Relationships
- Person (1) ── (1) Author
- Person (1) ── (1) Staff
- Person (1) ── (1) Member

- Member (1) ────< (N) Address
- Staff  (1) ────< (N) Address

- Publisher (1) ────< (N) Book
- Genre    (1) ────< (N) Book

- Book (M) ────< Book_Authors >──── (M) Author

- Member (1) ────< (N) Transaction
- Book   (1) ────< (N) Transaction
- Transaction (1) ──── (0..1) Fine

- Staff (1) ────< (N) Schedule
- Staff (1) ────< (N) Log

### ERD

![ERD](assets.ERD.png)

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
