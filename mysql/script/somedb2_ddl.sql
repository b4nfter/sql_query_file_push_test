
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
    id BIGINT AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    action VARCHAR(100) NOT NULL,
    ip_address VARCHAR(45),
    success BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
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

