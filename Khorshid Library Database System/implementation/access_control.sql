-- Create Admin user with password of (abc123) and giving full access
CREATE USER 'Admin'@'localhost'
IDENTIFIED BY 'abc123';

GRANT ALL PRIVILEGES
ON Library_Management.*
TO 'Admin'@'localhost';

-- Create an Employee user with password of (123abc) that has restricted access, cannot manage Staff, Schedule, and Log, but can manage other tables
CREATE USER 'Employee'@'localhost'
IDENTIFIED BY '123abc';

GRANT SELECT ON Library_Management.Address TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Person TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Author TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Member TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Publisher TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Genre TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Book TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Book_Author TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Book_Transaction TO 'Employee'@'localhost';
GRANT SELECT ON Library_Management.Fine TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Member
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE
ON Library_Management.Person
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE
ON Library_Management.Address
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Book
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Book_Author
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Author
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Publisher
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Genre
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Book_Transaction
TO 'Employee'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON Library_Management.Fine
TO 'Employee'@'localhost';