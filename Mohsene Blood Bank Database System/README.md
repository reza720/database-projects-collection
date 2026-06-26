## Scenario
### Mohsene Blood Bank 
Mohsene Blood Bank is a fictional non-profit blood bank assumed to operate in Kabul City. Its primary purpose is to collect, process, store, and supply blood and blood components to patients, hospitals, and clinics.

Currently, the organization relies on a paper-based system which has created several operational challenges, including the mislabeling of blood units, difficulties in tracking blood inventory, delays in processing blood requests, and many more. The use of an electronic system, whether as a standalone database or as part of a complete information system, would significantly address these problems.

The proposed electronic system should support the following activities:
- Management of staff and their daily activities
- Management of blood donors
- Management of blood donations and blood units
- Management of blood unit testing procedures
- Management of blood test results
- Management of blood type inventory
- Management of blood requests from hospitals, and clinics
- Management of blood issuance 

In this project, I design and implement the database for this system and demonstrate how the database can be used directly, even without an API or application layer.

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
    - Contact: Contact information for donors, staff, and blood request senders.
    - Address: Address information for donors, staff, and blood request senders.
    - Blood Donation: Records of blood donations.
    - Blood Unit: Individual donated blood units.
    - Staff Schedule: Staff work schedules.
    - Staff Documentation: Personal and professional documents for staff.
    - Blood Request Sender: Information about the sender of a blood request.
    - Blood Issuance: Records of blood issued to recipients.

### Attributes of Entites
- **Person**
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
    - Contact Document
- **Staff**
    - Status (Active, Left)
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