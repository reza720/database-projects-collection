# Scenario
A blood bank information system is needed to manage staff, blood donors, blood donations, and blood units. Each donated blood unit is tested, and the test results are recorded before it is added to the blood inventory. Hospitals and clinics can request blood units, and the system tracks the issuance of blood to fulfill those requests.

# ER diagram 
![ERD](Assets/ERD.png)

# Relational Schema
- **Person**
    - id - PK
    - first_name
    - last_name
    - gender
    - date_of_birth
    - created_at
    - updated_at
- **Staff**
    - person_id - PK, FK, on delete: cascade
    - role (Employee, Admin)
    - status (Active, Inactive)
- **Document**
    - person_id - PK, FK, on delete: cascade
    - photo_url
    - tazkira_url
    - contract_url
    - created_at
    - updated_at
- **Schedule**
    - id - surrogate PK
    - person_id - FK, on delete:cascade
    - day_of_week
    - start_time
    - end_time
    - created_at
- **Address**
    - person_id - PK, FK, on delete: cascade
    - province
    - district
    - street
    - created_at
    - updated_at
- **Contact**
    - person_id - PK, FK, on delete: cascade
    - email 
    - whatsapp_number
    - phone_number
    - created_at
    - updated_at
- **Donor**
    - person_id - PK, FK, on delete: cascade
    - blood_group
- **Donation**
    - id - surrogate PK
    - person_id - FK
    - person_id - FK
    - date
    - created_at
    - updated_at
- **Test**
    - donation_id - PK, FK, on delete:cascade
    - date
    - is_eligible
    - created_at
- **Blood_Group**
    - group_code - PK
    - created_at
- **Blood_unit**
    - bag_id - PK
    - donation_id - FK 
    - groupd_id - FK 
    - volume
    - status(Available, Issued)
    - created_at
    - updated_at
- **Request_Sender**
    - id - surrogate PK
    - name
    - created_at
    - updated_at
- **Blood_request**
    - id - surrogate PK
    - date
    - blood_group_id - FK
    - number_of_units
    - created_at
    - updated_at
- **Blood_Issuance**    
    - request_id - PK, FK
    - date
    - created_at




