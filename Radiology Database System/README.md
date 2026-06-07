## Scenario
### Radiology 
This database is designed and implemented for a electronic information system to support the operations of a hospital radiology department. It is not developed for a specific hospital; instead, it provides a generic solution that can be adapted by any hospital.

Many radiology departments in Afghanistan still rely on paper-based processes. This can lead to various challenges, including loss of patient information, misidentification of imaging records, workflow delays, security concerns, and many more.

A typical radiology information system should support the following functions:
- Management of radiology staff and their work activities
- Management of imaging orders received from other hospital departments/Other hospitals or clinics
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

- **Supporting Objects:** All objects that complement the core entities, including supertypes, multi‑valued attributes, and grouped attributes, are considered supporting objects here:
    - Person: Supertype for Staff and Patient
    - Contact: Related to Staff, Request Sender, and Patient
    - Address: Related to Staff, Request Sender, and Patient
    - StaffDoc: Staff related
    - Schedule: Staff related   
    - Imaging Request Sender: Imaging Order related 
    - Patient: Imaging Order related    
    - Requested Image: Imaging Order related    
    - Image: Imaging related    
    - Imaging Payment: Imaging related

### Attributes of Objects


### Relationships Between Objects


### Entity Relationship Diagram (ERD)


---

## Logical Design



--- 

## Physical Design


--- 

## Database Usage