create database Laboratory;
use laboratory;

-- Tables
CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_nme VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Contact (
    person_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    whatsapp_number VARCHAR(20) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (person_id),
    CONSTRAINT fk_contact_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Staff (
    person_id INT NOT NULL,
    role ENUM('Supervisor', 'Technician') NOT NULL,
    PRIMARY KEY (person_id),
    CONSTRAINT fk_staff_person FOREIGN KEY (person_id)
        REFERENCES person (id)
        ON DELETE CASCADE
);
CREATE TABLE Attendance (
    staff_id INT NOT NULL,
    date DATE NOT NULL,
    time_in TIME NOT NULL,
    time_out TIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (staff_id),
    CONSTRAINT fk_attendace_staff FOREIGN KEY (staff_id)
        REFERENCES Staff (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Document (
    staff_id INT NOT NULL,
    photo_url VARCHAR(255) NULL UNIQUE,
    national_id_url VARCHAR(255) NULL UNIQUE,
    contract_url VARCHAR(255) NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (staff_id),
    CONSTRAINT fk_document_staff FOREIGN KEY (staff_id)
        REFERENCES Staff (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Address (
    staff_id INT NOT NULL,
    street VARCHAR(100) NULL,
    district VARCHAR(100) NULL,
    province VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (staff_id),
    CONSTRAINT fk_address_staff FOREIGN KEY (staff_id)
        REFERENCES Staff (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Patient (
    person_id INT PRIMARY KEY,
    CONSTRAINT fk_patient_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Test_Order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    order_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NULL,
    updated_by INT NULL,
    CONSTRAINT fk_order_patient FOREIGN KEY (patient_id)
        REFERENCES Patient (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Requested_Test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    test_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NULL,
    updated_by INT NULL,
    CONSTRAINT fk_requested_test_order FOREIGN KEY (order_id)
        REFERENCES Test_Order (id)
        ON DELETE CASCADE
);
CREATE TABLE Test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NULL,
    requested_test_id INT NULL,
    date DATE NOT NULL,
    time TIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NULL,
    updated_by INT NULL,
    CONSTRAINT fk_test_staff FOREIGN KEY (staff_id)
        REFERENCES Staff (person_id),
    CONSTRAINT fk_test_requested_test FOREIGN KEY (requested_test_id)
        REFERENCES Requested_Test (id)
        ON DELETE CASCADE
);
CREATE TABLE Test_Result (
    test_id INT NOT NULL,
    result_file_url VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NULL,
    updated_by INT NULL,
    PRIMARY KEY (test_id),
    CONSTRAINT fk_result_test FOREIGN KEY (test_id)
        REFERENCES Test (id)
        ON DELETE CASCADE
);
CREATE TABLE Test_Payment (
    test_id INT NOT NULL,
    amount DECIMAL(10 , 2 ) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NULL,
    updated_by INT NULL,
    PRIMARY KEY (test_id),
    CONSTRAINT fk_payment_test FOREIGN KEY (test_id)
        REFERENCES Test (id)
        ON DELETE CASCADE
);
CREATE TABLE Result_Approval (
    result_id INT NOT NULL,
    date DATE NOT NULL,
    status ENUM('Approved', 'Rejected') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NULL,
    updated_by INT NULL,
    PRIMARY KEY (result_id),
    CONSTRAINT fk_approval_result FOREIGN KEY (result_id)
        REFERENCES Test_Result (test_id)
        ON DELETE CASCADE
);
