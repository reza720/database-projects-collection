## Scenario
### Radiology 
This database is designed and implemented for a electronic information system to support the operations of a hospital radiology department. It is not developed for a specific hospital; instead, it provides a generic solution that can be adapted by any hospital.

Many radiology departments in Afghanistan still rely on paper-based processes. This can lead to various challenges, including loss of patient information, misidentification of imaging records, workflow delays, security concerns, and many more.

A typical radiology information system should support the following functions:
- Management of radiology staff and their work activities
- Management of imaging orders received from other hospital departments/Other clinics
- Management of patients
- Management of imaging procedures
- Management of medical images 
- Management of imaging payments

In addition to the design and implementation of the database, this project also demonstrates how the database can be used directly without an application layer, allowing users to perform common operational tasks through database queries and procedures.


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


### Normalization Notes


### Tables



--- 

## Physical Design


--- 

## Database Usage