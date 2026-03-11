
DROP TABLE IF EXISTS `tbl_guest`;
CREATE TABLE `tbl_guest` (
    id BIGINT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT DEFAULT NULL,
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

