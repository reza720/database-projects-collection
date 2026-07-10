use Library_management;

-- Member Registration Procedure
DELIMITER $$
CREATE PROCEDURE Register_Member(
    IN p_first_name VARCHAR(100),
    IN p_last_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_membership_type ENUM('Basic','Standard','Premium'),
    IN p_phone_number VARCHAR(15),
    IN p_province VARCHAR(100),
    IN p_district VARCHAR(100),
    IN p_street VARCHAR(100),
    IN p_house_number VARCHAR(20)
)
BEGIN
    DECLARE v_person_id INT;
    DECLARE v_address_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    INSERT INTO Address(
        province,
        district,
        street,
        house_number
    )
    VALUES(
        p_province,
        p_district,
        p_street,
        p_house_number
    );
    SET v_address_id = LAST_INSERT_ID();
    INSERT INTO Person(
        first_name,
        last_name
    )
    VALUES(
        p_first_name,
        p_last_name
    );
    SET v_person_id = LAST_INSERT_ID();
    INSERT INTO Member(
        id,
        email,
        membership_type,
        address_id,
        phone_number
    )
    VALUES(
        v_person_id,
        p_email,
        p_membership_type,
        v_address_id,
        p_phone_number
    );
    COMMIT;
END $$
DELIMITER ;

-- Staff Registration Procedure
DELIMITER $$
CREATE PROCEDURE Register_Staff(
    IN p_first_name VARCHAR(100),
    IN p_last_name VARCHAR(100),
    IN p_role ENUM('Admin','Employee'),
    IN p_province VARCHAR(100),
    IN p_district VARCHAR(100),
    IN p_street VARCHAR(100),
    IN p_house_number VARCHAR(20)
)
BEGIN
    DECLARE v_person_id INT;
    DECLARE v_address_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    INSERT INTO Address(
        province,
        district,
        street,
        house_number
    )
    VALUES(
        p_province,
        p_district,
        p_street,
        p_house_number
    );
    SET v_address_id = LAST_INSERT_ID();
    INSERT INTO Person(
        first_name,
        last_name
    )
    VALUES(
        p_first_name,
        p_last_name
    );
    SET v_person_id = LAST_INSERT_ID();
    INSERT INTO Staff(
        id,
        address_id,
        role
    )
    VALUES(
        v_person_id,
        v_address_id,
        p_role
    );
    COMMIT;
END $$
DELIMITER ;

-- Author Registration Procedure
DELIMITER $$
CREATE PROCEDURE Register_Author(
    IN p_first_name VARCHAR(100),
    IN p_last_name VARCHAR(100),
    IN p_date_of_birth DATE
)
BEGIN
    DECLARE v_person_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    INSERT INTO Person(
        first_name,
        last_name
    )
    VALUES(
        p_first_name,
        p_last_name
    );
    SET v_person_id = LAST_INSERT_ID();
    INSERT INTO Author(
        id,
        date_of_birth
    )
    VALUES(
        v_person_id,
        p_date_of_birth
    );
    COMMIT;
END $$
DELIMITER ;
