create database Health_Record;
use Health_Record;

-- Tables
CREATE TABLE Person (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birht DATE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Contact (
    person_id BIGINT PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(30) NULL,
    whatsapp_number VARCHAR(20) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_contact_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
); 
CREATE TABLE User (
    person_id BIGINT PRIMARY KEY,
    role ENUM('Doctor', 'Admin') NOT NULL,
    status ENUM('Active', 'Inactive', 'Left'),
    CONSTRAINT fk_user_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Address (
    user_id BIGINT PRIMARY KEY,
    street VARCHAR(100) NULL,
    district VARCHAR(100) NULL,
    province VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_address_user FOREIGN KEY (user_id)
        REFERENCES User (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Document (
    user_id BIGINT PRIMARY KEY,
    photo_url VARCHAR(100) NULL UNIQUE,
    national_id_url VARCHAR(100) NULL UNIQUE,
    contract_url VARCHAR(100) NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_document_user FOREIGN KEY (user_id)
        REFERENCES User (person_id)
        ON DELETE CASCADE
);
CREATE TABLE Hospital_Department (
    department_name VARCHAR(100) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Department_Doctor (
    doctor_id BIGINT,
    department_name VARCHAR(100),
    PRIMARY KEY (doctor_id , department_name),
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id)
        REFERENCES User (person_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_department FOREIGN KEY (department_name)
        REFERENCES Hospital_Department (department_name)
        ON DELETE CASCADE
);
CREATE TABLE Patient (
    person_id BIGINT PRIMARY KEY,
    CONSTRAINT fk_patient_person FOREIGN KEY (person_id)
        REFERENCES Person (id)
        ON DELETE CASCADE
);
CREATE TABLE Visit (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    doctor_id BIGINT NOT NULL,
    patient_id BIGINT NOT NULL,
    date DATE NOT NULL,
    reason TEXT NOT NULL,
    progress_note TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_visit_department FOREIGN KEY (department_name)
        REFERENCES Hospital_Department (department_name),
    CONSTRAINT fk_visit_doctor FOREIGN KEY (doctor_id)
        REFERENCES User (person_id),
    CONSTRAINT fk_visit_patient FOREIGN KEY (patient_id)
        REFERENCES Patient (person_id)
        ON DELETE CASCADE
);
CREATE TABLE History_of_Illness (
    visit_id BIGINT PRIMARY KEY,
    timeline DATE NOT NULL,
    serverity VARCHAR(50),
    CONSTRAINT fk_HoI_visit FOREIGN KEY (visit_id)
        REFERENCES Visit (id)
        ON DELETE CASCADE
);
CREATE TABLE Symptom (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    history_of_illness_id BIGINT NOT NULL,
    symptom VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_symptom_history_of_illness FOREIGN KEY (history_of_illness_id)
        REFERENCES History_of_Illness (visit_id)
        ON DELETE CASCADE
);
CREATE TABLE Vital_Signs (
    visit_id BIGINT PRIMARY KEY,
    blood_pressure TINYINT UNSIGNED NULL,
    heart_rate TINYINT UNSIGNED NULL,
    temprature DECIMAL(4 , 1 ) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_vital_signs_visit FOREIGN KEY (visit_id)
        REFERENCES Visit (id)
        ON DELETE CASCADE
);
CREATE TABLE Lab_Order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id BIGINT NOT NULL,
    test_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_lab_order_visit FOREIGN KEY (visit_id)
        REFERENCES Visit (id)
        ON DELETE CASCADE
);
CREATE TABLE Lab_Test_Result (
    lab_order_id INT PRIMARY KEY,
    result_file_url VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_lab_result_lab_order FOREIGN KEY (lab_order_id)
        REFERENCES Lab_Order (id)
        ON DELETE CASCADE
);
CREATE TABLE Radiology_Order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id BIGINT NOT NULL,
    body_part VARCHAR(100) NULL,
    image_type VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_radiology_order_visit FOREIGN KEY (visit_id)
        REFERENCES Visit (id)
        ON DELETE CASCADE
);
CREATE TABLE Radiology_Image (
    radiology_order_id INT PRIMARY KEY,
    image_file_url VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_radiology_image_order FOREIGN KEY (radiology_order_id)
        REFERENCES Radiology_Order (id)
        ON DELETE CASCADE
);
CREATE TABLE Diagnosis (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    visit_id BIGINT NOT NULL,
    condition_name VARCHAR(100) NOT NULL,
    note TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_diagnosis_visit FOREIGN KEY (visit_id)
        REFERENCES Visit (id)
        ON DELETE CASCADE
);
CREATE TABLE Prescription (
    visit_id BIGINT PRIMARY KEY,
    prescription_filr_url VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_prescription_visit FOREIGN KEY (visit_id)
        REFERENCES Visit (id)
        ON DELETE CASCADE
);



