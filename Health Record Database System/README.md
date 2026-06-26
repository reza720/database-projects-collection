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
    - Hospital Department

- **Supporting Objects**
    - Person: Base object for doctors and patients.
    - Address: Address information for doctors and patients.
    - Contact: Contact information for doctors and patients.
    - Doctor Document: Personal and professional documents for doctors.
    - History of Present Illness: Information about the patient's illness, including symptoms, severity, and timeline, recorded during a visit.
    - Vital Signs: Patient vital signs recorded during a visit.
    - Diagnosis: Confirmed diagnosis recorded during a visit.
    - Lab Order: Laboratory tests ordered during a visit.
    - Lab Test Result: Results of laboratory tests.
    - Radiology Order: Imaging tests ordered during a visit.
    - Radiology Image: Images produced from radiology tests.
    - Prescription: Medications prescribed during a visit.

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
    - fist_name - varchar; mandatory; only letters and spaces allowed;
    - last_name - varchar; mandatory; only letters and spaces allowed;
    - gender - enum(Male, Female); mandatory;
    - date_of_birth - date; optional; only past dates allowed;
    - created_at - timestamp; mandatory;
- **Contact**
    - id - surrogate PK; integer;
    - person_id - FK; on delete: cascade; integer; mandatory;
    - email - varchar; mandatory; unique;
    - phone_number - varchar; mandatory; 
    - whatsapp_number - varchar; optional;
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Address**
    - id - surrogate PK; integer;
    - person_id - FK; on delete: cascade; integer; mandatory;
    - province - varchar; mandatory;
    - district - varchar; mandatory;
    - street - varchar; optional; 
    - house_number - varchar;
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Patient**
    - Person_id - PK, FK; on delete: cascade; integer;
    - created_at - timestamp; mandatory;
- **Doctor**
    - person_id - PK; FK; on delete: cascade; integer; 
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Doctor_Document**
    - doctor_id - PK; FK; on delete: cascade; integer;
    - photo_url - varchar; mandatory;
    - contract_document_url - varchar; mandatory;
    - national_id_ulr - varchar; mandatory; unique
    - cv_document_url - varchar; mandatory;
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Hospital_Department**
    - department_name - PK; varchar; 
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Visit**
    - id - surrogate PK; integer;
    - patient_id - FK; integer; mandatory;
    - doctor_id - FK; integer; mandatory;
    - hospital_department_id - FK; varchar; mandatory;
    - date - date; mandatory;
    - reason - text; optional; 
    - progress_note - text; optional;
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Illness_Symptom**
    - visit_id - PK; FK; integer;
    - symptom - varchar; mandatory;
    - created_at - timestamp; mandatory;
- **History_of_Present_Illness**
    - visit_id - PK; FK; integer;
    - symptom_timeline - date; mandatory;
    - symptom_severity - varchar; mandatory;
    - created_at - timestamp; mandatory;
- **Vital_Signs**
    - visit_id - PK; FK; integer;
    - blood_pressure - varchar; mandatory;
    - heart_rate - integer; mandatory; must be between 0 and 300; 
    - temperature - decimal; mandatory; must be between 30 and 45;
    - oxygen_saturation - decimal; mandatory; must be between 0 and 100 percent;
    - created_at - timestamp; mandatory;
- **Diagnosis**
    - visit_id - PK; FK; integer;
    - condition_name - varchar; mandatory;
    - note - text; optional;
    - created_at - timestamp; mandatory;
- **Lab_Order**
    - visit_id - PK; FK; integer;
    - test_name - varchar; mandatory;
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Lab_Test_Result**
    - lab_order_id - PK; FK; integer;
    - result_file_url - varchar; mandatory; unique;
    - created_at - timestamp; mandatory;
- **Radiology_Order**
    - visit_id - PK; FK; integer; 
    - body_part - varchar; mandatory;
    - image_name - varchar; mandatory;
    - created_at - timestamp; mandatory;
    - updated_at - timestamp; mandatory;
- **Radiology_Image**
    - radiology_order_id - PK, FK; integer;
    - digital_image_file_url - varchar; mandatory; unique;
    - created_at - timestamp; mandatory;
- **Prescription**
    - visit_id - PK, FK; integer;
    - prescription_file_url - varchar; mandatory; unique;
    - created_at - timestamp; mandatory;

### ERD
![ERD](Assets/ERD.png)

--- 

## Physical Design


--- 

## Database Usage
