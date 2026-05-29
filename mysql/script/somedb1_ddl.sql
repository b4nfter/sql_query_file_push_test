
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

