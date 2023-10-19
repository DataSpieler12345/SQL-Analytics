DELIMITER $$

CREATE PROCEDURE getEmailList(INOUT emailList VARCHAR(1000))
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAddress VARCHAR(100) DEFAULT "";

    DECLARE StaffEmail CURSOR FOR SELECT email FROM sakila.staff;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN StaffEmail;

    getEMAIL: LOOP
        FETCH StaffEmail INTO emailAddress;
        IF finished = 1 THEN 
            LEAVE getEMAIL;
        END IF;
        SET emailList = CONCAT(emailList, ';', emailAddress);
    END LOOP getEMAIL;

    CLOSE StaffEmail;
END $$
DELIMITER ;

SET @emailList = "";
CALL getEmailList(@emailList);
SELECT @emailList;