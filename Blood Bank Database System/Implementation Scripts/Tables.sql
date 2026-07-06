create database blood_bank;
use blood_bank;

-- Tables
CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Staff (
    person_id INT PRIMARY KEY,
    role ENUM('Employee', 'Admin') NOT NULL,
    status ENUM('Active', 'Inactive') NOT NULL,
    CONSTRAINT fk_staff_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Donor (
    person_id INT PRIMARY KEY,
    CONSTRAINT fk_donor_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Contact (
    person_id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    whatsapp_numener VARCHAR(20) NULL,
    phone_number VARCHAR(20) NOT NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    CONSTRAINT fk_contact_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Attendace (
    person_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time_in TIME NOT NULL,
    time_out TIME NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    CONSTRAINT fk_attendance_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Document (
    person_id INT PRIMARY KEY,
    photo_url VARCHAR(100) NULL UNIQUE,
    national_id_url VARCHAR(100) NULL UNIQUE,
    contract_url VARCHAR(100) NULL UNIQUE,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    CONSTRAINT fk_document_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Address (
    person_id INT PRIMARY KEY,
    street VARCHAR(60) NULL,
    distric VARCHAR(60) NOT NULL,
    province VARCHAR(60) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_address_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Donation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_donation_donor FOREIGN KEY (donor_id)
        REFERENCES Donor (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Test_Result (
    donation_id INT PRIMARY KEY,
    is_eligible BOOLEAN NOT NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    CONSTRAINT fk_test_result_donation FOREIGN KEY (donation_id)
        REFERENCES Donation (id)
        ON DELETE CASCADE
);
create table Blood_Group(
	group_code varchar(10) primary key,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);
CREATE TABLE Blood_unit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    donation_id INT NOT NULL,
    group_code VARCHAR(10) NOT NULL,
    volume DECIMAL(10 , 2 ) NOT NULL,
    status ENUM('Available', 'Issued', 'Discarded'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_blood_unit_donation FOREIGN KEY (donation_id)
        REFERENCES Donation (id),
    CONSTRAINT fk_blood_unit_group FOREIGN KEY (group_code)
        REFERENCES Blood_Group (group_code)
);
create table Request_Sender(
	id bigint auto_increment primary key,
    sender_name varchar (100) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);
CREATE TABLE Blood_Request (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_code VARCHAR(10) NOT NULL,
    request_sender_id BIGINT NOT NULL,
    date DATE NOT NULL,
    status ENUM('Rejected', 'Accepted', 'Pending'),
    number_of_units INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_blood_request_group FOREIGN KEY (group_code)
        REFERENCES Blood_Group (group_code),
    CONSTRAINT fk_blood_request_sender FOREIGN KEY (request_sender_id)
        REFERENCES Request_Sender (id)
);
CREATE TABLE Blood_Request_Unit (
    unit_id INT NOT NULL,
    request_id INT NOT NULL,
    PRIMARY KEY (unit_id , request_id),
    CONSTRAINT fk_unit_requsted FOREIGN KEY (unit_id)
        REFERENCES Blood_Unit (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_request FOREIGN KEY (request_id)
        REFERENCES Blood_Request (id)
        ON DELETE CASCADE
);



