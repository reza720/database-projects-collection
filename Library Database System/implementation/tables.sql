create database Library_Management;
use Library_Management;

-- Tables
CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Address (
    person_id INT PRIMARY KEY,
    district VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    house_number VARCHAR(20) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_address_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Document (
    person_id INT PRIMARY KEY,
    photo_url VARCHAR(200) NULL UNIQUE,
    national_id_url VARCHAR(200) NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_document_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Contact (
    person_id INT PRIMARY KEY,
    phone_number VARCHAR(15) NOT NULL,
    whatsapp_number VARCHAR(15) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_contact_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Staff (
    person_id INT PRIMARY KEY,
    role ENUM('Manager', 'Employee') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_staff_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    date DATE NOT NULL,
    time_in TIME NOT NULL,
    time_out TIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_attendance_staff FOREIGN KEY (staff_id)
        REFERENCES Staff (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Customer (
    person_id INT PRIMARY KEY,
    status ENUM('Active', 'Inactive') NOT NULL DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_customer_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Publisher (
    publisher_name VARCHAR(100) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Book (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    publisher_name VARCHAR(100) NOT NULL,
    fee SMALLINT UNSIGNED NOT NULL,
    total_copies TINYINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_name)
        REFERENCES Publisher (publisher_name)
);
create table Genre (
	genre_name varchar(100) primary key,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Book_Genre (
    book_isbn VARCHAR(20) NOT NULL,
    genre_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (book_isbn , genre_name),
    CONSTRAINT fk_book_genre_book FOREIGN KEY (book_isbn)
        REFERENCES Book (isbn),
    CONSTRAINT fk_book_genre_genre FOREIGN KEY (genre_name)
        REFERENCES Genre (genre_name)
);
CREATE TABLE Author (
    author_name VARCHAR(100) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Book_Author (
    book_isbn VARCHAR(20) NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (book_isbn , author_name),
    CONSTRAINT fk_book_author_book FOREIGN KEY (book_isbn)
        REFERENCES Book (isbn),
    CONSTRAINT fk_book_author_author FOREIGN KEY (author_name)
        REFERENCES Author (author_name)
);
CREATE TABLE Borrow (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_borrow_customer FOREIGN KEY (customer_id)
        REFERENCES Customer (person_id),
    CONSTRAINT fk_borrow_book FOREIGN KEY (book_isbn)
        REFERENCES Book (isbn)
);
CREATE TABLE Fine (
    borrow_id INT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_fine_borrow FOREIGN KEY (borrow_id)
        REFERENCES Borrow (id)
);


