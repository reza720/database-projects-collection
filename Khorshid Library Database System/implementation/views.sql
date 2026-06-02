use Library_Management;

-- Staff Views
CREATE VIEW staff_full_profile AS
    SELECT 
        p.id,
        p.first_name,
        p.last_name,
        s.role,
        a.province,
        a.district,
        a.street,
        a.house_number
    FROM
        Staff s
            JOIN
        Person p ON s.id = p.id
            JOIN
        Address a ON s.address_id = a.address_id;

CREATE VIEW staff_logs AS
    SELECT 
        p.id, 
        p.first_name, 
        p.last_name, 
        l.login_time, 
        l.logout_time
    FROM
        Staff s
            JOIN
        Person p ON p.id = s.id
            JOIN
        Log l ON l.staff_id = s.id;
    
CREATE VIEW staff_chedules AS
    SELECT 
        p.id,
        p.first_name,
        p.last_name,
        sc.day_of_week,
        sc.start_time,
        sc.end_time
    FROM
        Staff s
            JOIN
        Person p ON s.id = p.id
            JOIN
        Schedule sc ON s.id = sc.staff_id;


-- Member Views
CREATE VIEW member_full_profile AS
    SELECT 
        p.id,
        p.first_name,
        p.last_name,
        m.email,
        m.membership_type,
        m.phone_number,
        m.membership_status,
        a.province,
        a.district,
        a.street,
        a.house_number
    FROM
        Member m
            JOIN
        Person p ON m.id = p.id
            JOIN
        Address a ON m.address_id = a.address_id;

CREATE VIEW member_transactions AS
    SELECT 
        p.id as member_id,
        p.first_name as member_first_name,
        p.last_name as member_last_name,
        m.email as member_email,
        b.isbn as book_isbn,
        b.title as book_title,
        b.edition as book_edition,
        b.price as book_price,
        t.book_issue_date,
        t.due_date as book_return_due_date,
        t.is_returned as is_book_returned
    FROM
        Member m
            JOIN
        Person p ON m.id = p.id
            JOIN
        Book_Transaction t ON m.id = t.member_id
            JOIN
        Book b ON b.isbn = t.book_isbn;

CREATE VIEW member_fines AS
    SELECT 
        p.id,
        p.first_name,
        p.last_name,
        t.book_isbn,
        t.book_issue_date,
        t.due_date,
        f.amount,
        f.is_paid
    FROM
        Member m
            JOIN
        Person p ON m.id = p.id
            JOIN
        Book_Transaction t ON t.member_id = m.id
            JOIN
        Fine f ON t.id = f.book_transaction_id;
    

-- Book Views
CREATE VIEW book_details AS
    SELECT 
        b.isbn,
        b.title,
        b.publication_year,
        b.edition,
        b.price,
        p.name AS publisher_name,
        g.name AS genre_name
    FROM
        Book b
            JOIN
        Genre g ON g.id = b.genre_id
            JOIN
        Publisher p ON p.id = b.publisher_id;

CREATE VIEW book_authors AS
    SELECT 
        p.id AS author_id,
        p.first_name AS author_first_name,
        p.last_name AS author_last_name,
        b.isbn AS book_isbn,
        b.title AS book_title
    FROM
        Book b
            JOIN
        Book_Author ba ON b.isbn = ba.book_isbn
            JOIN
        Person p ON p.id = ba.author_id;

CREATE VIEW author_full_profile AS
    SELECT 
        p.id AS author_id,
        p.first_name AS author_first_name,
        p.last_name AS author_last_name,
        a.date_of_birth
    FROM
        Author a
            JOIN
        Person p ON p.id = a.id;
	





 