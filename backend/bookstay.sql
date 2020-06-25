/*
 Navicat Premium Data Transfer

 Source Server         : bookstay
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:8889
 Source Schema         : bookstay

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 22/06/2020 17:43:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for danhgia
-- ----------------------------
DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE `danhgia`  (
  `nguoiDung` int(11) NOT NULL,
  `danhGia` int(1) NULL DEFAULT NULL,
  `comment` varchar(10000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `phong` int(11) NOT NULL,
  PRIMARY KEY (`nguoiDung`, `phong`) USING BTREE,
  INDEX `PhongDuocDanhGia`(`phong`) USING BTREE,
  CONSTRAINT `nguoidungdanhgiaphong` FOREIGN KEY (`nguoiDung`) REFERENCES `nguoidung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `phongduocdanhgia` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for danhsachdatphong
-- ----------------------------
DROP TABLE IF EXISTS `danhsachdatphong`;
CREATE TABLE `danhsachdatphong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phong` int(11) NULL DEFAULT NULL,
  `gia` int(11) NULL DEFAULT NULL,
  `nguoidat` int(11) NULL DEFAULT NULL,
  `thoigiandat` datetime(6) NULL DEFAULT NULL,
  `songaydat` int(11) NULL DEFAULT NULL,
  `trangthai` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phongduocdat`(`phong`) USING BTREE,
  INDEX `nguoidatphong`(`nguoidat`) USING BTREE,
  CONSTRAINT `nguoidatphong` FOREIGN KEY (`nguoidat`) REFERENCES `nguoidung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `phongduocdat` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phong` int(11) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `phong`) USING BTREE,
  INDEX `phongcohinh`(`phong`) USING BTREE,
  CONSTRAINT `phongcohinh` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `sdt` varchar(10) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `gioitinh` bit(1) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `timeCreate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for phong
-- ----------------------------
DROP TABLE IF EXISTS `phong`;
CREATE TABLE `phong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `nguoiDang` int(11) NOT NULL,
  `diaChi` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `dienTich` int(11) NULL DEFAULT NULL,
  `giaNgayThuong` int(11) NULL DEFAULT NULL,
  `giaNgayCuoiTuan` int(11) NULL DEFAULT NULL,
  `soPhong` int(11) NULL DEFAULT NULL,
  `soGiuong` int(11) NULL DEFAULT NULL,
  `giaNgayLe` int(11) NULL DEFAULT NULL,
  `giaThang` int(11) NULL DEFAULT NULL,
  `soKhachToiDa` int(11) NULL DEFAULT NULL,
  `gioiThieu` varchar(11000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `luuY` varchar(10000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `thoiGianNhan` time(0) NULL DEFAULT NULL,
  `thoiGianTra` time(0) NULL DEFAULT NULL,
  `timeCreate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `trangThai` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PhongDuocDangBoi`(`nguoiDang`) USING BTREE,
  CONSTRAINT `PhongDuocDangBoi` FOREIGN KEY (`nguoiDang`) REFERENCES `nguoidung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tiennghi
-- ----------------------------
DROP TABLE IF EXISTS `tiennghi`;
CREATE TABLE `tiennghi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenTienNghi` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `icon` varchar(10000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `tiennghicategory` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tienNghiThuocCategory`(`tiennghicategory`) USING BTREE,
  CONSTRAINT `tienNghiThuocCategory` FOREIGN KEY (`tiennghicategory`) REFERENCES `tiennghicategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tiennghicategory
-- ----------------------------
DROP TABLE IF EXISTS `tiennghicategory`;
CREATE TABLE `tiennghicategory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenDanhMuc` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tiennghicuaphong
-- ----------------------------
DROP TABLE IF EXISTS `tiennghicuaphong`;
CREATE TABLE `tiennghicuaphong`  (
  `phong` int(11) NOT NULL,
  `tiennghi` int(11) NOT NULL,
  PRIMARY KEY (`phong`, `tiennghi`) USING BTREE,
  INDEX `tienNghiCuaPhong`(`tiennghi`) USING BTREE,
  CONSTRAINT `phongCoTienNghi` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tienNghiCuaPhong` FOREIGN KEY (`tiennghi`) REFERENCES `tiennghi` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
