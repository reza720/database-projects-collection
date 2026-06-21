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
- Each Patient and Doctor has one or more Contacts and Addresses.
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
    - fist_name
    - last_name
    - gender
    - date_of_birth
    - created_at
- **Contact**
    - email
    - phone_number
    - whatsapp_number
    - created_at
    - updated_at
- **Address**
    - province
    - district
    - street
    - house_number
    - created_at
    - updated_at
- **Patient**
    - created_at
- **Doctor_Document**
    - photo
    - contract_document
    - national_id
    - cv_document
    - created_at
    - updated_at
- **Hospital_Department**
    - department_name
    - created_at
    - updated_at
- **Doctor**
    - created_at
    - updated_at
- **Illness_Symptoms**
    - symptom
    - created_at
- **History_of_Present_Illness**
    - symptom_timeline
    - symptom_severity
    - created_at
- **Vital_Signs**
    - blood_pressure
    - heart_rate
    - temperature
    - oxygen_saturation
    - created_at
- **Diagnosis**
    - condition_name
    - note
    - created_at
- **Lab_Order**
    - test_name
    - created_at
    - updated_at
- **Lab_Test_Result**
    - result_file
    - created_at
- **Radiology_Order**
    - body_part
    - image_name
    - created_at
    - updated_at
- **Radiology_Image**
    - digital_image_file
    - created_at
- **Prescription**
    - prescription_file
    - created_at
- **Visit**
    - date
    - reason
    - progress_note
    - created_at
    - updated_at


--- 

## Physical Design


--- 

## Database Usage
