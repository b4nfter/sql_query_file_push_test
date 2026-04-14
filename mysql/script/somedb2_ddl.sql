
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


DROP TABLE IF EXISTS `tbl_performance`;
CREATE TABLE `tbl_performance` (
    id BIGINT AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    endpoint VARCHAR(200)  NOT NULL,
    method ENUM('GET', 'POST', 'PUT', 'DELETE', 'PATCH') NOT NULL,
    status_code SMALLINT UNSIGNED NOT NULL,
    duration_ms INT UNSIGNED NOT NULL COMMENT '응답 소요 시간 (밀리초)',
    memory_mb DECIMAL(8,2) DEFAULT 0.00 COMMENT '메모리 사용량 (MB)',
    cpu_percent DECIMAL(5,2) DEFAULT 0.00 COMMENT 'CPU 사용률 (%)',
    is_slow BOOLEAN DEFAULT FALSE COMMENT '느린 응답 여부 (임계값 초과)',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB;

