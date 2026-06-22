## Scenario
### Electronic Health Record 
This database project is designed and implemented to transform paper-based health record management into an electronic database system. The system enables efficient storage, management, retrieval, and maintenance of patient health records.

The creation of a health record in a hospital, whether paper-based or electronic, begins with patient registration. During registration, the patient’s basic information is recorded, and a unique patient ID is assigned to identify the patient across all future visits.

After registration, the patient can visit a doctor in any department whenever required. Each visit creates a new visit within the patient’s health record.

During each visit, the doctor records and manages the following information in the patient’s health record:
- Visit Details: Date of visit, attending doctor, and department
- Reason for Visit: The main complaint of the patient
- History of Present Illness: timeline, severity, and symptoms
- Vital Signs: blood pressure, heart rate, temperature, and oxygen saturation
- Diagnosis: confirmed condition
- Orders: Requests for laboratory tests or radiology images
- Prescriptions: Medications prescribed to the patient
- Progress Notes: Updates on the patient’s condition

--- 

## Conceptual Design
### Domain Objects
- **Core Objects**
    - Patient
    - Doctor
    - Visit

- **Supporting Objects**
    - Person: Acts as a supertype for Doctor and Patient.
    - Address: Stores location information for doctors and patients.
    - Contact: Stores communication details for doctors and patients.
    - Doctor Document: Stores doctors' personal and professional documents.
    - Hospital Department: Keeps details of hospital sections where patients go for visit
    - History of Present Illness: Stores details about the timeline, severity and symptoms
    - Vital Signs: Stores patients' vital signs recorded during a visit.
    - Diagnosis: Stores details of a patient's confirmed diagnosis.
    - Lab Order: Stores details of laboratory tests ordered by a doctor.
    - Lab Test Result: Stores the results of patients' laboratory tests.
    - Radiology Order: Stores details of radiology imaging studies ordered by a doctor.
    - Radiology Image: Stores radiology images associated with imaging studies.
    - Prescription: Stores details of prescriptions issued to patients by doctors.

### Relationships of Objects
- Each Patient and Doctor is considered a Person.
- Each Patient and Doctor has one Contacts and Addresses.
- Each Doctor has one Doctor Document.
- Each Doctor works in one or more Hospital Departments.
- Each Visit involves one Doctor and one Patient.
- Each Visit takes place in one Hospital Department.
- Each Visit requires one History of Present Illness.
- Each Visit may include one Vital Signs record.
- Each Visit may result in one Diagnosis.
- Each Visit may require one or more Lab Orders and Radiology Orders.
- Each Lab Order may have one Lab Test Result.
- Each Radiology Order may have one or more Radiology Images.
- Each Visit may generate one or more Prescriptions.
- Each Visit may include one or more Progress Notes.

### Attributes of Objects
- **Person**
    - First Name
    - Last Name
    - Gender
    - Date of Birth
- **Contact**
    - Email
    - Phone Number
    - Whatsapp Number
- **Address**
    - Province
    - District
    - Street
    - House Number
- **Patient**
- **Doctor Document**
    - Photo
    - Contract Document 
    - National Id
    - CV Document
- **Hospital Department**
    - Department Name
- **Doctor**
- **History of Present Illness**
    - Symptoms
    - Symptom Timeline
    - Symptom Severity
- **Vital Signs**
    - Blood Pressure
    - Heart Rate
    - Temperature
    - Oxygen saturation
- **Diagnosis**
    - Condition Name
    - Note
- **Lab Order**
    - Test Name
- **Lab Test Result**
    - Result File
- **Radiology Order**
    - Body Part
    - Image Name
- **Radiology Image**
    - Digital Image File
- **Prescription**
    - Prescription File
- **Visit**
    - Date
    - Reason
    - Progress Note

---

## Logical Design
### Tables
- **Person**
    - id - surrogate PK; integer; 
    - fist_name - varchar;
    - last_name - varchar;
    - gender - enum(Male, Female)
    - date_of_birth - date;
    - created_at - timestamp
- **Contact**
    - id - surrogate PK; integer;
    - person_id - FK; on delete: cascade; integer;
    - email - varchar
    - phone_number - varchar
    - whatsapp_number - varchar
    - created_at - timestamp
    - updated_at - timestamp
- **Address**
    - id - surrogate PK; integer;
    - person_id - FK; on delete: cascade; integer; 
    - province - varchar;
    - district - varchar;
    - street - varchar; 
    - house_number - varchar;
    - created_at - timestamp;
    - updated_at - timestamp;
- **Patient**
    - Person_id - PK, FK; on delete: cascade; integer;
    - created_at - timestamp
- **Doctor**
    - person_id - PK; FK; on delete: cascade; integer; 
    - created_at - timestamp
    - updated_at - timestamp
- **Doctor_Document**
    - Doctor_id - PK; FK; on delete: cascade; integer;
    - photo_url - varchar;
    - contract_document_url - varchar;
    - national_id_ulr - varchar;
    - cv_document_url - varchar;
    - created_at - timestamp;
    - updated_at - timestamp;
- **Hospital_Department**
    - id - surrogate PK; integer;
    - department_name_url - varchar;
    - created_at - timestamp;
    - updated_at - timestamp;
- **Visit**
    - id - surrogate PK; integer;
    - patient_id - FK; integer;
    - doctor_id - FK; integer; 
    - hospital_department_id - FK; integer;
    - date - date;
    - reason - text;
    - progress_note - text;
    - created_at - timestamp;
    - updated_at - timestamp;
- **Illness_Symptom**
    - visit_id - PK; FK; integer;
    - symptom - varchar;
    - created_at - timestamp;
- **History_of_Present_Illness**
    - visit_id - PK; FK; integer;
    - symptom_timeline - date;
    - symptom_severity - varchar;
    - created_at - timestamp;
- **Vital_Signs**
    - visit_id - PK; FK; integer;
    - blood_pressure - varchar;
    - heart_rate - integer;
    - temperature - decimal;
    - oxygen_saturation - decimal
    - created_at - timestamp
- **Diagnosis**
    - visit_id - PK; FK; integer;
    - condition_name - varchar;
    - note - text;
    - created_at - timestamp
- **Lab_Order**
    - visit_id - PK; FK; integer;
    - test_name - varchar;
    - created_at - timestamp
    - updated_at - timestamp
- **Lab_Test_Result**
    - lab_order_id - PK; FK; integer;
    - result_file_url - varchar;
    - created_at - timestamp
- **Radiology_Order**
    - visit_id - PK; FK; integer; 
    - body_part - varchar;
    - image_name - varchar;
    - created_at - timestamp
    - updated_at - timestamp
- **Radiology_Image**
    - radiology_order_id - PK, FK; integer;
    - digital_image_file_url - varchar;
    - created_at - timestamp
- **Prescription**
    - visit_id - PK, FK; integer;
    - prescription_file_url - varchar;
    - created_at - timestamp

--- 

## Physical Design


--- 

## Database Usage
