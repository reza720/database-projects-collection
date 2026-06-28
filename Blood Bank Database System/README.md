## Scenario
A blood bank information system is needed to manage staff, blood donors, blood donations, and blood units. Each donated blood unit is tested, and the test results are recorded before it is added to the blood inventory. Hospitals and clinics can request blood units, and the system tracks the issuance of blood to fulfill those requests.

In this project, I design and implement the database for this system and demonstrate how it can be used directly, even without an API or application layer.

--- 

## Conceptual Design
### Domain Entities:
- **Core Mohsene Blood Bank Entities**
    - Blood Donor
    - Staff
    - Blood Test
    - Blood Group
    - Blood Request
- **Supporting Entities:**
    - Person: Base object for staff and donors.
    - Contact: Contact information for donors and staff
    - Address: Address information for donors and staff
    - Blood Donation: Records of blood donations.
    - Blood Unit: Individual donated blood units.
    - Staff Schedule: Staff work schedules.
    - Staff Documentation: Personal and professional documents for staff.
    - Blood Request Sender: Information about the sender of a blood request.
    - Blood Issuance: Records of blood issued to recipients.

### Attributes of Entites
Person
- First Name
- Last Name
- Gender
- Date of Birth
- **Contact**
    - Phone
    - Email
- **Address**
    - Province
    - District
    - Street
- **Blood Donation**
    - Date
- **Blood Group**
    - Group Code
- **Blood Unit**
    - Bag ID
    - Volume
    - Status (Available, Discarded, Issued)
- **Blood Test**
    - Test Date
    - Test Result (Passed, Failed)
- **Blood Donor**
- **Staff Schedule**
    - Day of Week
    - Start Time
    - End Time
- **Staff Documents**
    - National Id Document
    - Photo
    - Contract Document
- **Staff**
    - Status (Active, Inactive)
- **Blood Request Sender**
    - Sender Name
- **Blood Issuance**
    - Issue Date
- **Blood Request**
    - Request Date
    - Requested Blood Type
    - Requested Units

### ERD
![ERD](Assets/ERD.png)

---

## Logical Design



--- 

## Physical Design


--- 

## Database Usage