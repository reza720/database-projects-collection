use health_record;

-- Indexes
CREATE INDEX idx_person_firstname_lastname 
ON Person(first_name, last_name);

CREATE INDEX idx_contact_email
ON Contact(email);

CREATE INDEX idx_visit_doctor_date
ON Visit (doctor_id, date);

CREATE INDEX idx_visit_patiet_date
ON Visit(patient_id, date);

CREATE INDEX idx_visit_department
ON Visit(department_name, date);

