use laboratory;

-- indexes
CREATE INDEX idx_person_fullname
on Person (first_name, last_nme);

CREATE INDEX idx_patient_order_date
ON Test_ORder (patient_id, order_date);

CREATE INDEX idx_order_requested_test
ON Requested_Test (order_id, test_name);

CREATE INDEX idx_requested_test_test_date
ON Test (requested_test_id, date);



