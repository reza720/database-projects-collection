## Scenario
### Mosavi Medical Laboratory 
Mosavi Medical Laboratory has been serving clients for over 10 years in Kabul. It is a privately owned and independent laboratory and is not part of any hospital. In recent years, the lab has been using a simple information system; however, this system does not fully meet its operational needs. Therefore, the owner plans to upgrade it and develop a more advanced system.

The current system only allows storage of basic patient information and test results. However, the new system is expected to support the following features:
- Manage Staff (technicians/supervisor) and their daily works
- Manage Test Orders
- Manage Tests
- Manage Test Results
- Manage Tests Payments
- Mange Test Approvals by supervisor

In this project, I design and implement the database for this information system. Additionally, I demonstrate how the database can be used directly without an application layer.

--- 

## Conceptual Design
### Domain Objects:
- **Core Labratory Objects**
    - Staff 
    - Test Order
    - Test

- **Supporting Objects**
    - Person: Supertype for Staff and Patient
    - Address: Related to Staff, Patient and Order Sender
    - Contact: Related to Staff, Patient and Order Sender
    - Staff Document: Related to Staff
    - Order Sender: Related to Test Order
    - Patient: Related to Test Order
    - Test Result: Related to Test
    - Test Payment: Related to Test
    - Test Result Approval: Realted to Test Result

### Attributes of Object
- **Person**
    - First Name
    - Last Name
    - Gender
- **Address**
    - Province
    - District
    - Street
- **Contact**
    - Email
    - Phone Number
- **Staff Document**
    - National Id Scan
    - Contract Scan
- **Staff**
    - Role
- **Order Sender**
    - Name
    - Doctor Name
- **Patient**
    - Age
- **Test Order**
    - Order Date
    - Requested Test
- **Test Result**
    - Description
- **Test Payement**
    - Amount
- **Test Approval**
    - Approval Date
- **Test**
    - Test Date
    
### Relationships Between Objects
- Person is a supertype of a Staff or a Patient.
- Each Staff, Patient, and Order Sender can have zero, one, or many Addresses.
- Each Staff, Patient, and Order Sender must have at least one Contact.
- Each Staff must have a Staff Document.
- Each Test Order contains an Order Sender.
- Each Test Order contains a Patient.
- Each Test generates a Test Result.
- Each Test requires a Payment.
- Each Test Result requires a Test Result Approval.

---

## Logical Design



--- 

## Physical Design


--- 

## Database Usage