# Business Overview 
This organization is a multi-branch ambulance service provider. It operates independently and is not affiliated with any hospital. The following describes how the organization operates: 
1. A request for ambulance(s) is received through a phone call or other ways. The dispatcher collects basic information:
    - Caller phone number
    - Emergency location
    - Type of emergency
    - Priority level
    - Number of patients
2. The nearest available branch is identified, and the request is assigned to that branch. The branch manager arranges the response by selecting:
    - Appropriate ambulance crew
    - Ambulace type
3. When the ambulance arrives at the location, the crew:
    - Assesses the patient's condition (vital signs, symptoms, and injuries).
    - Provides necessary first aid and emergency care.
    - Records patient information, treatments, and important time details.
    - Continues care during transport if required.
4. The crew selects a suitable hospital based on:
    - Patient condition
    - Required medical specialty
    - Hospital availability and distance
5. Upon arrival, the crew transfers the patient to hospital staff and provides a handover report and after service payment is processed the case is closed.

# System Overview 
This business requires a centralized management system to support the operations of all branches, including crew management, ambulance management, and complete service records.

The system will have three main user roles:
- Top Managers
- Branch Managers
- Dispatchers (Call Center Staff)

The system should provide the following functional requirements:
- Role-based user registration and secure access control for top managers, dispatchers, and branch managers.
- Registration and management of ambulance crews and ambulances by top managers or branch managers.
- Attendance management for branch crews, where branch managers can record and monitor attendance for their own branch staff.
- Registration and management of ambulance requests by dispatchers and branch managers.
- Complete service record management, including patient assessment, provided first aid and emergency care, transportation details, hospital handover information, and payment records.
- Centralized access to all system information for top managers, while providing limited access based on responsibilities for dispatchers and branch managers.

The following features may be added in future versions of the system:
- A mobile application for customers to request ambulances directly.
- Mobile and tablet applications for ambulance crews to record service operations, patient information, treatments, and real-time updates.

