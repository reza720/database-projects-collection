## Scenario
A laboratory information system is used to manage staff, test orders, laboratory tests, test results, test payments, and supervisor approvals. Staff perform laboratory tests, record the results, process payments, and supervisors review and approve completed tests when required.

In this project, I design and implement the database for this information system. Additionally, I demonstrate how the database can be used directly without an application layer.

--- 

## Conceptual Design
### Domain Objects:
- **Core Labratory Objects**
    - Staff 
    - Test Order
    - Test
- **Supporting Objects**
    - Person: Base object for staff and patients.
    - Address: Address information for staff, patients, and order senders.
    - Contact: Contact information for staff, patients, and order senders.
    - Staff Document: Personal and professional documents for staff.
    - Order Sender: Information about the sender of a test order.
    - Patient: Information about patients.
    - Test Result: Results of laboratory tests.
    - Test Payment: Payment details for laboratory tests.
    - Test Result Approval: Records of test result approvals.

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
    - Tazkira Document
    - Contract Document
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

### ERD
![ERD](Assets/ERD.drawio.png)

---

## Logical Design



--- 

## Physical Design


--- 

## Database Usage