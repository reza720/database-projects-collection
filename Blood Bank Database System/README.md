# Blood Bank

## Conceptual Design
### Scope:
This system help to collect, test, store, and supply Blood

### Business Rules:
- A Donor donates blood, and the process is handled by Staff
- Each Donation creates one Unit
- Each Blood Unit has a Blood Group (A, B, AB, O with Rh factor)
- Each Blood Unit is tested before it can be used
- Each Blood Group is managed in Inventory
- A Patient makes a Blood Request
- Each Transfusion is performed by Staff
- After transfusion, the Blood Unit is removed from Inventory

### Entities:
- Bank_Staffs
- Blood_Doners
- Blood_Donations
- Blood_Units
- Blood_Groups
- Blood_Tests
- Blood_Type_Inventory
- Patiens
- Blood_Requests
- Blood_Request_Units
- Blood_Transfusion

### Relationships:
- Blood Donations happens with help of staffs by doners
- Each Blood_Donation pass a Blood_Test and if Health become a Blood_Unit and added to Blood_Type_Inventory of a Blood_Type
- Blood_Request comes to ask for Blood_Units, so Each Blood_Unit will be added to Blood_Request_Units, if that Blood_Request exist the Blood_Transfusion happens

## Logical Design
### Tables
- Persons: 
    - id
    - firstName
    - lastName
    - phone
    - gender

- Patients:
    - id
    - age
    - address

- Staff:
    - id 
    - email
    - hireDate
    - isActive

- Doners
    - id 
    - age
    - address

- BloodDonations
    - donetion_id
    - doner
    - donation_coordinator
    - donetion_date

- BloodGroups
    - id
    - blood_group
    - RH

- BloodUnits
    - donetion_id
    - blood_group
    - 


- BloodTests
- BloodTypeInventory
- BloodRequests
- BloodRequestUnits
- BloodTransfusions

## Physical Design