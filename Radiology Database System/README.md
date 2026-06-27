## Scenario 
A radiology information system manages radiology staff, patients, imaging orders, imaging procedures, medical images, and imaging payments. Imaging orders are received from hospital departments or external clinics, processed by radiology staff, and the resulting medical images are stored and managed within the system.

In this project, I design and implement the database for this information system. I also demonstrate how the database can be used directly, without an application layer.

--- 

## Conceptual Design
### Domain Objects:
- **Core Radiology Objects**
    - Staff (Technicians, Manager)
    - Patient
    - Imaging Order
    - Imaging
- **Supporting Objects:**
    - Person: Base object for staff and patients.
    - Contact: Contact information for staff, request senders, and patients.
    - Address: Address information for staff, request senders, and patients.
    - Staff Document: Personal and professional documents for staff.
    - Staff Schedule: Staff work schedules.
    - Imaging Request Sender: Information about the sender of an imaging request.
    - Clinic: Information about the clinic that sent the imaging request.
    - Hospital Department: Information about the hospital department that sent the imaging request.
    - Requested Image: Details of the imaging study requested.
    - Image: Images generated from imaging procedures.
    - Imaging Payment: Payment details for imaging services.

### Object Attributes
- **Person**
    - First Name
    - Last Name
    - Gender
- **Staff**
    - Role
- **Imaging Order**
    - Order Date
- **Imaging**
    - Imaging Date
- **Contact**
    - Phone Number
    - Email
- **Address**
    - Province
    - District
    - Street
- **Staff Document**
    - Tazkira/National ID Card Docuemnt
    - Contract Document
- **Staff Schedule**
    - Day of Week
    - Start Time
    - End Time
- **Imaging Request Sender**
    - Doctor Name
- **Clinic**
    - Clinic Name
- **Hospital Department**
    - Department Name
- **Patient**
    - Age
- **Requested Image**
    - Body Part
    - Type of Image
- **Image**
- **Imaging Payment**
    - Amount

### ERD
![ERD](Assets/ERD.drawio.png)

---

## Logical Design
### Tables
- **Person**
    - id - surrogate PK
    - first_name
    - last_name
    - gender
    - created_at
    - updated_at
- **Staff**
    - person_id - PK
    - role
- **Patient**
    - person_id - PK; FK
    - age
- **Imaging_Order**
    - id - surrogate PK
    - imaging_request_sender_id - FK
    - order_date
    - created_at
    - updated_at
- **Imaging**
    - id - surrogate PK
    - imagin_order_id - FK
    - imaging_date
    - created_at
- **Contact**
    - id - surrogate PK
    - 
    - phone_umber
    - email
    - created_at
    - updated_at
- **Address**
    - id - surrogate PK
    - province
    - district
    - street
    - created_at
    - updated_at
- **Staff_Document**
    - staff_id - PK; FK
    - tazkira_docuemnt
    - contract_document
    - created_at
    - updated_at
- **Staff_Schedule**    
    - id - surrogate PK
    - day_of_week
    - start_time
    - end_time
    - created_at
- **Imaging_Request_Sender**
    - id - surrogate PK
    - doctor_name
    - created_at
    - updated_at
- **Clinic**
    - clinic_name - PK
    - created_at
    - updated_at
- **Hospital_Department**
    - department_name - PK
    - created_at
    - updated_at

- **Requested_Image**
    - id - surrogate PK
    - body_part
    - type_of_image
    - created_at
    - updated_at
- **Image**
    - id - surrogate PK
    - created_at
    - updated_at
- **Imaging_Payment**
    - imaging_id - PK; FK
    - Amount
    - created_at
--- 

## Physical Design


--- 

## Database Usage