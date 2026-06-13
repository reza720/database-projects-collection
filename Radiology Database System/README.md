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
    - Imaging Order
    - Imaging

- **Supporting Objects:**
    - Person: supertype for Staff and Patient  
    - Contact: communication details of Staff, Request Sender, and Patient  
    - Address: location details of Staff, Request Sender, and Patient  
    - Staff Document: staff personal details  
    - Staff Schedule: staff presence in the lab  
    - Imaging Request Sender: imaging order identifier details  
    - Clinic: details of the clinic sending the imaging request  
    - Hospital Department: identification details of the hospital department sending the imaging request  
    - Patient: personal details of the person for whom the imaging is issued  
    - Requested Image: details of the type of image to be performed  
    - Image: images generated after imaging patients  
    - Imaging Payment: supports the payment process / holds details of imaging payments

### Attributes of Objects
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
    - Tazkira Scan / Nation Id Scan
    - Contract Scan
- **Staff Schedule**
    - Date of Week
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

### Relationships Between Objects
- Person is the supertype of Staff Member and Patient.
- A Staff, Patient, or Request Sender can be associated with many Contacts and Addresses.
- Each Staff has exactly one Staff Document.
- Each Staff Member can generate many Staff Schedules.
- Each Imaging Order comes from one Imaging Request Sender.
- Each Imaging Request Sender belongs to either the Hospital Department or an external Clinic.
- Each Imaging Order is issued for one Patient.
- Each Imaging Order requests one Imaging Type.
- Each completed Imaging Procedure produces one or more Images.
- Each completed Imaging Procedure requires a corresponding Payment

---

## Logical Design

### Entity Relationship Diagram (ERD)

### Tables



--- 

## Physical Design


--- 

## Database Usage