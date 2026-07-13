use library_management;

-- Views
CREATE VIEW vw_staff_profile AS
    SELECT 
		p.id,
        CONCAT(p.first_name, ' ', p.last_name) AS staff_name,
        p.gender,
        p.date_of_birth,
        s.role,
        CONCAT(a.district,
                '/',
                street,
                '/',
                house_number) AS address,
        c.phone_number,
        c.whatsapp_number,
        d.photo_url,
        d.national_id_url
    FROM
        Staff s
            LEFT JOIN
        Person p ON s.person_id = p.id
            LEFT JOIN
        Address a ON s.person_id = a.person_id
            LEFT JOIN
        contact c ON s.person_id = c.person_id
            LEFT JOIN
        document d ON s.person_id = d.person_id;    
        
CREATE VIEW vw_customer_profile AS
    SELECT 
        p.id,
        CONCAT(p.first_name, ' ', p.last_name) AS staff_name,
        p.gender,
        p.date_of_birth,
        cu.status,
        CONCAT(a.district,
                '/',
                street,
                '/',
                house_number) AS address,
        c.phone_number,
        c.whatsapp_number,
        d.photo_url,
        d.national_id_url
    FROM
        customer cu
            LEFT JOIN
        Person p ON cu.person_id = p.id
            LEFT JOIN
        Address a ON cu.person_id = a.person_id
            LEFT JOIN
        contact c ON cu.person_id = c.person_id
            LEFT JOIN
        document d ON cu.person_id = d.person_id;

CREATE VIEW vw_staff_attendance AS
    SELECT 
        p.id AS staff_id,
        CONCAT(p.first_name, ' ', p.last_name) AS name,
        a.date,
        a.time_in,
        a.time_out
    FROM
        Staff s
            LEFT JOIN
        Person p ON s.person_id = p.id
            LEFT JOIN
        attendance a ON s.person_id = a.staff_id;

CREATE VIEW vw_book_details AS
    SELECT 
        b.isbn,
        b.title,
        b.fee,
        b.total_copies AS copies,
        pub.publisher_name AS publisher,
        bg.genre_name AS genre,
        ba.author_name AS author
    FROM
        Book b
            LEFT JOIN
        Publisher pub ON b.publisher_name = pub.publisher_name
            LEFT JOIN
        book_author ba ON ba.book_isbn = b.isbn
            JOIN
        author a ON ba.author_name = a.author_name
            LEFT JOIN
        book_genre bg ON bg.book_isbn = b.isbn
            JOIN
        Genre g ON bg.genre_name = g.genre_name;

CREATE VIEW vw_borrow_details AS
    SELECT 
        bor.id AS borrow_id,
        CONCAT(p.first_name, ' ', p.last_name) AS customer,
        b.isbn AS book_isbn,
        b.title AS book_title,
        b.fee AS book_fee,
        bor.borrow_date,
        bor.due_date AS borrow_due_date,
        bor.return_date
    FROM
        borrow bor
            LEFT JOIN
        Customer c ON bor.customer_id = c.person_id
            JOIN
        Person p ON c.person_id = p.id
            LEFT JOIN
        Book b ON bor.book_isbn = b.isbn;



