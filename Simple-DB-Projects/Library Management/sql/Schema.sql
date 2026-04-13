create database Library_Management;
use Library_Management;

CREATE TABLE Books (
    book_ISBN VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(100) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_publication_year YEAR,
    book_bublisher VARCHAR(100),
    book_edition VARCHAR(20) NOT NULL,
    book_genra VARCHAR(30) NOT NULL,
    book_price DECIMAL(10 , 2 ) NOT NULL CHECK (book_price >= 0),
    is_availabil BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_first_name VARCHAR(100) NOT NULL,
    member_last_name VARCHAR(100) NOT NULL,
    member_email VARCHAR(100) NOT NULL UNIQUE,
    membership_type ENUM('Basic', 'Standard', 'Premium') NOT NULL DEFAULT 'Basic',
    member_address TEXT,
    member_phone_number VARCHAR(10) NOT NULL CHECK (CHAR_LENGTH(member_phone_number) = 10),
    membership_status ENUM('Active', 'Expired') NOT NULL DEFAULT 'Active'
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_ISBN VARCHAR(20) NOT NULL,
    book_issue_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    book_return_date DATE,
    is_returned BOOLEAN NOT NULL DEFAULT FALSE,
    late_return_fine DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (member_id)
        REFERENCES Members(member_id),
    FOREIGN KEY (book_ISBN)
        REFERENCES Books(book_ISBN),
    CHECK (late_return_fine >= 0),
    CHECK (book_return_date IS NULL OR book_return_date >= DATE(book_issue_date))
);

CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_first_name VARCHAR(100) NOT NULL,
    staff_last_name VARCHAR(100) NOT NULL,
    staff_login_time TIME NOT NULL,
    staff_logout_time TIME NOT NULL,
    staff_role ENUM('Admin', 'Employee') NOT NULL DEFAULT 'Employee',
    staff_working_days VARCHAR(100) NOT NULL DEFAULT 'Saturday-Thursday',
    staff_working_hours VARCHAR(100) NOT NULL DEFAULT '7am-5pm',
    CHECK (staff_logout_time > staff_login_time)
);

