/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL_HOME
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : dasach

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 19/11/2021 08:16:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbldiachi
-- ----------------------------
DROP TABLE IF EXISTS `tbldiachi`;
CREATE TABLE `tbldiachi`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sonha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `toanha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `xompho` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phuongxa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quanhuyen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tinhthanh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbldiachi
-- ----------------------------
INSERT INTO `tbldiachi` VALUES (1, 'A', 'B', 'C', 'D', 'E', 'HN');

-- ----------------------------
-- Table structure for tbldocgia
-- ----------------------------
DROP TABLE IF EXISTS `tbldocgia`;
CREATE TABLE `tbldocgia`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ngaysinh` date NULL DEFAULT NULL,
  `tbldiachiid` int NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dienthoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tbldocgia_2`(`tbldiachiid`) USING BTREE,
  CONSTRAINT `fk_tbldocgia_2` FOREIGN KEY (`tbldiachiid`) REFERENCES `tbldiachi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbldocgia
-- ----------------------------
INSERT INTO `tbldocgia` VALUES (1, 'HieuNT', '2021-11-30', 1, 'hieunt@gmail.com', '0132456789', 'Doc gia');

-- ----------------------------
-- Table structure for tbldocgiasach
-- ----------------------------
DROP TABLE IF EXISTS `tbldocgiasach`;
CREATE TABLE `tbldocgiasach`  (
  `tbldocgiaid` int NOT NULL,
  `tblsachid` int NOT NULL,
  PRIMARY KEY (`tblsachid`, `tbldocgiaid`) USING BTREE,
  INDEX `fk_docgiaid`(`tbldocgiaid`) USING BTREE,
  CONSTRAINT `fk_docgiaid` FOREIGN KEY (`tbldocgiaid`) REFERENCES `tbldocgia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sachid` FOREIGN KEY (`tblsachid`) REFERENCES `tblsach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbldocgiasach
-- ----------------------------
INSERT INTO `tbldocgiasach` VALUES (1, 1);

-- ----------------------------
-- Table structure for tblloaisach
-- ----------------------------
DROP TABLE IF EXISTS `tblloaisach`;
CREATE TABLE `tblloaisach`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tblloaisach
-- ----------------------------
INSERT INTO `tblloaisach` VALUES (1, 'LS01', 'Học Tập');

-- ----------------------------
-- Table structure for tblloaithongke
-- ----------------------------
DROP TABLE IF EXISTS `tblloaithongke`;
CREATE TABLE `tblloaithongke`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tblquanlyid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_loaithongkeid`(`tblquanlyid`) USING BTREE,
  CONSTRAINT `fk_loaithongkeid` FOREIGN KEY (`tblquanlyid`) REFERENCES `tblquanly` (`tblthanhvienid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tblloaithongke
-- ----------------------------
INSERT INTO `tblloaithongke` VALUES (1, '1', 'Thống kê sách theo lượt mượn', 1);
INSERT INTO `tblloaithongke` VALUES (2, '1', 'Thống kê sách theo tác giả', 1);

-- ----------------------------
-- Table structure for tblnhaxuatban
-- ----------------------------
DROP TABLE IF EXISTS `tblnhaxuatban`;
CREATE TABLE `tblnhaxuatban`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tbldiachiid` int NULL DEFAULT NULL,
  `sdt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tblnxb`(`tbldiachiid`) USING BTREE,
  CONSTRAINT `fk_tblnxb` FOREIGN KEY (`tbldiachiid`) REFERENCES `tbldiachi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblnhaxuatban
-- ----------------------------
INSERT INTO `tblnhaxuatban` VALUES (1, 'Kim Đồng', 1, '0123456789');

-- ----------------------------
-- Table structure for tblphieu
-- ----------------------------
DROP TABLE IF EXISTS `tblphieu`;
CREATE TABLE `tblphieu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `soluongsach` int NULL DEFAULT NULL,
  `tblthoigianid` int NULL DEFAULT NULL,
  `tbldocgiaid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_thoigianid`(`tblthoigianid`) USING BTREE,
  INDEX `fk_phieu_tbldocgiaid`(`tbldocgiaid`) USING BTREE,
  CONSTRAINT `fk_phieu_tbldocgiaid` FOREIGN KEY (`tbldocgiaid`) REFERENCES `tbldocgia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_thoigianid` FOREIGN KEY (`tblthoigianid`) REFERENCES `tblthoigian` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieu
-- ----------------------------
INSERT INTO `tblphieu` VALUES (1, 4, 1, 1);

-- ----------------------------
-- Table structure for tblphieumuon
-- ----------------------------
DROP TABLE IF EXISTS `tblphieumuon`;
CREATE TABLE `tblphieumuon`  (
  `tblphieuid` int NOT NULL,
  PRIMARY KEY (`tblphieuid`) USING BTREE,
  CONSTRAINT `fk_tblphieumuon` FOREIGN KEY (`tblphieuid`) REFERENCES `tblphieu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieumuon
-- ----------------------------
INSERT INTO `tblphieumuon` VALUES (1);

-- ----------------------------
-- Table structure for tblphieusach
-- ----------------------------
DROP TABLE IF EXISTS `tblphieusach`;
CREATE TABLE `tblphieusach`  (
  `tblphieuid` int NOT NULL,
  `tblsachid` int NOT NULL,
  `trangthai` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`tblsachid`, `tblphieuid`) USING BTREE,
  INDEX `fk_tblphieusach_phieid`(`tblphieuid`) USING BTREE,
  CONSTRAINT `fk_tblphieusach_phieid` FOREIGN KEY (`tblphieuid`) REFERENCES `tblphieu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tblphieusach_sachid` FOREIGN KEY (`tblsachid`) REFERENCES `tblsach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieusach
-- ----------------------------
INSERT INTO `tblphieusach` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for tblphieutra
-- ----------------------------
DROP TABLE IF EXISTS `tblphieutra`;
CREATE TABLE `tblphieutra`  (
  `tblphieuid` int NOT NULL,
  `tienphat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tblphieuid`) USING BTREE,
  CONSTRAINT `tblphieutrafk` FOREIGN KEY (`tblphieuid`) REFERENCES `tblphieu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieutra
-- ----------------------------
INSERT INTO `tblphieutra` VALUES (1, '300.000');

-- ----------------------------
-- Table structure for tblquanly
-- ----------------------------
DROP TABLE IF EXISTS `tblquanly`;
CREATE TABLE `tblquanly`  (
  `vitri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tblthanhvienid` int NOT NULL,
  PRIMARY KEY (`tblthanhvienid`) USING BTREE,
  CONSTRAINT `fk_tblquanly1` FOREIGN KEY (`tblthanhvienid`) REFERENCES `tblthanhvien` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblquanly
-- ----------------------------
INSERT INTO `tblquanly` VALUES ('ROLE_QUANLY', 1);

-- ----------------------------
-- Table structure for tblsach
-- ----------------------------
DROP TABLE IF EXISTS `tblsach`;
CREATE TABLE `tblsach`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mavach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `soluotmuon` int NULL DEFAULT NULL,
  `tblnhaxuanbanid` int NULL DEFAULT NULL,
  `tblloaisachid` int NULL DEFAULT NULL,
  `masach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tblsach_nxbid`(`tblnhaxuanbanid`) USING BTREE,
  INDEX `fk_tblsach_loaisachid`(`tblloaisachid`) USING BTREE,
  CONSTRAINT `fk_tblsach_loaisachid` FOREIGN KEY (`tblloaisachid`) REFERENCES `tblloaisach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tblsach_nxbid` FOREIGN KEY (`tblnhaxuanbanid`) REFERENCES `tblnhaxuatban` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsach
-- ----------------------------
INSERT INTO `tblsach` VALUES (1, 'Toán cao cấp 1', 'MAVACH123', 5, 1, 1, 'TCC1');

-- ----------------------------
-- Table structure for tblsachtacgia
-- ----------------------------
DROP TABLE IF EXISTS `tblsachtacgia`;
CREATE TABLE `tblsachtacgia`  (
  `tblsachid` int NOT NULL,
  `tbltacgiaid` int NOT NULL,
  PRIMARY KEY (`tbltacgiaid`, `tblsachid`) USING BTREE,
  INDEX `fk_sachtacgia_1`(`tblsachid`) USING BTREE,
  CONSTRAINT `fk_sachtacgia_1` FOREIGN KEY (`tblsachid`) REFERENCES `tblsach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sachtacgia_2` FOREIGN KEY (`tbltacgiaid`) REFERENCES `tbltacgia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsachtacgia
-- ----------------------------
INSERT INTO `tblsachtacgia` VALUES (1, 1);

-- ----------------------------
-- Table structure for tbltacgia
-- ----------------------------
DROP TABLE IF EXISTS `tbltacgia`;
CREATE TABLE `tbltacgia`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbltacgia
-- ----------------------------
INSERT INTO `tbltacgia` VALUES (1, 'TG1');

-- ----------------------------
-- Table structure for tblthanhvien
-- ----------------------------
DROP TABLE IF EXISTS `tblthanhvien`;
CREATE TABLE `tblthanhvien`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ngaysinh` date NULL DEFAULT NULL,
  `tbldiachiid` int NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dienthoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_thanhvien`(`tbldiachiid`) USING BTREE,
  CONSTRAINT `fk_thanhvien` FOREIGN KEY (`tbldiachiid`) REFERENCES `tbldiachi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthanhvien
-- ----------------------------
INSERT INTO `tblthanhvien` VALUES (1, 'quanly', '$2a$10$t8LRphlCvzDx.GLsHs.b5uHo1pj8hjjJTJrC1AZbrK4egDAf3ydim', 'Nguyen van a', '2021-11-14', 1, 'quanly@gmail.com', '12345', 'Test');

-- ----------------------------
-- Table structure for tblthoigian
-- ----------------------------
DROP TABLE IF EXISTS `tblthoigian`;
CREATE TABLE `tblthoigian`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngaymuon` date NULL DEFAULT NULL,
  `ngaytra` date NULL DEFAULT NULL,
  `tongngaymuon` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthoigian
-- ----------------------------
INSERT INTO `tblthoigian` VALUES (1, '2021-11-18', '2021-11-23', 3);

SET FOREIGN_KEY_CHECKS = 1;
