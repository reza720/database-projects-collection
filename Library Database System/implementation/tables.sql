create database Library_Management;
use Library_Management;

CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    province VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    house_number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL CHECK (first_name REGEXP '^[A-Za-z ]+$'),
    last_name VARCHAR(100) NOT NULL CHECK (last_name REGEXP '^[A-Za-z ]+$'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Author (
    id INT PRIMARY KEY,
    date_of_birth DATE NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);

CREATE TABLE Member (
    id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    membership_type ENUM('Basic', 'Standard', 'Premium') DEFAULT 'Basic' NOT NULL,
    address_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL CHECK (CHAR_LENGTH(phone_number) <= 13),
    membership_status ENUM('Active', 'Expired') DEFAULT 'Active' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK (CHAR_LENGTH(phone_number) = 13),
    FOREIGN KEY (id)
        REFERENCES Person (id)
        ON DELETE CASCADE,
    FOREIGN KEY (address_id)
        REFERENCES Address (address_id)
);

CREATE TABLE Staff (
    id INT PRIMARY KEY,
    address_id INT NOT NULL,
    role ENUM('Admin', 'Employee') DEFAULT 'Employee' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id)
        REFERENCES Person (id)
        ON DELETE CASCADE,
    FOREIGN KEY (address_id)
        REFERENCES Address (address_id)
);

CREATE TABLE Publisher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    establish_year YEAR NULL
);

CREATE TABLE Genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT NULL
);

CREATE TABLE Book (
    isbn VARCHAR(30) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    publisher_id INT NOT NULL,
    genre_id INT NOT NULL,
    publication_year YEAR NULL,
    edition INT NULL CHECK (edition > 0),
    price DECIMAL(10 , 2 ) NOT NULL CHECK (price > 0),
    is_available BOOLEAN DEFAULT TRUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (publisher_id)
        REFERENCES Publisher (id),
    FOREIGN KEY (genre_id)
        REFERENCES Genre (id)
);

CREATE TABLE Book_Author (
    book_isbn VARCHAR(30) NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_isbn , author_id)
);

CREATE TABLE Book_Transaction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_isbn VARCHAR(30) NOT NULL,
    book_issue_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    due_date DATE NOT NULL,  
    is_returned BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES Member(id),
    FOREIGN KEY (book_isbn) REFERENCES Book(isbn)
);

CREATE TABLE Fine (
    book_transaction_id INT PRIMARY KEY,
    amount DECIMAL(10 , 2 ) DEFAULT 0 NOT NULL,
    is_paid BOOLEAN DEFAULT FALSE NOT NULL,
    FOREIGN KEY (book_transaction_id)
        REFERENCES Book_Transaction (id)
);

CREATE TABLE Schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (staff_id)
        REFERENCES Staff (id)
);

CREATE TABLE Log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    login_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    logout_time DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (staff_id)
        REFERENCES Staff (id)
);


    