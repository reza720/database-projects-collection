use health_record;

-- Views
CREATE VIEW vw_user_profile AS
    SELECT 
        p.id,
        p.first_name,
        p.last_name,
        p.gender,
        p.date_of_birht,
        u.role,
        u.status,
        c.email,
        c.whatsapp_number,
        c.phone_number,
        a.province,
        a.district,
        a.street,
        d.photo_url,
        d.national_id_url,
        d.contract_url
    FROM
        `User` u
            LEFT JOIN
        Person p ON u.person_id = p.id
            LEFT JOIN
        Contact c ON p.id = c.person_id
            LEFT JOIN
        Address a ON p.id = a.user_id
            LEFT JOIN
        Document d ON p.id = d.user_id;
        
CREATE VIEW vw_patient_profile AS
    SELECT 
        p.first_name,
        p.last_name,
        p.gender,
        p.date_of_birht AS date_of_birth,
        c.phone_number,
        c.email,
        c.whatsapp_number
    FROM
        Patient pa
            LEFT JOIN
        Person p ON pa.person_id = p.id
            LEFT JOIN
        Contact c ON pa.person_id = c.person_id;

    