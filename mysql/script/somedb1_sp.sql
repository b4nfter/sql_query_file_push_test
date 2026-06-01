
DROP PROCEDURE IF EXISTS sp_insert_guest;
DELIMITER ;;
CREATE PROCEDURE `sp_insert_guest`(
    IN pi_name VARCHAR(100),
    IN pi_age  INT,
    OUT po_id BIGINT
)
BEGIN
    SET po_id = 0;

    IF pi_name IS NULL OR TRIM(pi_name) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'pi_name은 NULL 또는 빈 값일 수 없습니다.';
    END IF;

    IF pi_age IS NULL OR pi_age < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'pi_age는 NULL 또는 음수일 수 없습니다.';
    END IF;

    INSERT INTO tbl_guest (name, age)
        VALUES (pi_name, pi_age);

    SET po_id = LAST_INSERT_ID();
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_select_post_by_id;
DELIMITER ;;
CREATE PROCEDURE `sp_select_post_by_id`(
    IN pi_id BIGINT
)
BEGIN
    IF pi_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'pi_id는 NULL일 수 없습니다.';
    END IF;

    SELECT id, title, content
        FROM tbl_post
        WHERE id = pi_id;
END ;;
DELIMITER ;

