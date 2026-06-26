## Scenario
### Maihan Pharmacy 

Maihan Pharmacy is located in Kabul and currently operates without an electronic information system to manage its daily activities. As a result, the pharmacy faces significant challenges in managing drug inventory, tracking payments, monitoring drug expiration dates, and handling other operational processes. To improve efficiency and ensure better management, the pharmacy owner plans to implement an electronic information system.

The system should support the following functions:
- Management of drug and medical device inventory
- Storage of supplier information and contact details
- Purchase billing and sales billing
- Purchase payments management

In this project, I design and implement the database that will serve as the foundation of this pharmacy information system. Also demonstrates how use directly the database with no API or appliation layer.

--- 

## Conceptual Design
### Domain Objects
- **Core Objects**
    - Purchase: 
    - Medical Device
    - Drug
    - Sale
- **Supporting Objects**    
    - Supplier: Information about suppliers.
    - Supplier Contact: Contact information for suppliers.
    - Supplier Address: Address information for suppliers.
    - Purchase Payment: Payment details for purchase

### Objects Attributes
- **Supplier**
    - Name
- **Supplier Address**
    - Province
    - District
    - Street
    - Building Number
- **Supplier Contact**
    - Phone Number
    - Email
    - Whatspp Number
- **Purchase Payment**
    - Date
- **Medical Device**
    - Name
    - Brand Name
- **Drug**
    - Name 
    - Brand Name
    - Expiration Date
- **Purchase**
    - Purchase Date
    - Purchased Items
- **Sale**
    - Sale Date
    - Sold Items

### ERD
![ERD](Assets/ERD.png)

---

## Logical Design



--- 

## Physical Design


--- 

## Database Usage