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
    - History of Present Illness: Stores details about the timeline and progression of a patient's current illness.
    - Vital Signs: Stores patients' vital signs recorded during a visit.
    - Diagnosis: Stores details of a patient's confirmed diagnosis.
    - Lab Order: Stores details of laboratory tests ordered by a doctor.
    - Lab Test Result: Stores the results of patients' laboratory tests.
    - Radiology Order: Stores details of radiology imaging studies ordered by a doctor.
    - Radiology Image: Stores radiology images associated with imaging studies.
    - Prescription: Stores details of prescriptions issued to patients by doctors.
    - Progress Note: Stores notes recorded by doctors during patient visits.

### Relationships of Objects
- 

### Attributes of Objects

---

## Logical Design



--- 

## Physical Design


--- 

## Database Usage
