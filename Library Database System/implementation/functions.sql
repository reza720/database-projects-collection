use Library_management;

-- Calculates total unpaid fines for a member 
DELIMITER $$
CREATE FUNCTION Member_Total_Fine(p_member_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_fine DECIMAL(10,2);

    SELECT IFNULL(SUM(f.amount), 0)
    INTO total_fine
    FROM Book_Transaction bt
    JOIN Fine f ON bt.id = f.book_transaction_id
    WHERE bt.member_id = p_member_id
      AND f.is_paid = FALSE;

    RETURN total_fine;
END $$
DELIMITER ;

-- Counts how many books a member has borrowed
DELIMITER $$
CREATE FUNCTION Member_Transaction_Count(p_member_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE tx_count INT;

    SELECT COUNT(*)
    INTO tx_count
    FROM Book_Transaction
    WHERE member_id = p_member_id;

    RETURN tx_count;
END $$
DELIMITER ;

-- Checks if a book is available
DELIMITER $$
CREATE FUNCTION Book_Is_Available(p_isbn VARCHAR(30))
RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE avail BOOLEAN;

    SELECT is_available
    INTO avail
    FROM Book
    WHERE isbn = p_isbn;

    RETURN avail;
END $$
DELIMITER ;


