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

 Date: 18/11/2021 07:46:59
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `tblphieuid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tbldocgia_phieuid`(`tblphieuid`) USING BTREE,
  INDEX `fk_tbldocgia_2`(`tbldiachiid`) USING BTREE,
  CONSTRAINT `fk_tbldocgia_2` FOREIGN KEY (`tbldiachiid`) REFERENCES `tbldiachi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tbldocgia_phieuid` FOREIGN KEY (`tblphieuid`) REFERENCES `tblphieu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldocgia
-- ----------------------------

-- ----------------------------
-- Table structure for tbldocgiasach
-- ----------------------------
DROP TABLE IF EXISTS `tbldocgiasach`;
CREATE TABLE `tbldocgiasach`  (
  `tbldocgiaid` int NOT NULL,
  `luotmuon` int NULL DEFAULT NULL,
  `tblsachid` int NOT NULL,
  PRIMARY KEY (`tblsachid`, `tbldocgiaid`) USING BTREE,
  INDEX `fk_docgiaid`(`tbldocgiaid`) USING BTREE,
  CONSTRAINT `fk_docgiaid` FOREIGN KEY (`tbldocgiaid`) REFERENCES `tbldocgia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sachid` FOREIGN KEY (`tblsachid`) REFERENCES `tblsach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbldocgiasach
-- ----------------------------

-- ----------------------------
-- Table structure for tblloaisach
-- ----------------------------
DROP TABLE IF EXISTS `tblloaisach`;
CREATE TABLE `tblloaisach`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblloaisach
-- ----------------------------

-- ----------------------------
-- Table structure for tblloaithongke
-- ----------------------------
DROP TABLE IF EXISTS `tblloaithongke`;
CREATE TABLE `tblloaithongke`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tbl_quan_ly_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_loaithongkeid`(`tbl_quan_ly_id`) USING BTREE,
  CONSTRAINT `fk_loaithongkeid` FOREIGN KEY (`tbl_quan_ly_id`) REFERENCES `tblquanly` (`tblquanlyid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblloaithongke
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblnhaxuatban
-- ----------------------------

-- ----------------------------
-- Table structure for tblphieu
-- ----------------------------
DROP TABLE IF EXISTS `tblphieu`;
CREATE TABLE `tblphieu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `soluong` int NULL DEFAULT NULL,
  `tblthoigianid` int NULL DEFAULT NULL,
  `tbldocgiaid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_thoigianid`(`tblthoigianid`) USING BTREE,
  INDEX `fk_tbldocgiaid`(`tbldocgiaid`) USING BTREE,
  CONSTRAINT `fk_tbldocgiaid` FOREIGN KEY (`tbldocgiaid`) REFERENCES `tbldocgia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_thoigianid` FOREIGN KEY (`tblthoigianid`) REFERENCES `tblthoigian` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieu
-- ----------------------------

-- ----------------------------
-- Table structure for tblphieumuon
-- ----------------------------
DROP TABLE IF EXISTS `tblphieumuon`;
CREATE TABLE `tblphieumuon`  (
  `tbltphieuid` int NOT NULL,
  INDEX `fk_phieumuonid`(`tbltphieuid`) USING BTREE,
  CONSTRAINT `fk_phieumuonid` FOREIGN KEY (`tbltphieuid`) REFERENCES `tblphieu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieumuon
-- ----------------------------

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

-- ----------------------------
-- Table structure for tblphieutra
-- ----------------------------
DROP TABLE IF EXISTS `tblphieutra`;
CREATE TABLE `tblphieutra`  (
  `tienphat` double NULL DEFAULT NULL,
  `tblphieutraid` int NOT NULL,
  INDEX `fk_tblphieutraid`(`tblphieutraid`) USING BTREE,
  CONSTRAINT `fk_tblphieutraid` FOREIGN KEY (`tblphieutraid`) REFERENCES `tblphieu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblphieutra
-- ----------------------------

-- ----------------------------
-- Table structure for tblquanly
-- ----------------------------
DROP TABLE IF EXISTS `tblquanly`;
CREATE TABLE `tblquanly`  (
  `vitri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tblquanlyid` int NOT NULL,
  PRIMARY KEY (`tblquanlyid`) USING BTREE,
  CONSTRAINT `fk_tblquanly1` FOREIGN KEY (`tblquanlyid`) REFERENCES `tblthanhvien` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
  `mavach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `soluotmuon` int NULL DEFAULT NULL,
  `tblnhaxuanbanid` int NULL DEFAULT NULL,
  `tblloaisachid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tblsach_nxbid`(`tblnhaxuanbanid`) USING BTREE,
  INDEX `fk_tblsach_loaisachid`(`tblloaisachid`) USING BTREE,
  CONSTRAINT `fk_tblsach_loaisachid` FOREIGN KEY (`tblloaisachid`) REFERENCES `tblloaisach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tblsach_nxbid` FOREIGN KEY (`tblnhaxuanbanid`) REFERENCES `tblnhaxuatban` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsach
-- ----------------------------

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

-- ----------------------------
-- Table structure for tbltacgia
-- ----------------------------
DROP TABLE IF EXISTS `tbltacgia`;
CREATE TABLE `tbltacgia`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbltacgia
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblthoigian
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
