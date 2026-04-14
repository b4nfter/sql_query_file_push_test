
DROP TABLE IF EXISTS `tbl_guest`;
CREATE TABLE `tbl_guest` (
    id BIGINT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    balance DECIMAL(10,2) DEFAULT 0.00,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
    id BIGINT AUTO_INCREMENT,
    order_number VARCHAR(50) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    order_amount DECIMAL(12,2) DEFAULT 0.00,
    status ENUM('pending', 'completed', 'cancelled') DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    memo MEDIUMTEXT NOT NULL DEFAULT (''),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
    id BIGINT AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    view_count INT DEFAULT 0,
    is_published BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB;


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

