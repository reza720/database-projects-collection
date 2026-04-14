## Scenario
### Library Management Database System
The library management system efficiently manages the library operations. In this database system, we store information about books, book names and numbers, details of the book borrower and library staff details, and so on. 

The main objective of this database design project idea is help to 
- Keep a record of the books available in the library 
- Automate the process of book lending and returns
- Assisting easily in book searches and availability checks
- It also helps to keep a record of the staff details and the fines paid by late returners 

## Logical Design
### Entities and attriutes:

- **Persons**
    - id (surrogate key)
    - first name (text, not null)
    - last name (text, not null)

- **Authors**
    - id (number, PK, FK -> Persons.id)
    - date of birth (date, nullable)

- **Members**
    - id (number, PK, FK -> Persons.id)
    - email (text, not null, unique)
    - membership type (values:Basic, Standard, Premium, not null, default: Basic)
    - address id (number, not null, FK -> Addresses.id)
    - phone number (text, not null, lenght = 12)
    - membership status (values:Active, Expired, not null, default: Active)

- **Staff**
    - id (number, PK, FK -> Persons.id)
    - address id (number, not null, FK -> Addresses.id)
    - role (enum:Admin, Employee, not null, default:Employee)

- **Publishers**
    - id (surrogate key)
    - name (text, unique, not null)
    - stablish year (year date, nullable)

- **Genras**
    - id (surrogate key)
    - name (text, not null, unique)
    - description (text, nullable)

- **Books**
    - ISBN (text, PK)
    - title (text, not null)
    - publisher id (number, not null, FK -> Publishers.id)
    - genra id (number, not null, FK -> Genras.id)
    - publication year (year, nullable)
    - edition (text, not null)
    - price (Decimal, not null, price > 0)
    - is_availabil (boolean, not null, default: true)

- **Book_Authors**
    - book ISBN (text, not null, FK -> Books.ISBN)
    - author id (number, not null, FK -> Authors.id)
    - Pk (book ISBN, author id)

- **Addresses**
    - id (surrogate key)
    - province (text, not null)
    - district (text, not null)
    - street (text, not null)
    - house number (text, not null)

- **Transactions**
    - id (surrogate key)
    - member id (number, not null, FK -> Members.id) 
    - book ISBN (text, not null, FK -> Books.ISBN)
    - book issue date (date, not null, default: current date)
    - book return date (date, nullable)
    - is returned (boolean, not null, default: false)

- **Fines**
    - transiction id (PK, FK -> Transactions.id)
    - amount (decimal, not null, default: 0)
    - is paid (boolean, not null, default:false)

- **Scheduals**
    - id (surrogate key)
    - staff id (number, not null, FK -> Staff.id)
    - work day start (enum: days of week, not null, default:Starday)
    - day of week(values: days of week, not null)
    - start time (time, not null)
    - end time (time, not null)

- **Logs**
    - id (surrogate key)
    - staff id (number, not null, FK -> Staff.id)
    - login time (datetime, not null)
    - logout time (datetime, not null, logout time > login time)



--- Define Referential Actions
--- Define Cardinalities
--- Pass Normalization to 3NF
--- Make the ERD