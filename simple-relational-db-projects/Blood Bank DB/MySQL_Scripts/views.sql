use blood_bank;

-- Views
CREATE VIEW vw_staff_profile AS
    SELECT 
        p.id AS staff_id,
        p.first_name,
        p.last_name,
        p.gender,
        p.date_of_birth,
        s.role,
        s.status,
        c.email,
        c.phone_number,
        d.photo_url,
        d.national_id_url,
        d.contract_url,
        a.street,
        a.distric,
        a.province
    FROM
        Staff s
            LEFT JOIN
        Person p ON p.id = s.person_id
            LEFT JOIN
        Contact c ON p.id = c.person_id
            LEFT JOIN
        Document d ON s.person_id = d.person_id
            LEFT JOIN
        Address a ON s.person_id = a.person_id;
    
CREATE VIEW vw_donor_profile AS
    SELECT 
        p.id AS donor_id,
        p.first_name,
        p.last_name,
        p.gender,
        p.date_of_birth,
        c.email,
        c.phone_number
    FROM
        Donor d
            LEFT JOIN
        Person p ON d.person_id = p.id
            LEFT JOIN
        Contact c ON c.person_id = d.person_id;

CREATE VIEW vw_donation_details AS
    SELECT 
        don.id AS donation_id,
        don.date AS donation_date,
        p.first_name AS donor_first_name,
        p.last_name AS donor_last_name,
        t.is_eligible,
        u.volume,
        u.status,
        u.group_code
    FROM
        Donation don
            LEFT JOIN
        Donor d ON don.donor_id = d.person_id
            LEFT JOIN
        Person p ON d.person_id = p.id
            LEFT JOIN
        Test_Result t ON t.donation_id = don.id
            LEFT JOIN
        Blood_Unit u ON u.donation_id = don.id;


    
    