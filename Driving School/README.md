## Scenario 
The SafeDriving School of Motoring was established in 2001. Since then, it has grown steadily and now has several offices in most of the major cities over the country. However, the size the school is expanding where more and more administrative staffs are employed to cope with the ever-increasing amount of paperwork. Furthermore, the communication and sharing of information between offices, even in the same city, is poor. The Director of the School feels that too many mistakes are being made and that the success of the school will be short-lived if he does not do something to remedy the situation. He knows that a database could help in part to solve the problem and thus approached your team to help in creating a database system to support the running of the School. The Director has provided the brief description of how the SafeDriving School of Motoring operates.

Each office has a Manager (who can also be a Senior Instructor), several Senior Instructors, Instructors and administrative staff. The Manager is responsible for the day-to-day running of the office. Clients must first register at an office and this requires that they complete an application form, which records their personal details. Before the first lesson, a client is requested to attend an interview with an Instructor to assess the needs of the client and to ensure that the client holds a valid provisional driving license. A client is free to ask for a particular Instructor or to request that an Instructor to be changed at any stage throughout the process of learning to drive. After the interview, the first lesson is booked. A client may request individual lesson or book a block of lessons for a reduced fee. An individual lesson is for one hour, which begins and ends at the office. Each lesson is with a particular Instructor in a particular car at a given time (can start as early as 8am and as late as 8pm).

After each lesson, the Instructor records the progress made by the client and notes the mileage used during the lesson. The School has a pool of cars, which are adapted for the purposes of teaching and each Instructor is allocated to a particular car. The cars are inspected at regular intervals for faults. Once ready, a client applies for a driving test date. To obtain a full driving license the client must pass both the practical and theoretical parts of the test. The Instructor is not responsible for testing the client and is not in the car during the test but should be available to drop off and pick up the client before and after the test at the Testing Centre. If a client fails to pass, the Instructor must record the reasons for the failure.

---

## Conceptual Design

### Domain Entities and Attributes
- **Address** 
    - city
    - street
    - building_number
- **Contact**
    - email
    - phone_number
- **Office**
- **Person** 
    - first_name
    - last_name 
- **Staff**
    - role: Manager / Instructor / Senior Instructor / Admin Staff
- **Client**
    - date_of_birth
    - provisional_license_number
    - registration_date
    - Application_Form
    - submission_date
- **Interview**
    - interview_date
    - assessment_notes
    - license_verified: yes/no
- **Car**
    - model
    - registration_number
    - transmission_type: manual / automatic
    - status: available / out_of_service
- **Lesson_Block**	
    - total_lessons
    - purchase_date
    - price
- **Lesson**
    - lesson_type: individual / block
    - lesson_date
    - start_time
    - end_time
- **Lesson_Progress_Record**
    - distance_travelled
    - progress_notes
- **Test_Center**
    - name
- **Driving_Test**
    - test_date
    - test_result: pass / fail
- **Test_Failure_Record**	
    - failure_reason
    - recorded_date

#### Relationships
- Every Office has an Address
- Every Office has a Contact
- Every Staff is a Person
- Every Staff has an Address
- Every Staff has a Contact
- Every Staff works in an Office
- Every Client is a Person
- Every Client has an Address
- Every Client has a Contact
- Every Client register to an Office
- Every Application_Form filled by a Client in an Office
- Every Client give an Interview in an Office with a Staff
- In every Lesson Staff teaches the Client with a Car
- Every Lesson_Progress_Record is written after each Lesson
- Every Test_Center has an Address
- Every Test_Center has a Contact
- Every Driving_Test is taken by a Client in a Test_Center
- Every Test_Failure_Record is written after a Client fail the test	