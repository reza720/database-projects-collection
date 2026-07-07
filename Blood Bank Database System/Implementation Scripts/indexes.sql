use blood_bank;

-- Indexes
CREATE INDEX idx_person_firstname_lastname
ON Person(first_name, last_name);

CREATE INDEX idx_contact_phonenumber
ON Contact (phone_number);

CREATE INDEX idx_attendace_date
ON Attendance (date);

CREATE INDEX idx_test_result_is_eligible
ON Test_Result(is_eligible);

CREATE INDEX idx_blood_uint_status
ON Blood_Unit (status);

CREATE INDEX idx_request_sender_name
ON Request_Sender (sender_name);

CREATE INDEX idx_request_status
ON Blood_Request (status);




