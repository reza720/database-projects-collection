## Scenario
pharmacy purchases drugs and medical devices from suppliers and keeps track of its inventory. Each purchase and sale is recorded, along with purchase payments. Supplier information and contact details are also maintained.

In this project, I design and implement the database that serves pharmacy information system. Also, demonstrates how the database can be used directly without an API or application layer.

--- 

## Conceptual Design
### Domain Objects
- **Core Objects**
    - Purchase: 
    - Item
    - Sale
- **Supporting Objects**    
    - Supplier: Information about suppliers.
    - Supplier Contact: Contact information for suppliers.
    - Supplier Address: Address information for suppliers.
    - Purchase Payment: Payment details for purchase
    - Drug: A type of Item
    - Medical Device: A type of Item

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
- **Item**
    - Name
    - Brand Name
- **Medical Device**
- **Drug**
    - Expiration Date
- **Purchase**
    - Purchase Date
    - Purchased Items
- **Sale**
    - Sale Date
    - Sold Items

---

## Logical Design
### Tables
- **Purchase**
    - id - surrogate PK;
    - purchase_date - 
    - supplier_id - FK
    - created_at
- **Supplier**
    - id - surrogate PK
    - name
    - created_at
    - updated_at
- **Supplier_Address**
    - supplier_id - PK; FK
    - province
    - district
    - street
    - building_number
    - created_at
    - updated_at
- **Supplier_Contact**  
    - supplier_id - PK; FK
    - phone_number
    - email
    - whatsapp_number
    - created_at
    - updated_at
- **Item**
    - id - surrogate PK
    - name
    - brand_name
    - created_at
    - updated_at
- **Drug**
    - item_id - PK; FK
- **Medical_Device**
    - item_id - PK; FK
- **purchased_Items**
    - id - surrogate PK
    - purchase_id - FK
    - item_id - FK
    - quantity
    - unit_price
    - expiration_date
    - created_at
- **Purchase_Payment**
    - purchase_id - PK; FK
    - payment_date
    - created_at
- **Sale**
    - id - surrogate PK
    - sale_date
    - created_at
- **Sold_Items**
    - id - surrogate PK
    - sale_id - FK
    - item_id - FK
    - quantity
    - unit_price
    - created_at


--- 

## Physical Design


--- 

## Database Usage