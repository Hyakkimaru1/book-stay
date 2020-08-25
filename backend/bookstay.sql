/*
 Navicat Premium Data Transfer

 Source Server         : bookstay
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:8889
 Source Schema         : bookstay

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 25/08/2020 11:37:33
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'duy', '$2a$10$QPsZmptj0xIs20moQmF1teK7DFUMJI.2TUzzs.0QX1FHC.mEiiy0O');

-- ----------------------------
-- Table structure for danhgia
-- ----------------------------
DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE `danhgia`  (
  `nguoiDung` int(0) NULL DEFAULT NULL,
  `danhGia` int(0) NULL DEFAULT NULL,
  `comment` varchar(10000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `phong` int(0) NULL DEFAULT NULL,
  `dondatphong` int(0) NOT NULL,
  PRIMARY KEY (`dondatphong`) USING BTREE,
  INDEX `PhongDuocDanhGia`(`phong`) USING BTREE,
  CONSTRAINT `donduocdanhgia` FOREIGN KEY (`dondatphong`) REFERENCES `danhsachdatphong` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danhgia
-- ----------------------------
INSERT INTO `danhgia` VALUES (1, 5, 'dep qua', 1, 8);
INSERT INTO `danhgia` VALUES (1, 4, 'pretty nice', 1, 9);
INSERT INTO `danhgia` VALUES (1, 2, '123', 1, 10);
INSERT INTO `danhgia` VALUES (1, 5, 'đi 5 lần rồi. Rất là đẹp nha mọi người ơi', 1, 13);
INSERT INTO `danhgia` VALUES (1, 5, 'hehe', 49, 14);
INSERT INTO `danhgia` VALUES (1, 5, 'yep', 1, 16);
INSERT INTO `danhgia` VALUES (4, 5, 'Khá đẹp ', 1, 81);

-- ----------------------------
-- Table structure for danhsachdatphong
-- ----------------------------
DROP TABLE IF EXISTS `danhsachdatphong`;
CREATE TABLE `danhsachdatphong`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `phong` int(0) NULL DEFAULT NULL,
  `gia` int(0) NULL DEFAULT NULL,
  `nguoidat` int(0) NULL DEFAULT NULL,
  `ngaycheckin` date NULL DEFAULT NULL,
  `ngaydatphong` datetime(1) NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `ngaycheckout` date NULL DEFAULT NULL,
  `trangthai` int(0) NULL DEFAULT 0,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `sdt` varchar(11) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `sokhach` int(0) NULL DEFAULT NULL,
  `transId` char(40) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phongduocdat`(`phong`) USING BTREE,
  INDEX `nguoidatphong`(`nguoidat`) USING BTREE,
  FULLTEXT INDEX `ten`(`ten`),
  FULLTEXT INDEX `email`(`email`, `sdt`),
  FULLTEXT INDEX `email_2`(`email`, `sdt`, `ten`),
  FULLTEXT INDEX `ten_2`(`ten`, `email`),
  FULLTEXT INDEX `ten_3`(`ten`, `email`, `sdt`),
  CONSTRAINT `nguoidatphong` FOREIGN KEY (`nguoidat`) REFERENCES `nguoidung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `phongduocdat` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danhsachdatphong
-- ----------------------------
INSERT INTO `danhsachdatphong` VALUES (8, 1, 672000, 1, '2020-06-27', '2020-07-19 20:53:03.3', '2020-06-29', 1, 'Đa đa', 'a', '0355196515', 2, NULL);
INSERT INTO `danhsachdatphong` VALUES (9, 1, 672000, 1, '2020-06-27', '2020-07-19 20:53:04.4', '2020-06-29', 1, 'đại đa', 'a', '0355196515', 5, NULL);
INSERT INTO `danhsachdatphong` VALUES (10, 1, 672000, 1, '2020-06-27', '2020-07-19 20:53:05.0', '2020-06-29', 1, 'Duy nhẫn', 'a', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (11, 1, 672000, 1, '2020-06-27', '2020-07-19 20:53:05.6', '2020-06-29', 1, 'Duy', 'a', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (12, 1, 672000, 1, '2020-06-27', '2020-07-19 20:53:06.3', '2020-06-29', 1, 'hyakkiamru', 'a', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (13, 1, 672000, 1, '2020-06-27', '2020-07-19 20:53:06.8', '2020-06-29', 1, 'ghi đại', 'a', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (14, 49, 672000, 1, '2020-06-27', '2020-08-16 20:48:34.4', '2020-06-29', 1, '404', 'a', '0355196515', 2, NULL);
INSERT INTO `danhsachdatphong` VALUES (15, 2, 957600, 1, '2020-06-27', '2020-08-16 22:14:07.7', '2020-06-30', 1, 'tên bậy', 'a', '0355196515', 3, NULL);
INSERT INTO `danhsachdatphong` VALUES (16, 1, 856800, 1, '2020-07-14', '2020-07-19 20:53:09.9', '2020-07-17', 1, 'hahaa', 'a', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (17, 1, 856800, 1, '2020-08-25', '2020-08-20 15:08:38.2', '2020-08-18', -1, 'test 1', 'a', '0355196515', 2, NULL);
INSERT INTO `danhsachdatphong` VALUES (18, 1, 1254400, 1, '2020-07-31', '2020-07-27 22:24:06.0', '2020-08-04', 0, '', '', '', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (19, 1, 873600, 1, '2020-08-03', '2020-07-28 23:56:16.3', '2020-08-06', 0, 'Duy', 'a', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (22, 49, 26510400, 4, '2020-08-11', '2020-08-03 19:09:29.6', '2020-08-14', -1, 'Huynh Duy', 'a@gmail.com', '', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (23, 1, 873600, 1, '2020-08-04', '2020-08-03 23:15:54.7', '2020-08-07', -1, 'Duy', 'duy8199@gmail.com', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (77, 29, 291200, 4, '2020-08-05', '2020-08-16 22:38:14.9', '2020-08-06', 1, 'Huynh Duy', 'a@gmail.com', '', 1, '2322652001');
INSERT INTO `danhsachdatphong` VALUES (78, 49, 336000, 4, '2020-08-18', '2020-08-17 13:41:31.1', '2020-08-09', 1, 'Huynh Duy', 'a@gmail.com', '', 1, '2322652224');
INSERT INTO `danhsachdatphong` VALUES (79, 1, 291200, 4, '2020-08-18', '2020-08-17 17:36:08.0', '2020-08-19', -1, 'Huynh Duy', 'a@gmail.com', '', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (80, 2, 291200, 4, '2020-08-26', '2020-08-25 00:45:53.1', '2020-08-27', -1, 'Huynh Duy', 'a@gmail.com', '', 1, '2322652688');
INSERT INTO `danhsachdatphong` VALUES (81, 1, 291200, 4, '2020-08-27', '2020-08-25 00:15:24.3', '2020-08-28', -1, 'Huynh Duy', 'a@gmail.com', '0355196515', 1, '2323818535');
INSERT INTO `danhsachdatphong` VALUES (82, 1, 291200, 4, '2020-08-26', '2020-08-25 00:17:57.7', '2020-08-27', -1, 'Huynh Duy', 'a@gmail.com', '', 1, '2323818565');
INSERT INTO `danhsachdatphong` VALUES (83, 1, 291200, 4, '2020-08-25', '2020-08-22 18:10:11.3', '2020-08-26', -1, 'Huynh Duy', 'a@gmail.com', '', 1, '2323818624');
INSERT INTO `danhsachdatphong` VALUES (84, 1, 291200, 4, '2020-08-27', '2020-08-25 01:38:34.3', '2020-08-28', 1, 'Huynh Duy', 'a@gmail.com', '', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (85, 1, 582400, 4, '2020-08-26', '2020-08-22 17:51:11.9', '2020-08-28', 0, 'Huynh Huu Duy', 'Du@gmail.com', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (86, 1, 291200, 4, '2020-08-26', '2020-08-25 00:45:16.0', '2020-08-27', 0, 'Huynh Duy', 'a@gmail.com', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (89, 1, 291200, 4, '2020-08-27', '2020-08-25 01:38:31.4', '2020-08-28', 1, 'Huynh Duy', 'a@gmail.com', '0355196515', 1, NULL);
INSERT INTO `danhsachdatphong` VALUES (90, 1, 336000, 4, '2020-08-30', '2020-08-25 00:59:52.7', '2020-08-31', -1, 'Huynh Duy', 'a@gmail.com', '0355196515', 1, NULL);

-- ----------------------------
-- Table structure for hetphong
-- ----------------------------
DROP TABLE IF EXISTS `hetphong`;
CREATE TABLE `hetphong`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `phong` int(0) NULL DEFAULT NULL,
  `ngayHetPhong` date NULL DEFAULT NULL,
  `permission` int(0) NULL DEFAULT 0,
  `sophongconlai` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hetphong`(`phong`) USING BTREE,
  CONSTRAINT `hetphong` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hetphong
-- ----------------------------
INSERT INTO `hetphong` VALUES (1, 1, '2020-07-21', 0, 1);
INSERT INTO `hetphong` VALUES (9, 1, '2020-07-30', 1, 1);
INSERT INTO `hetphong` VALUES (11, 1, '2020-07-29', 1, 1);
INSERT INTO `hetphong` VALUES (18, 1, '2020-07-31', 1, 1);
INSERT INTO `hetphong` VALUES (91, 1, '2020-08-05', 0, 1);
INSERT INTO `hetphong` VALUES (92, 1, '2020-08-08', 0, 1);
INSERT INTO `hetphong` VALUES (93, 1, '2020-08-13', 0, 1);
INSERT INTO `hetphong` VALUES (94, 1, '2020-08-24', 0, 1);
INSERT INTO `hetphong` VALUES (96, 2, '2020-08-12', 1, 1);
INSERT INTO `hetphong` VALUES (97, 1, '2020-08-11', 1, 1);
INSERT INTO `hetphong` VALUES (98, 1, '2020-08-14', 1, 1);
INSERT INTO `hetphong` VALUES (99, 50, '2020-08-11', 1, 0);
INSERT INTO `hetphong` VALUES (100, 1, '2020-08-15', 1, 1);
INSERT INTO `hetphong` VALUES (101, 50, '2020-08-12', 1, 0);
INSERT INTO `hetphong` VALUES (105, 1, '2020-08-20', 0, 1);
INSERT INTO `hetphong` VALUES (109, 2, '2020-08-24', 1, 0);
INSERT INTO `hetphong` VALUES (110, 1, '2020-08-26', 0, 1);
INSERT INTO `hetphong` VALUES (111, 1, '2020-08-27', 0, 0);
INSERT INTO `hetphong` VALUES (113, 49, '2020-08-24', 1, 0);
INSERT INTO `hetphong` VALUES (114, 49, '2020-08-26', 1, 0);
INSERT INTO `hetphong` VALUES (117, 1, '2020-08-30', 0, 2);
INSERT INTO `hetphong` VALUES (118, 1, '2020-08-29', 0, 2);

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `phong` int(0) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phongcohinh`(`phong`) USING BTREE,
  CONSTRAINT `phongcohinh` FOREIGN KEY (`phong`) REFERENCES `phong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 268 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES (7, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_1_1567705428.jpg');
INSERT INTO `img` VALUES (8, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_2_1567705504.jpg');
INSERT INTO `img` VALUES (10, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_3_1567705644.jpg');
INSERT INTO `img` VALUES (11, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_4_1567705646.jpg');
INSERT INTO `img` VALUES (12, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_7_1567705770.jpg');
INSERT INTO `img` VALUES (13, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_6_1567705653.jpg');
INSERT INTO `img` VALUES (14, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_8_1567705772.jpg');
INSERT INTO `img` VALUES (15, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_5_1567705650.jpg');
INSERT INTO `img` VALUES (16, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_2_1562351651.jpg');
INSERT INTO `img` VALUES (17, 2, 'https://cdn.luxstay.com/rooms/27263/large/room_27263_8_1562351661.jpg');
INSERT INTO `img` VALUES (26, 29, 'http://localhost:3300/imgs/29/file-1592651848152');
INSERT INTO `img` VALUES (27, 29, 'http://localhost:3300/imgs/29/file-1592651848162');
INSERT INTO `img` VALUES (28, 29, 'http://localhost:3300/imgs/29/file-1592651848178');
INSERT INTO `img` VALUES (29, 29, 'http://localhost:3300/imgs/29/file-1592651848229');
INSERT INTO `img` VALUES (30, 29, 'http://localhost:3300/imgs/29/file-1592651848232');
INSERT INTO `img` VALUES (31, 29, 'http://localhost:3300/imgs/29/file-1592651848233');
INSERT INTO `img` VALUES (32, 29, 'http://localhost:3300/imgs/29/file-1592651848230');
INSERT INTO `img` VALUES (33, 30, 'http://localhost:3300/imgs/30/file-1592652383899');
INSERT INTO `img` VALUES (34, 30, 'http://localhost:3300/imgs/30/file-1592652383916');
INSERT INTO `img` VALUES (35, 30, 'http://localhost:3300/imgs/30/file-1592652383929');
INSERT INTO `img` VALUES (36, 30, 'http://localhost:3300/imgs/30/file-1592652383930');
INSERT INTO `img` VALUES (37, 30, 'http://localhost:3300/imgs/30/file-1592652383949');
INSERT INTO `img` VALUES (38, 30, 'http://localhost:3300/imgs/30/file-1592652383950');
INSERT INTO `img` VALUES (39, 30, 'http://localhost:3300/imgs/30/file-1592652383962');
INSERT INTO `img` VALUES (40, 30, 'http://localhost:3300/imgs/30/file-1592652383970');
INSERT INTO `img` VALUES (41, 30, 'http://localhost:3300/imgs/30/file-1592652383978');
INSERT INTO `img` VALUES (42, 31, 'http://localhost:3300/imgs/31/file-1592652424275');
INSERT INTO `img` VALUES (43, 31, 'http://localhost:3300/imgs/31/file-1592652424289');
INSERT INTO `img` VALUES (44, 31, 'http://localhost:3300/imgs/31/file-1592652424303');
INSERT INTO `img` VALUES (45, 31, 'http://localhost:3300/imgs/31/file-1592652424303');
INSERT INTO `img` VALUES (46, 31, 'http://localhost:3300/imgs/31/file-1592652424321');
INSERT INTO `img` VALUES (47, 31, 'http://localhost:3300/imgs/31/file-1592652424321');
INSERT INTO `img` VALUES (48, 31, 'http://localhost:3300/imgs/31/file-1592652424331');
INSERT INTO `img` VALUES (49, 31, 'http://localhost:3300/imgs/31/file-1592652424338');
INSERT INTO `img` VALUES (50, 31, 'http://localhost:3300/imgs/31/file-1592652424345');
INSERT INTO `img` VALUES (51, 34, 'http://localhost:3300/imgs/34/file-1592652658465');
INSERT INTO `img` VALUES (52, 34, 'http://localhost:3300/imgs/34/file-1592652658486');
INSERT INTO `img` VALUES (53, 34, 'http://localhost:3300/imgs/34/file-1592652658500');
INSERT INTO `img` VALUES (54, 34, 'http://localhost:3300/imgs/34/file-1592652658500');
INSERT INTO `img` VALUES (55, 34, 'http://localhost:3300/imgs/34/file-1592652658519');
INSERT INTO `img` VALUES (56, 34, 'http://localhost:3300/imgs/34/file-1592652658520');
INSERT INTO `img` VALUES (57, 34, 'http://localhost:3300/imgs/34/file-1592652658532');
INSERT INTO `img` VALUES (58, 34, 'http://localhost:3300/imgs/34/file-1592652658542');
INSERT INTO `img` VALUES (59, 34, 'http://localhost:3300/imgs/34/file-1592652658551');
INSERT INTO `img` VALUES (60, 35, 'http://localhost:3300/imgs/35/file-1592652717341');
INSERT INTO `img` VALUES (61, 35, 'http://localhost:3300/imgs/35/file-1592652717359');
INSERT INTO `img` VALUES (62, 35, 'http://localhost:3300/imgs/35/file-1592652717372');
INSERT INTO `img` VALUES (63, 35, 'http://localhost:3300/imgs/35/file-1592652717373');
INSERT INTO `img` VALUES (64, 35, 'http://localhost:3300/imgs/35/file-1592652717391');
INSERT INTO `img` VALUES (65, 35, 'http://localhost:3300/imgs/35/file-1592652717392');
INSERT INTO `img` VALUES (66, 35, 'http://localhost:3300/imgs/35/file-1592652717404');
INSERT INTO `img` VALUES (67, 35, 'http://localhost:3300/imgs/35/file-1592652717411');
INSERT INTO `img` VALUES (68, 35, 'http://localhost:3300/imgs/35/file-1592652717419');
INSERT INTO `img` VALUES (69, 37, 'http://localhost:3300/imgs/37/file-1592653618830');
INSERT INTO `img` VALUES (70, 37, 'http://localhost:3300/imgs/37/file-1592653618843');
INSERT INTO `img` VALUES (71, 37, 'http://localhost:3300/imgs/37/file-1592653618859');
INSERT INTO `img` VALUES (72, 37, 'http://localhost:3300/imgs/37/file-1592653618863');
INSERT INTO `img` VALUES (73, 37, 'http://localhost:3300/imgs/37/file-1592653618890');
INSERT INTO `img` VALUES (74, 37, 'http://localhost:3300/imgs/37/file-1592653618893');
INSERT INTO `img` VALUES (75, 37, 'http://localhost:3300/imgs/37/file-1592653618904');
INSERT INTO `img` VALUES (76, 37, 'http://localhost:3300/imgs/37/file-1592653618916');
INSERT INTO `img` VALUES (77, 37, 'http://localhost:3300/imgs/37/file-1592653618924');
INSERT INTO `img` VALUES (78, 38, 'http://localhost:3300/imgs/38/file-1592749731955');
INSERT INTO `img` VALUES (162, 1, 'http://localhost:3300/imgs/1/file-1595766823007');
INSERT INTO `img` VALUES (163, 1, 'http://localhost:3300/imgs/1/file-1595766823022');
INSERT INTO `img` VALUES (164, 1, 'http://localhost:3300/imgs/1/file-1595766823044');
INSERT INTO `img` VALUES (165, 1, 'http://localhost:3300/imgs/1/file-1595766823044');
INSERT INTO `img` VALUES (166, 1, 'http://localhost:3300/imgs/1/file-1595766823064');
INSERT INTO `img` VALUES (167, 1, 'http://localhost:3300/imgs/1/file-1595766823065');
INSERT INTO `img` VALUES (168, 1, 'http://localhost:3300/imgs/1/file-1595766823084');
INSERT INTO `img` VALUES (169, 1, 'http://localhost:3300/imgs/1/file-1595766823096');
INSERT INTO `img` VALUES (170, 1, 'http://localhost:3300/imgs/1/file-1595766823108');
INSERT INTO `img` VALUES (210, 28, 'http://localhost:3300/imgs/28/file-room_30858_138_1566805883.jpg');
INSERT INTO `img` VALUES (211, 28, 'http://localhost:3300/imgs/28/file-room_30858_139_1566805885.jpg');
INSERT INTO `img` VALUES (212, 28, 'http://localhost:3300/imgs/28/file-room_30858_140_1566805886.jpg');
INSERT INTO `img` VALUES (213, 28, 'http://localhost:3300/imgs/28/file-room_30858_141_1566805887.jpg');
INSERT INTO `img` VALUES (214, 28, 'http://localhost:3300/imgs/28/file-room_30858_142_1566805888.jpg');
INSERT INTO `img` VALUES (215, 28, 'http://localhost:3300/imgs/28/file-room_30858_143_1566805890.jpg');
INSERT INTO `img` VALUES (216, 28, 'http://localhost:3300/imgs/28/file-room_30858_144_1566805891.jpg');
INSERT INTO `img` VALUES (220, 49, 'http://localhost:3300/imgs/49/file-1sHqDRzxWJaiunrm8VbCvOlG.jpg');
INSERT INTO `img` VALUES (221, 49, 'http://localhost:3300/imgs/49/file-5eDXfZ37SzrOhAgMegiQAp6C.jpg');
INSERT INTO `img` VALUES (222, 49, 'http://localhost:3300/imgs/49/file-5joRk8xJm0QpeJIcAg_pIpZj.jpg');
INSERT INTO `img` VALUES (223, 49, 'http://localhost:3300/imgs/49/file-7yLGNpZE_YKSJEa6sRWVOlGp.jpg');
INSERT INTO `img` VALUES (224, 49, 'http://localhost:3300/imgs/49/file-8MpPu2cVCF6yTfYSwEmRXebd.jpg');
INSERT INTO `img` VALUES (225, 49, 'http://localhost:3300/imgs/49/file-65ayHJrWb3B5zXmUpz9_1ZvS.jpg');
INSERT INTO `img` VALUES (226, 49, 'http://localhost:3300/imgs/49/file-dRyTboTfYtX5qx4dlj68EoOQ.jpg');
INSERT INTO `img` VALUES (227, 49, 'http://localhost:3300/imgs/49/file-dvgNsZ5mGISE1LdMlRJnTyWA.jpg');
INSERT INTO `img` VALUES (228, 49, 'http://localhost:3300/imgs/49/file-dwIZr9RtPmq0lUApVECQntAS.jpg');
INSERT INTO `img` VALUES (229, 49, 'http://localhost:3300/imgs/49/file-fNVZ4t-fh4pMSdynkcbfNkgd.jpg');
INSERT INTO `img` VALUES (230, 49, 'http://localhost:3300/imgs/49/file-H_5QzmLLQm4Sy2VRUPqYQ0I6.jpg');
INSERT INTO `img` VALUES (231, 50, 'http://localhost:3300/imgs/50/file-1sHqDRzxWJaiunrm8VbCvOlG.jpg');
INSERT INTO `img` VALUES (232, 50, 'http://localhost:3300/imgs/50/file-5eDXfZ37SzrOhAgMegiQAp6C.jpg');
INSERT INTO `img` VALUES (233, 50, 'http://localhost:3300/imgs/50/file-5joRk8xJm0QpeJIcAg_pIpZj.jpg');
INSERT INTO `img` VALUES (234, 50, 'http://localhost:3300/imgs/50/file-7yLGNpZE_YKSJEa6sRWVOlGp.jpg');
INSERT INTO `img` VALUES (235, 50, 'http://localhost:3300/imgs/50/file-65ayHJrWb3B5zXmUpz9_1ZvS.jpg');
INSERT INTO `img` VALUES (236, 50, 'http://localhost:3300/imgs/50/file-dRyTboTfYtX5qx4dlj68EoOQ.jpg');
INSERT INTO `img` VALUES (237, 50, 'http://localhost:3300/imgs/50/file-dwIZr9RtPmq0lUApVECQntAS.jpg');
INSERT INTO `img` VALUES (238, 50, 'http://localhost:3300/imgs/50/file-H_5QzmLLQm4Sy2VRUPqYQ0I6.jpg');
INSERT INTO `img` VALUES (239, 50, 'http://localhost:3300/imgs/50/file-hRLzjFi1Uqng3tlrJvzo6Cvb.jpg');
INSERT INTO `img` VALUES (240, 50, 'http://localhost:3300/imgs/50/file-ibB-JXBfsyyKT8ibkophCYps.jpg');
INSERT INTO `img` VALUES (241, 50, 'http://localhost:3300/imgs/50/file-ODczQgtKa5a3CGOF7_tTw3x1.jpg');

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `ngaysinh` date NULL DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `sdt` varchar(11) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `gioithieu` varchar(5000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `gioitinh` int(0) NULL DEFAULT NULL,
  `avatar` varchar(5000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `timeCreate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `upHost` int(0) NULL DEFAULT 0,
  `isBan` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `ten`(`ten`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nguoidung
-- ----------------------------
INSERT INTO `nguoidung` VALUES (1, 'duy8199@gmail.com', '$2a$10$1kREGdkewUBnVe.bVceq3u0T1Kx2dujegdhnN5s.cfl2gBVUcrODe', 'Duy Huynh', '2020-07-08', 'TP HCM', '0355196516', 'Truong KHTN', 1, 'http://localhost:3300/imgs/user/1/file-icons8-big-carrot-64.png', '2020-08-25 01:02:40', 2, 0);
INSERT INTO `nguoidung` VALUES (2, 'b', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Duy Duy', '2020-06-26', 'a', '0355196555', 'hehee 123', 1, 'https://cdn.luxstay.com/users/45593/avatar_5b53b9b8-9b92-4632-9e1c-bcd51b683241.', '2020-08-22 22:27:48', 1, 0);
INSERT INTO `nguoidung` VALUES (3, 'k@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Lê Thị Việt Dương', '2020-08-21', 'hehe', '', '', 1, 'https://lh3.googleusercontent.com/-V96Xmm9xLBE/AAAAAAAAAAI/AAAAAAAAABo/xwB_4iAqHUc/s96-c/photo.jpg', '2020-08-21 16:51:45', 0, 0);
INSERT INTO `nguoidung` VALUES (4, 'a@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Huynh Duy', '2020-08-21', 'Đăk Lăk', '0355196515', 'TUi 21 tuổi', 1, 'http://localhost:3300/imgs/user/4/file-20200306_133031.jpg', '2020-08-21 23:30:55', 2, 0);
INSERT INTO `nguoidung` VALUES (5, '', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Bùi Tuấn', NULL, NULL, NULL, NULL, NULL, 'https://cdn.luxstay.com/users/275656/avatar_63591e41-e370-4503-b7cc-8c8f0f783b49.jpg', '2020-08-22 00:18:15', 3, 0);
INSERT INTO `nguoidung` VALUES (6, NULL, NULL, 'Trương Diệp', NULL, NULL, NULL, NULL, NULL, 'https://cdn.luxstay.com/users/68918/avatar_9_1552967969.jpg', NULL, 0, 0);
INSERT INTO `nguoidung` VALUES (7, NULL, NULL, 'Trương Diệp 2', NULL, NULL, NULL, NULL, NULL, 'https://cdn.luxstay.com/users/68918/avatar_9_1552967969.jpg', '2020-06-10 23:22:59', 0, 0);

-- ----------------------------
-- Table structure for phong
-- ----------------------------
DROP TABLE IF EXISTS `phong`;
CREATE TABLE `phong`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `nguoiDang` int(0) NOT NULL,
  `diaChi` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `dienTich` int(0) NULL DEFAULT NULL,
  `giaNgayThuong` int(0) NULL DEFAULT NULL,
  `giaNgayCuoiTuan` int(0) NULL DEFAULT NULL,
  `soPhong` int(0) NULL DEFAULT NULL,
  `soGiuong` int(0) NULL DEFAULT NULL,
  `giaNgayLe` int(0) NULL DEFAULT NULL,
  `giaThang` int(0) NULL DEFAULT NULL,
  `soKhachToiDa` int(0) NULL DEFAULT NULL,
  `gioiThieu` varchar(11000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `luuY` varchar(10000) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `thoiGianNhan` time(0) NULL DEFAULT NULL,
  `thoiGianTra` time(0) NULL DEFAULT NULL,
  `timeCreate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `trangThai` int(0) NULL DEFAULT 1,
  `soluongchothue` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PhongDuocDangBoi`(`nguoiDang`) USING BTREE,
  FULLTEXT INDEX `ten`(`ten`),
  FULLTEXT INDEX `ten_2`(`ten`, `diaChi`),
  FULLTEXT INDEX `diaChi`(`diaChi`),
  CONSTRAINT `PhongDuocDangBoi` FOREIGN KEY (`nguoiDang`) REFERENCES `nguoidung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phong
-- ----------------------------
INSERT INTO `phong` VALUES (1, 'Nhà sang trọng sát biển Mỹ Khê', 1, 'A22/4 Phạm Thế Hiền, Phường 3, Quận 8, Hồ Chí Minh', 40, 260000, 300000, 2, 2, 255000, -5, 3, '<p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p>  \r\n                        <p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p> \r\n                        <p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p>  ', '<p class=\"mb--0\"><p>- Tự check in &amp; nhận phòng với nhân viên</p><p>- Check in time : 13:00 ( Có thể nhận phòng sớm tùy tình trạng phòng,quý khách liên hệ trước khi đến )</p><p>- Check our time : 11:30 (Có thể muộn hơn tùy tình trạng phòng.)</p><p>- Không hút thuốc</p><p>- Không sử dụng các chất kích thích, văn hoá phẩm đồi truỵ</p><p>- Không mang theo vật nuôi</p><p>- Hạn chế làm ồn sau 22h đêm</p><p><br></p></p>', '14:00:00', '12:00:00', '2020-08-24 22:47:46', 1, 2);
INSERT INTO `phong` VALUES (2, 'Căn hộ gần sông Hàn, có ban công, view phố, smarthome 22', 1, 'Ngũ Hành Sơn, Đà Nẵng, Vietnam', 35, 399000, 399000, 1, 1, 100000, NULL, 3, '<p><strong>- Myan Residence </strong>thiết kế nội thất hiện đại, tối giản, ấm áp như ở nhà</p><p>- Có thang máy, ban công rộng, thoáng với không gian xanh của vườn treo và cây xanh bên ngoài</p><p>- Chỗ ở của chúng tôi nằm ở vị trí thuận tiện, <strong>gần trung tâm </strong>nhưng vẫn đảm bảo yên tĩnh cho quý khách nghỉ ngơi. Cách sông Hàn 150m, biển Mỹ Khê 01km, phố ăn đêm 500m, gần Vinmart +, nhà hàng Cafe, trả sữa tại tầng trệt.</p><p>DIỆN TÍCH VÀ VIEW PHÒNG:</p><p>- Diện tích: 35m2</p><p>- Giường: 01 giường Queen size (1,6m x 2m)</p><p>- View: phòng ở tầng 3 <strong>view cây xanh và phố</strong></p><p>GIÁ PHÒNG:</p><p>- Tất cả các ngày trong tuần: 399.000 VNĐ/đêm</p><p>SỐ LƯỢNG KHÁCH ĐƯỢC Ở TRONG PHÒNG:</p><p>- Số lượng khách: tiêu chuẩn 02 người</p><p>- Đối với trẻ em: Miễn phụ thu cho trẻ em dưới 06 tuổi, trên 06 tuổi phụ thu 150.000 VNĐ(Không kê giường phụ)</p><p>- Trang bị phòng: Trang thiết bị hiện đại, đạt tiêu chuẩn smarthome: điện thông minh, rèm tự động, xí thông minh, TV truyền hình cáp, máy sấy, wifi mạnh, máy giặt cửa trước, tủ lạnh cỡ lớn, đồ bếp đảm bảo cho các nhu cầu nấu nướng cơ bản, ...</p>', '<p class=\"mb--0\"><p>- Không BBQ, lẩu trong phòng</p><p>- Khách nấu ăn vui lòng tự dọn dẹp, nếu không bên mình sẽ mính phí 150.000 VND</p><p>- Trong quá trình khách ở bên mình sẽ không dọn nhà, nếu khách có nhu cầu dọn dẹp, bên mình thu phí 150.000 VND/ lần</p><p>- Không sử dụng chất kích thích, shisa, bóng cười, không dẫn gái mại dâm vào nhà</p><p>- Bên mình sẽ cấp cho khách khăn tắm 1 lần duy nhất tương đương với số khách ở khi check in</p><p>- Giờ check in: Từ 14:00; Check out: trước 12:00</p><p>- Không tiệc, mở nhạc lớn, hay làm ồn sau 21:00</p><p>- Khách vui lòng tự thay túi rác khi thùng rác đầy và mang rác vứt vào thùng rác chung tại nơi qui định (trên hè bên hông tòa nhà)</p><p>- Không cho vật nuôi vào nhà</p><p>- Không hút thuốc trong phòng, Nếu hút, vui lòng ra ban công</p></p>', '14:00:00', '12:00:00', '2020-08-24 22:46:29', 1, 1);
INSERT INTO `phong` VALUES (27, '123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 22:46:25', 1, 1);
INSERT INTO `phong` VALUES (28, 'Duy Huynh', 1, 'Lê hồng phong', 40, 123123, 123123, 1, 1, 1000, -1, 3, '<p>Ph&ograve;ng ở c&oacute; diện t&iacute;ch 25m2 c&oacute; 1 giường ngủ. C&oacute; thể ở 3 người</p>\n\n<p>C&aacute;ch trung t&acirc;m th&agrave;nh phố 5&#39; đi bộ</p>\n\n<p>C&aacute;ch biển 15&#39; đi bộ</p>\n\n<p>Khu d&acirc;n cư an to&agrave;n, y&ecirc;n tĩnh</p>\n\n<p>Thiết kế hiện đại.</p>\n\n<p>Đầy đủ tiện nghi, trang bị sẵn từ tivi, tủ lạnh, giường tủ... đến ấm si&ecirc;u tốc, bếp từ.</p>\n\n<p>Ban c&ocirc;ng hướng ra khung cảnh tho&aacute;ng đ&aacute;ng.</p>\n\n<p>Wifi miễn ph&iacute;.</p>\n\n<p>C&oacute; thể tổ chức tiệc ngo&agrave;i trời tr&ecirc;n g&aacute;c m&aacute;i</p>\n\n<p>- Bạn sẽ được trải nghiệm một kh&ocirc;ng gian sống hiện đại v&agrave; đầy đủ nhất những tiện nghi tuyệt vời</p>\n\n<p>- Homestay nằm ngay trong khu d&acirc;n cư y&ecirc;n tĩnh, người d&acirc;n th&acirc;n thiện</p>\n\n<p>- Bạn dễ d&agrave;ng di chuyển đến trung t&acirc;m th&agrave;nh phố, v&agrave; biển</p>\n\n<p>- Việc đ&oacute;n xe để di chuyển cũng rất dễ d&agrave;ng</p>\n\n<p>- Bạn c&oacute; thể xuống phố v&agrave; thưởng thức tất cả những m&oacute;n ngon nổi tiếng của Đ&agrave; Nẵng quanh căn hộ m&igrave;nh đang lưu tr&uacute;</p>\n', '<p>Nếu c&oacute; mang theo vật nu&ocirc;i h&atilde;y cho ch&uacute;ng t&ocirc;i được biết trước.</p>\n\n<p>Chỉ ở đ&uacute;ng số người đ&atilde; đăng k&yacute;</p>\n\n<p>Vật dụng d&ugrave;ng chung để lại vị tr&iacute; cũ sau khi d&ugrave;ng</p>\n\n<p>Vui l&ograve;ng dọn dẹp kh&ocirc;ng gian chung sau khi sử dụng</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:27', 1, 1);
INSERT INTO `phong` VALUES (29, 'Felix\'s home', 1, 'Sơn Trà, Đà Nẵng, Vietnam', 25, 123123, 123123, 2, 2, 123123, -12, 3, '<p>Ph&ograve;ng ở c&oacute; diện t&iacute;ch 25m2 c&oacute; 1 giường ngủ. C&oacute; thể ở 3 người</p>\n\n<p>C&aacute;ch trung t&acirc;m th&agrave;nh phố 5&#39; đi bộ</p>\n\n<p>C&aacute;ch biển 15&#39; đi bộ</p>\n\n<p>Khu d&acirc;n cư an to&agrave;n, y&ecirc;n tĩnh</p>\n\n<p>Thiết kế hiện đại.</p>\n\n<p>Đầy đủ tiện nghi, trang bị sẵn từ tivi, tủ lạnh, giường tủ... đến ấm si&ecirc;u tốc, bếp từ.</p>\n\n<p>Ban c&ocirc;ng hướng ra khung cảnh tho&aacute;ng đ&aacute;ng.</p>\n\n<p>Wifi miễn ph&iacute;.</p>\n\n<p>C&oacute; thể tổ chức tiệc ngo&agrave;i trời tr&ecirc;n g&aacute;c m&aacute;i</p>\n\n<p>- Bạn sẽ được trải nghiệm một kh&ocirc;ng gian sống hiện đại v&agrave; đầy đủ nhất những tiện nghi tuyệt vời</p>\n\n<p>- Homestay nằm ngay trong khu d&acirc;n cư y&ecirc;n tĩnh, người d&acirc;n th&acirc;n thiện</p>\n\n<p>- Bạn dễ d&agrave;ng di chuyển đến trung t&acirc;m th&agrave;nh phố, v&agrave; biển</p>\n\n<p>- Việc đ&oacute;n xe để di chuyển cũng rất dễ d&agrave;ng</p>\n\n<p>- Bạn c&oacute; thể xuống phố v&agrave; thưởng thức tất cả những m&oacute;n ngon nổi tiếng của Đ&agrave; Nẵng quanh căn hộ m&igrave;nh đang lưu tr&uacute;</p>\n', '<p>Nếu c&oacute; mang theo vật nu&ocirc;i h&atilde;y cho ch&uacute;ng t&ocirc;i được biết trước.</p>\n\n<p>Chỉ ở đ&uacute;ng số người đ&atilde; đăng k&yacute;</p>\n\n<p>Vật dụng d&ugrave;ng chung để lại vị tr&iacute; cũ sau khi d&ugrave;ng</p>\n\n<p>Vui l&ograve;ng dọn dẹp kh&ocirc;ng gian chung sau khi sử dụng</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:27', 1, 1);
INSERT INTO `phong` VALUES (30, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:30', 1, 1);
INSERT INTO `phong` VALUES (31, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:31', 1, 1);
INSERT INTO `phong` VALUES (32, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:31', 1, 1);
INSERT INTO `phong` VALUES (33, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:54', 1, 1);
INSERT INTO `phong` VALUES (34, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:54', 1, 1);
INSERT INTO `phong` VALUES (35, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:47:06', 1, 1);
INSERT INTO `phong` VALUES (36, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:56', 1, 1);
INSERT INTO `phong` VALUES (37, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:47:01', 1, 1);
INSERT INTO `phong` VALUES (38, 'Duy Huynh', 1, 'Duy Huynh', 1, 123123, 123123, 1, 1, NULL, NULL, 1, '<p>23123</p>\n', '<p>123213</p>\n', '00:03:00', '12:00:00', '2020-08-24 22:46:57', 1, 1);
INSERT INTO `phong` VALUES (41, 'Nhà sang trọng sát biển Mỹ Khê', 1, 'A22/4 Phạm Thế Hiền, Phường 3, Quận 8, Hồ Chí Minh', 40, 255000, 300000, 2, 2, 255000, -5, 3, '<p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p>  \r\n                        <p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p> \r\n                        <p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p>  ', '<p class=\"mb--0\"><p>- Tự check in &amp; nhận phòng với nhân viên</p><p>- Check in time : 13:00 ( Có thể nhận phòng sớm tùy tình trạng phòng,quý khách liên hệ trước khi đến )</p><p>- Check our time : 11:30 (Có thể muộn hơn tùy tình trạng phòng.)</p><p>- Không hút thuốc</p><p>- Không sử dụng các chất kích thích, văn hoá phẩm đồi truỵ</p><p>- Không mang theo vật nuôi</p><p>- Hạn chế làm ồn sau 22h đêm</p><p><br></p></p>', '14:00:00', '12:00:00', '2020-08-24 22:46:58', 1, 1);
INSERT INTO `phong` VALUES (49, '✦ Luxury Villa 5BRs ✦Thao Dien Dist 2✦Bathtub✦Big yard✦Sai Gon River View _[Sweethost]', 4, 'Quận 2, Hồ Chí Minh, Vietnam', 500, 7890000, 10919000, 2, 4, NULL, NULL, 7, '<p><strong>✦Luxury Villa 5BR✦Bathtub✦Big yard✦Sai Gon River View [Sweethost]&nbsp;</strong>l&agrave; một biệt thự y&ecirc;n tĩnh nằm trong khu biệt thự Thảo Điền, quận 02, với 06 ph&ograve;ng ngủ hiện đại, 02 ghế sofa v&agrave; 02 đệm phụ, đủ cho những nh&oacute;m bạn hay gia đ&igrave;nh từ 16 kh&aacute;ch, v&agrave; lu&ocirc;n tr&agrave;n ngập &aacute;nh s&aacute;ng từ rất nhiều những khung cửa sổ v&agrave; ban cộng rộng.</p>\n\n<p><strong><em>Lưu &yacute;: Khi bạn đặt ph&ograve;ng tại listing n&agrave;y bạn, sẽ được sử dụng ph&ograve;ng ngủ Tầng 2 của villa được thiết kế rất đặc biệt với 02 ph&ograve;ng ngủ, 02 nh&agrave; vệ sinh v&agrave; Tầng 3 của villa c&oacute; 03 ph&ograve;ng ngủ lớn với 02 nh&agrave; vệ sinh, c&oacute; ban c&ocirc;ng lớn nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n. C&ugrave;ng c&aacute;c tiện &iacute;ch của ph&ograve;ng kh&aacute;ch (c&oacute; 1 WC), ph&ograve;ng bếp v&agrave; s&acirc;n vườn.</em></strong></p>\n\n<p><strong>Tiện &iacute;ch của villa:</strong></p>\n\n<p>- Tầng 1 bao gồm 01ph&ograve;ng kh&aacute;ch c&oacute; view trực diện ra s&acirc;n vườn rộng với rất nhiều c&acirc;y xanh v&agrave; hồ sen thơ mộng, 01 ph&ograve;ng bếp đầy đủ tiện nghi (bếp từ, tủ lạnh, nồi cơm điện, l&ograve; vi s&oacute;ng v&agrave; b&aacute;t đũa&hellip;) để du kh&aacute;ch c&oacute; thể tổ chức một bữa tiệc lớn b&ecirc;n gia đ&igrave;nh, bạn b&egrave;. Đồng thời, du kh&aacute;ch c&oacute; thể sử dụng thang m&aacute;y hoặc thang m&aacute;y tại tầng 1 để di chuyển l&ecirc;n c&aacute;c tầng ph&iacute;a tr&ecirc;n.</p>\n\n<p>- Tầng 2 của villa được thiết kế rất đặc biệt với 02 ph&ograve;ng ngủ, 02 nh&agrave; vệ sinh được thiết kế chủ yếu bằng k&iacute;nh thu h&uacute;t rất nhiều &aacute;nh s&aacute;ng v&agrave; view trực diện ra s&ocirc;ng S&agrave;i G&ograve;n. Ngo&agrave;i ra, tầng 2 c&ograve;n c&oacute; 01 khu vực chung với sofa v&agrave; TV lớn để mọi người c&oacute; thể qu&acirc;y quần h&aacute;t karaoke, xem Netflix hoặc tr&ograve; chuyện với nhau.</p>\n\n<p>- Tầng 3 của villa cũng c&oacute; 03 ph&ograve;ng ngủ lớn với 02 nh&agrave; vệ sinh, c&oacute; ban c&ocirc;ng lớn nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n. Mỗi buổi s&aacute;ng sớm hay chiều t&agrave;, nh&acirc;m nhi một t&aacute;ch tr&agrave; hay caf&eacute;, đọc một cuốn s&aacute;ch sẽ thật l&agrave; th&uacute; vị.</p>\n\n<p>- Tầng 4 của villa c&oacute; 01 ph&ograve;ng ngủ lớn được bao bọc xung quanh bởi k&iacute;nh n&ecirc;n mỗi buổi s&aacute;ng thức dậy đều tạo cảm gi&aacute;c khoan kho&aacute;i ch&agrave;o đ&oacute;n một ng&agrave;y mới cho du kh&aacute;ch. (closed)</p>\n\n<p>- Đặc biệt&nbsp;<strong>✦Luxury Villa 5BR✦Bathtub✦Big yard✦Sai Gon River View [Sweethost]&nbsp;</strong>c&ograve;n c&oacute; một&nbsp;<strong>kh&ocirc;ng gian s&acirc;n ngo&agrave;i trời, rất th&iacute;ch hợp để c&aacute;c nh&oacute;m bạn, gia đ&igrave;nh tổ chức tiệc nướng&nbsp;</strong>hay tr&ograve; chuyện thư gi&atilde;n.</p>\n\n<p>-Thời gian chủ nh&agrave; hỗ trợ check in muộn nhất l&agrave;: 20:00</p>\n', '<p>Kh&aacute;ch h&agrave;ng cần gửi lại ảnh CMND hoặc passport trước khi check in. Đồng thời kh&aacute;ch h&agrave;ng phải đặt cọc 100% gi&aacute; trị đặt ph&ograve;ng cho chủ nh&agrave;, sau khi check out, kiểm tra t&agrave;i sản đảm bảo chủ nh&agrave; sẽ chuyển khoản lại số tiền n&agrave;y cho kh&aacute;ch h&agrave;ng</p>\n', '03:00:00', '23:30:00', '2020-08-24 22:46:59', 1, 1);
INSERT INTO `phong` VALUES (50, '✦Premium 3BR✦Landmark 81 Sai Gon River - City View [Sweethost]', 4, 'Bình Thạnh, Hồ Chí Minh, Vietnam', 117, 3310000, 4219000, 2, 3, 4500000, -5, 8, '<p><strong>Sweethost Premium 3BR&nbsp;</strong>tọa lạc tr&ecirc;n tầng&nbsp;44 của&nbsp;<strong>t&ograve;a nh&agrave; cao nhất Việt Nam Landmark 81</strong>, với tổng diện t&iacute;ch 117m2 c&oacute; sức chứa l&ecirc;n đến 8 kh&aacute;ch. Căn hộ được trang tr&iacute; nội thất hiện đại, trang nh&atilde; c&ugrave;ng với view nh&igrave;n trực diện ra s&ocirc;ng S&agrave;i G&ograve;n v&agrave; to&agrave;n th&agrave;nh phố. Ngo&agrave;i ra, c&aacute;c dịch vụ đi k&egrave;m cũng sẽ l&agrave; một điểm cộng lớn kh&ocirc;ng thể bỏ qua khi trải nghiệm c&ugrave;ng&nbsp;<strong>Sweethost</strong>.﻿</p>\n\n<ul>\n	<li><strong>View trực diện</strong>&nbsp;nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n v&agrave; th&agrave;nh phố từ tr&ecirc;n cao</li>\n	<li><strong>Miễn ph&iacute;</strong>&nbsp;wifi tốc độ cao v&agrave; nước uống, đồ ăn nhẹ</li>\n	<li><strong>Miễn ph&iacute;</strong>&nbsp;vệ sinh 1 tuần/lần cho booking từ 1 tuần trở l&ecirc;n</li>\n	<li><strong>Miễn ph&iacute; sử dụng ph&ograve;ng gym﻿</strong>&nbsp;ở tầng 5 của t&ograve;a nh&agrave;</li>\n	<li>Hệ thống loa kết nối bằng bluetooth khắp nh&agrave;</li>\n	<li>Hệ thống m&aacute;y lạnh &acirc;m tường to&agrave;n căn hộ</li>\n	<li>Ph&ograve;ng kh&aacute;ch rộng r&atilde;i gồm bộ sofa lớn để mọi người qu&acirc;y quần, Smart TV m&agrave;n h&igrave;nh phẳng c&oacute; Netflix UltraHD</li>\n	<li>Ban c&ocirc;ng rộng tho&aacute;ng, c&oacute; b&agrave;n ghế ngồi để thư gi&atilde;n</li>\n	<li>3 ph&ograve;ng ngủ master c&oacute; giường size 1m6, nệm cao cấp, m&agrave;n che 2 lớp, tủ quần &aacute;o ri&ecirc;ng</li>\n	<li>Đặc biệt view từ cả 3 ph&ograve;ng ngủ đều c&oacute; view s&ocirc;ng S&agrave;i G&ograve;n v&agrave; th&agrave;nh phố</li>\n	<li>Khu vực bếp sạch sẽ v&agrave; được trang bị đầy đủ thiết bị gia dụng bằng th&eacute;p kh&ocirc;ng gỉ</li>\n	<li>2 nh&agrave; vệ sinh hiện đại, sạch sẽ, được trang bị đầy đủ c&aacute;c đồ d&ugrave;ng cần thiết</li>\n	<li>C&oacute; khu vực ri&ecirc;ng gần bếp d&agrave;nh ri&ecirc;ng cho việc giặt v&agrave; phơi đồ</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>Sweethost</strong>&nbsp;c&oacute; cung cấp dịch vụ đưa đ&oacute;n từ s&acirc;n bay về thẳng Landmark 81 bằng xe đời mới 4 hoặc 7 chỗ, thời gian di chuyển mất khoảng 20-30 ph&uacute;t. Với lợi thế tọa lạc trong t&ograve;a nh&agrave; phức hợp bao gồm c&aacute;c dịch vụ ăn uống, mua sắm ngay tại chỗ ở,&nbsp;<strong>Sweethost</strong>&nbsp;tự tin mang đến cho kh&aacute;ch h&agrave;ng những trải nghiệm đẹp v&agrave; bổ &iacute;ch trong thời gian ở đ&acirc;y.</p>\n\n<p>&nbsp;</p>\n\n<p>Kh&aacute;ch h&agrave;ng được to&agrave;n quyền sử dụng căn hộ v&agrave; c&aacute;c dịch vụ trong căn hộ trong thời gian ở tại đ&acirc;y.&nbsp;<strong>Sweethost</strong>&nbsp;sẽ cung cấp m&atilde; số v&agrave; thẻ cư d&acirc;n để kh&aacute;ch h&agrave;ng được tự do ra v&agrave;o căn hộ. Nếu cần check in sớm hoặc check out trễ, vui l&ograve;ng li&ecirc;n hệ&nbsp;<strong>Sweethost</strong>&nbsp;trước để được hỗ trợ.</p>\n', '<ul>\n	<li>Trong qu&aacute; tr&igrave;nh lưu tr&uacute;, nếu bạn c&oacute; nhu cầu thay ga gối, vệ sinh, vui l&ograve;ng th&ocirc;ng b&aacute;o trước cho ch&uacute;ng t&ocirc;i &iacute;t nhất 01 ng&agrave;y. Xin lưu &yacute; đ&acirc;y l&agrave; dịch vụ c&oacute; t&iacute;nh ph&iacute;</li>\n	<li>Sweethost sẵn s&agrave;ng hỗ trợ check-in sớm nếu ph&ograve;ng trống v&agrave;o đ&ecirc;m trước đ&oacute; hoặc kh&aacute;ch trước check out sớm. Vui l&ograve;ng th&ocirc;ng b&aacute;o về kế hoạch check-in sớm (nếu c&oacute;) để Sweethost chuẩn bị được tốt nhất.</li>\n	<li>Đối với việc check-out trễ, ch&uacute;ng t&ocirc;i sẽ charge ph&iacute; 100.000VND/giờ từ 12h-18h. Sau 18h, Sweethost sẽ t&iacute;nh ph&iacute; full 1 đ&ecirc;m.</li>\n	<li>Vui l&ograve;ng tắt c&aacute;c thiết bị điện trước khi ra ngo&agrave;i.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>VUI L&Ograve;NG KH&Ocirc;NG THỰC HIỆN NHỮNG ĐIỀU SAU:</p>\n\n<ul>\n	<li>Kh&ocirc;ng h&uacute;t thuốc trong nh&agrave; (c&oacute; thể h&uacute;t ngo&agrave;i ban c&ocirc;ng)</li>\n	<li>Kh&ocirc;ng tổ chức tiệc t&ugrave;ng</li>\n	<li>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</li>\n	<li>Kh&ocirc;ng mang th&uacute; nu&ocirc;i v&agrave;o ph&ograve;ng</li>\n</ul>\n', '12:00:00', '12:00:00', '2020-08-24 22:47:05', 2, 1);

-- ----------------------------
-- Table structure for recoverykey
-- ----------------------------
DROP TABLE IF EXISTS `recoverykey`;
CREATE TABLE `recoverykey`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user` int(0) NULL DEFAULT NULL,
  `keyRecovery` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `taikhoancankhoiphuc`(`user`) USING BTREE,
  CONSTRAINT `taikhoancankhoiphuc` FOREIGN KEY (`user`) REFERENCES `nguoidung` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recoverykey
-- ----------------------------
INSERT INTO `recoverykey` VALUES (50, 4, 105641);
INSERT INTO `recoverykey` VALUES (51, 4, 185744);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiennghi
-- ----------------------------
INSERT INTO `tiennghi` VALUES (1, 'Wifi', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><g fill=\"#000\" fill-rule=\"nonzero\"><path pid=\"0\" d=\"M23.44 9.04a.502.502 0 01-.354-.146A14.9 14.9 0 0012.48 4.5 14.903 14.903 0 001.873 8.894a.5.5 0 01-.707-.707A15.896 15.896 0 0112.48 3.5c4.274 0 8.292 1.665 11.313 4.687a.5.5 0 01-.353.853z\"></path><path pid=\"1\" d=\"M20.612 11.868a.502.502 0 01-.354-.146c-4.289-4.288-11.268-4.288-15.557 0a.5.5 0 01-.707-.707c4.679-4.679 12.292-4.679 16.971 0a.5.5 0 01-.353.853z\"></path><path pid=\"2\" d=\"M17.783 14.697a.502.502 0 01-.354-.146 6.954 6.954 0 00-4.95-2.05c-1.87 0-3.627.728-4.95 2.05a.5.5 0 01-.707-.707 7.948 7.948 0 015.657-2.343c2.137 0 4.146.832 5.657 2.343a.5.5 0 01-.353.853zM12.48 20.5a2.503 2.503 0 01-2.5-2.5c0-1.378 1.122-2.5 2.5-2.5s2.5 1.122 2.5 2.5-1.122 2.5-2.5 2.5zm0-4c-.827 0-1.5.673-1.5 1.5s.673 1.5 1.5 1.5 1.5-.673 1.5-1.5-.673-1.5-1.5-1.5z\"></path></g></svg>', 1);
INSERT INTO `tiennghi` VALUES (2, 'TV', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\"><path pid=\"0\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M16.293 14H8.707l-1.853 1.854a.5.5 0 0 1-.708-.708L7.293 14H3.5a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5h18a.5.5 0 0 1 .5.5v11a.5.5 0 0 1-.5.5h-3.793l1.147 1.146a.5.5 0 0 1-.708.708L16.293 14zM4 3v10h17V3H4zM3 21.5v1a.5.5 0 1 1-1 0V18a1.5 1.5 0 0 1 1.5-1.5h18A1.5 1.5 0 0 1 23 18v4.5a.5.5 0 1 1-1 0v-1H3zm0-1h19V18a.5.5 0 0 0-.5-.5h-18a.5.5 0 0 0-.5.5v2.5zm8.5-1a.5.5 0 1 1 0-1h2a.5.5 0 1 1 0 1h-2zM5.854 5.854a.5.5 0 1 1-.708-.708l1-1a.5.5 0 1 1 .708.708l-1 1zm0 3a.5.5 0 1 1-.708-.708l4-4a.5.5 0 1 1 .708.708l-4 4z\"></path></svg>', 1);
INSERT INTO `tiennghi` VALUES (3, 'Điều hoà', '<svg  version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M23 8.5h-2.085a1.5 1.5 0 0 1-2.83 0H1v4a.5.5 0 0 0 .5.5h1v-.5A1.5 1.5 0 0 1 4 11h16a1.5 1.5 0 0 1 1.5 1.5v.5h1a.5.5 0 0 0 .5-.5v-4zm0-1v-2a.5.5 0 0 0-.5-.5h-21a.5.5 0 0 0-.5.5v2h17.085a1.5 1.5 0 0 1 2.83 0H23zM20.5 13v-.5a.5.5 0 0 0-.5-.5H4a.5.5 0 0 0-.5.5v.5h17zm-19-9h21A1.5 1.5 0 0 1 24 5.5v7a1.5 1.5 0 0 1-1.5 1.5h-21A1.5 1.5 0 0 1 0 12.5v-7A1.5 1.5 0 0 1 1.5 4zm5.886 16.182a.5.5 0 0 1-.772.636c-.817-.993-.817-2.086-.009-3.125.525-.674.525-1.248.009-1.875a.5.5 0 0 1 .772-.636c.817.993.817 2.086.009 3.125-.525.674-.525 1.248-.009 1.875zm5 0a.5.5 0 0 1-.772.636c-.817-.993-.817-2.086-.009-3.125.525-.674.525-1.248.009-1.875a.5.5 0 0 1 .772-.636c.817.993.817 2.086.009 3.125-.525.674-.525 1.248-.009 1.875zm5 0a.5.5 0 0 1-.772.636c-.817-.993-.817-2.086-.009-3.125.525-.674.525-1.248.009-1.875a.5.5 0 0 1 .772-.636c.817.993.817 2.086.009 3.125-.525.674-.525 1.248-.009 1.875z\"></path></svg>', 1);
INSERT INTO `tiennghi` VALUES (4, 'Máy giặt', '<svg  version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M15.07 11.21a4.5 4.5 0 1 0 0 6.58c-2.093-1.832-2.093-4.748 0-6.58zm.651.759c-1.628 1.432-1.628 3.63 0 5.062A4.48 4.48 0 0 0 16.5 14.5a4.48 4.48 0 0 0-.779-2.531zM10 1H4.5a.5.5 0 0 0-.5.5V5h6V1zm1 0v4h9V1.5a.5.5 0 0 0-.5-.5H11zM4 6v17h16V6H4zm.5-6h15A1.5 1.5 0 0 1 21 1.5v22a.5.5 0 0 1-.5.5h-17a.5.5 0 0 1-.5-.5v-22A1.5 1.5 0 0 1 4.5 0zM12 20a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zM6 3.5a.5.5 0 0 1 0-1h2a.5.5 0 0 1 0 1H6zM18 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm-3 0a1 1 0 1 1 0-2 1 1 0 0 1 0 2z\"></path></svg>', 1);
INSERT INTO `tiennghi` VALUES (5, 'Dầu gội, dầu xả', '<svg  version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" d=\"M7.381 0c-1.457 0-2.7 1.065-2.7 1.065a.48.48 0 1 0 .6.75S6.438.96 7.381.96c1.226 0 2.28.855 2.28.855l.12.09V3.84H9.211a.48.48 0 0 0-.39.48v2.4h-.48a4.336 4.336 0 0 0-4.32 4.32v2.73a.492.492 0 0 0 0 .285V21.6a2.41 2.41 0 0 0 2.4 2.4h11.52a2.41 2.41 0 0 0 2.4-2.4v-7.59a.488.488 0 0 0 0-.195V11.04a4.336 4.336 0 0 0-4.32-4.32h-.48v-2.4a.48.48 0 0 0-.48-.48h-.48V1.92h.48a.483.483 0 0 0 .422-.238.485.485 0 0 0 0-.484.483.483 0 0 0-.422-.238h-.855a.45.45 0 0 0-.15-.015.422.422 0 0 0-.045.015h-3.645a.45.45 0 0 0-.15-.015.422.422 0 0 0-.045.015h-.06C9.894.786 8.87 0 7.381 0zm3.36 1.92h2.88v1.92h-2.88V1.92zm-.96 2.88h4.8v1.92h-4.8V4.8zm-1.44 2.88h7.68c1.85 0 3.36 1.51 3.36 3.36v2.4h-5.805c.026-.154.045-.319.045-.48a2.888 2.888 0 0 0-2.88-2.88 2.888 2.888 0 0 0-2.88 2.88c0 .161.019.326.045.48H4.981v-2.4c0-1.85 1.51-3.36 3.36-3.36zm2.4 3.36c1.067 0 1.92.853 1.92 1.92s-.853 1.92-1.92 1.92a1.91 1.91 0 0 1-1.74-1.11v-.015l-.015-.03-.015-.015c-.002-.004.002-.011 0-.015l-.015-.015a1.944 1.944 0 0 1-.135-.72c0-1.067.853-1.92 1.92-1.92zm-5.76 3.36h3.27a2.89 2.89 0 0 0 2.49 1.44 2.89 2.89 0 0 0 2.49-1.44h6.15v7.2a1.44 1.44 0 0 1-1.44 1.44H6.421a1.44 1.44 0 0 1-1.44-1.44v-7.2zm10.08 1.44c-1.056 0-1.92.864-1.92 1.92s.864 1.92 1.92 1.92 1.92-.864 1.92-1.92-.864-1.92-1.92-1.92zm0 .96c.536 0 .96.424.96.96s-.424.96-.96.96a.952.952 0 0 1-.96-.96c0-.536.424-.96.96-.96zm-3.84 2.4c-.79 0-1.44.65-1.44 1.44 0 .79.65 1.44 1.44 1.44.79 0 1.44-.65 1.44-1.44 0-.79-.65-1.44-1.44-1.44zm0 .96c.27 0 .48.21.48.48s-.21.48-.48.48-.48-.21-.48-.48.21-.48.48-.48z\" fill=\"#000\" fill-rule=\"nonzero\"></path></svg>', 1);
INSERT INTO `tiennghi` VALUES (6, 'Giấy vệ sinh', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\"><path pid=\"0\" fill=\"#000\" d=\"M0 7.429C0 3.367 1.964 0 4.571 0H19.43C22.036 0 24 3.367 24 7.429c0 4.06-1.964 7.428-4.571 7.428H16v8.572a.571.571 0 0 1-.571.571H.57a.571.571 0 0 1-.57-.571v-16zm14.857 7.428H4.571c-1.394 0-2.604-.963-3.428-2.48v10.48h13.714v-8zm4.572-1.143c1.81 0 3.428-2.772 3.428-6.285 0-3.514-1.617-6.286-3.428-6.286H7.035c1.286 1.323 2.108 3.66 2.108 6.286 0 2.626-.822 4.962-2.108 6.285H19.43zm-14.858 0C6.383 13.714 8 10.942 8 7.43c0-3.514-1.617-6.286-3.429-6.286-1.81 0-3.428 2.772-3.428 6.286 0 3.513 1.617 6.285 3.428 6.285zm0-4c-1.007 0-1.714-1.06-1.714-2.285 0-1.226.707-2.286 1.714-2.286 1.008 0 1.715 1.06 1.715 2.286 0 1.225-.707 2.285-1.715 2.285zm0-1.143c.256 0 .572-.474.572-1.142 0-.669-.316-1.143-.572-1.143-.255 0-.571.474-.571 1.143 0 .668.316 1.142.571 1.142z\" fill-rule=\"evenodd\"></path></svg>', 1);
INSERT INTO `tiennghi` VALUES (7, 'Khăn tắm', '<svg  version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><g fill-rule=\"evenodd\"><path pid=\"0\" fill-rule=\"nonzero\" d=\"M22.527 6.497h-.366v-.202c.107-1.298-.245-2.453-.993-3.254a3.18 3.18 0 0 0-2.443-1.024H3.945c-1.376 0-2.496 1.102-2.496 2.457v2.023h-.023C.64 6.497 0 7.127 0 7.901v.359c0 .774.64 1.403 1.426 1.403h.023v10.865c0 1.355 1.12 2.457 2.496 2.457h12.188c1.417 0 2.208-.28 2.646-.934.417-.624.421-1.51.421-2.537h1.757c.675 0 1.204-.67 1.204-1.524V9.663h.366c.787 0 1.426-.63 1.426-1.403V7.9c0-.773-.64-1.403-1.426-1.403zM1.45 8.742h-.023a.487.487 0 0 1-.49-.482V7.9c0-.265.22-.482.49-.482h.023v1.324zM21.225 6.36v.137H19.21c.043-.329.15-.593.314-.77a.773.773 0 0 1 .577-.245c.39 0 .899.276 1.125.878zm-2.96 13.126c0 1.032-.019 1.686-.267 2.058-.162.242-.52.52-1.865.52H3.945c-.86 0-1.56-.69-1.56-1.536V18.05h15.88v1.435zm0-2.356H2.384v-1.98h15.88v1.98zm.572-12.028c-.307.327-.655.949-.573 2.057v7.07H2.384v-.88h4.578a.464.464 0 0 0 .468-.46.465.465 0 0 0-.468-.461H2.385V4.474c0-.847.7-1.536 1.56-1.536h14.803a2.252 2.252 0 0 1 1.731.726c.298.32.513.72.638 1.18A2.001 2.001 0 0 0 20.1 4.56c-.487 0-.935.192-1.263.541zm2.388 12.888c0 .396-.2.603-.268.603H19.2v-8.93h2.025v8.327zm1.793-9.73c0 .266-.22.482-.49.482H19.2V7.418h3.327c.27 0 .49.217.49.483v.359z\"></path><path pid=\"1\" d=\"M8.428 12.428h-.037a.464.464 0 0 0-.468.46c0 .255.21.461.468.461h.037a.464.464 0 0 0 .468-.46.465.465 0 0 0-.468-.461z\"></path></g></svg>', 1);
INSERT INTO `tiennghi` VALUES (8, 'Kem đánh răng', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" d=\"M19.824 1.261L18.105 2.98l-3.273.399-.123.014-.096.068L2.745 12.99l-.014.014-.013.027-1.155 1.141-.303.317 8.25 8.25.317-.303 1.14-1.155.028-.014.014-.013 9.556-11.825.083-.097.014-.137.357-3.3 1.416-1.402.303-.317-2.915-2.915zm0 1.252L21.5 4.176l-.893.894-1.678-1.664.894-.894zm-1.692 1.36h.014l1.98 1.98v.014l-.234 2.324-4.056-4.056 2.296-.261zm-3.286.523l4.785 4.785-9.281 11.482-.027.04-.798.785-7.013-7.013.784-.797.042-.028 11.508-9.254zM12.11 8.824c-.555 0-1.102.235-1.526.66-.394.393-.518.844-.605 1.168-.047.17-.072.298-.138.413-.063.113-.136.23-.206.344-.345.548-.928 1.464-.206 2.186.178.179.399.3.632.344.045.233.164.45.344.632.22.22.52.344.839.344.488 0 .923-.282 1.347-.55.114-.07.23-.143.344-.206.115-.066.242-.091.412-.138.325-.087.776-.211 1.17-.605.905-.906.872-2.195-.07-3.135a2.62 2.62 0 0 0-.398-.33 2.62 2.62 0 0 0-.33-.399c-.47-.469-1.021-.728-1.609-.728zm0 .88c.337 0 .68.158.99.467.138.138.234.286.303.427.14.068.287.163.426.302.603.603.608 1.356.069 1.897-.392.392-.901.32-1.403.605-.455.26-.928.633-1.251.633a.303.303 0 0 1-.22-.082c-.155-.155-.143-.353.055-.55.273-.274.58-.686.825-1.046.093-.137-.028-.288-.165-.288a.148.148 0 0 0-.097.027c-.359.244-.773.552-1.044.825-.109.109-.217.165-.317.165a.332.332 0 0 1-.234-.11c-.287-.287.226-.897.55-1.471.286-.504.214-.999.606-1.389.262-.264.586-.412.907-.412zm-7.92 3.41l-.619.632.317.316.618-.632-.316-.316zm.646.646l-.632.619.316.316.632-.619-.316-.316zm.633.633l-.619.618.316.317.619-.62-.316-.316zm.632.632l-.619.633.317.316.619-.633-.317-.316zm.646.646l-.632.619.316.316.633-.619-.317-.316zm.633.633l-.619.619.316.316.62-.619-.317-.316zm.633.632l-.62.633.317.316.619-.633-.317-.316zm.646.647l-.633.618.316.317.633-.62-.316-.315zm.632.632l-.619.619.317.316.618-.619-.316-.316zm.633.633l-.619.632.316.316.619-.632-.316-.316zm.646.646l-.633.619.317.316.632-.619-.316-.316z\" fill=\"#000\" fill-rule=\"nonzero\"></path></svg>', 1);
INSERT INTO `tiennghi` VALUES (9, 'Máy sấy', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><g fill=\"none\" fill-rule=\"evenodd\"><path pid=\"0\" d=\"M0 0h24v24H0z\"></path><path pid=\"1\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M17.571 3.452L6.434 2.07a5.872 5.872 0 0 0-.669-.038C2.586 2.03 0 4.62 0 7.805v.12a5.78 5.78 0 0 0 2.932 5.028l1.54 6.226c.17.689.599 1.27 1.206 1.636a2.639 2.639 0 0 0 2.01.304l.042-.01a2.638 2.638 0 0 0 1.637-1.206 2.639 2.639 0 0 0 .304-2.01l-1.112-4.495 9.012-1.12a.494.494 0 0 0 .434-.49V3.943c0-.25-.186-.46-.434-.49zM8.711 18.13c.107.433.039.88-.191 1.262-.23.381-.595.65-1.027.757l-.043.01c-.432.107-.88.04-1.26-.19a1.656 1.656 0 0 1-.758-1.028l-1.36-5.495a5.737 5.737 0 0 0 2.367.215l1.131-.14 1.14 4.61zm8.305-6.78L6.32 12.68A4.786 4.786 0 0 1 .99 7.925v-.12a4.786 4.786 0 0 1 5.328-4.754L17.016 4.38v6.97z\"></path><path pid=\"2\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M2.763 7.865a3.293 3.293 0 0 0 3.29 3.29 3.293 3.293 0 0 0 3.288-3.29 3.293 3.293 0 0 0-3.289-3.289 3.293 3.293 0 0 0-3.289 3.29zm5.59 0c0 1.269-1.032 2.3-2.3 2.3a2.303 2.303 0 0 1-2.301-2.3c0-1.268 1.032-2.3 2.3-2.3 1.269 0 2.3 1.032 2.3 2.3z\"></path><path pid=\"3\" fill=\"#000\" d=\"M19.196 6.305c.288 0 .426.155.688.476.289.356.684.843 1.455.843s1.166-.487 1.455-.843c.262-.321.4-.476.687-.476a.494.494 0 1 0 0-.99c-.77 0-1.166.487-1.455.843-.261.322-.4.477-.687.477-.288 0-.426-.155-.687-.477-.29-.356-.685-.842-1.455-.842a.494.494 0 0 0 0 .989zm4.285 1.998c-.77 0-1.166.486-1.455.842-.261.322-.4.477-.687.477-.288 0-.426-.155-.687-.477-.29-.356-.685-.842-1.455-.842a.494.494 0 1 0 0 .989c.287 0 .425.155.687.476.289.356.684.843 1.455.843s1.166-.487 1.455-.843c.262-.321.4-.476.688-.476a.494.494 0 1 0 0-.99z\"></path></g></svg>', 1);
INSERT INTO `tiennghi` VALUES (10, 'Đệm bổ sung', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" d=\"M20.772 10.386a2.46 2.46 0 0 0 .662-1.655 2.446 2.446 0 0 0-2.44-2.441H5.916A5.916 5.916 0 0 0 0 12.207a5.916 5.916 0 0 0 5.917 5.917H20.07a3.885 3.885 0 0 0 3.89-3.89c.041-1.944-1.366-3.517-3.187-3.848zm-.662 6.91H5.917a5.086 5.086 0 0 1-5.09-5.09 5.086 5.086 0 0 1 5.09-5.089h13.076c.87 0 1.614.704 1.614 1.614 0 .869-.704 1.614-1.614 1.614H5.545c-1.035.083-1.904.993-1.904 2.069a2.05 2.05 0 0 0 2.07 2.069h12.123v-.828H5.752a1.22 1.22 0 0 1-1.242-1.241 1.22 1.22 0 0 1 1.242-1.242H20.11a3.055 3.055 0 0 1 3.062 3.062 3.055 3.055 0 0 1-3.062 3.063z\"></path></svg>', 4);
INSERT INTO `tiennghi` VALUES (11, 'Bếp điện', '<svg  version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><g fill-rule=\"evenodd\" transform=\"translate(1)\"><path pid=\"0\" d=\"M2 0h18a2 2 0 0 1 2 2v20a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm1 1a2 2 0 0 0-2 2v18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H3z\"></path><path pid=\"1\" d=\"M11 19a8 8 0 1 1 0-16 8 8 0 0 1 0 16zm0-1a7 7 0 1 0 0-14 7 7 0 0 0 0 14z\"></path><rect pid=\"2\" width=\"5\" height=\"1\" x=\"14\" y=\"21\" rx=\".5\"></rect><rect pid=\"3\" width=\"2\" height=\"1\" x=\"3\" y=\"21\" rx=\".5\"></rect><rect pid=\"4\" width=\"2\" height=\"1\" x=\"6\" y=\"21\" rx=\".5\"></rect></g></svg>', 2);
INSERT INTO `tiennghi` VALUES (12, 'Lò vi sóng', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M16 10V8.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 .5-.5V15h-.5a1.5 1.5 0 0 1-1.5-1.5v-2a1.5 1.5 0 0 1 1.5-1.5h.5zm0 1h-.5a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h.5v-3zM1.5 4h21A1.5 1.5 0 0 1 24 5.5v14a1.5 1.5 0 0 1-1.5 1.5h-21A1.5 1.5 0 0 1 0 19.5v-14A1.5 1.5 0 0 1 1.5 4zm0 1a.5.5 0 0 0-.5.5v14a.5.5 0 0 0 .5.5h21a.5.5 0 0 0 .5-.5v-14a.5.5 0 0 0-.5-.5h-21zm3 2h11A1.5 1.5 0 0 1 17 8.5v8a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 3 16.5v-8A1.5 1.5 0 0 1 4.5 7zm1.354 3.853a.5.5 0 0 1-.708-.707l1-1a.5.5 0 0 1 .708.707l-1 1zm0 3a.5.5 0 0 1-.708-.707l4-4a.5.5 0 0 1 .708.707l-4 4zM20 9a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm0 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm0 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2z\"></path></svg>', 2);
INSERT INTO `tiennghi` VALUES (13, 'Tủ lạnh', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M17.5 0A1.5 1.5 0 0 1 19 1.5v21a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 5 22.5v-21A1.5 1.5 0 0 1 6.5 0h11zM6 13h12V1.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5V13zm0 1v8.5a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 .5-.5V14H6zm1-6.5a.5.5 0 0 1 1 0v4a.5.5 0 1 1-1 0v-4zm0 8a.5.5 0 1 1 1 0v4a.5.5 0 1 1-1 0v-4zm8.854 6.354a.5.5 0 0 1-.708-.708l1-1a.5.5 0 0 1 .708.708l-1 1zm-3 0a.5.5 0 0 1-.708-.708l4-4a.5.5 0 0 1 .708.708l-4 4z\"></path></svg>', 2);
INSERT INTO `tiennghi` VALUES (14, 'Xà phòng tắm\r\n', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\"><g fill-rule=\"evenodd\"><path pid=\"0\" d=\"M7.2 16.902a2.105 2.105 0 01-1.654-.57 1.804 1.804 0 01-.351-1.328.393.393 0 00-.331-.443.4.4 0 00-.458.315 2.576 2.576 0 00.526 1.96c.488.564 1.251.85 2.268.85.22 0 .4-.175.4-.392a.396.396 0 00-.4-.392zm2 0h-.4c-.22 0-.4.176-.4.392 0 .217.18.392.4.392h.4c.22 0 .4-.175.4-.392a.396.396 0 00-.4-.392zm7.6-5.49c.61-.059 1.215.15 1.654.569.288.381.414.858.351 1.329a.393.393 0 00.395.455.398.398 0 00.394-.328 2.573 2.573 0 00-.526-1.959c-.488-.564-1.251-.85-2.268-.85-.22 0-.4.175-.4.392 0 .216.18.392.4.392zm-1.2-.392a.396.396 0 00-.4-.393h-.4c-.22 0-.4.176-.4.393 0 .216.18.392.4.392h.4c.22 0 .4-.176.4-.392z\"></path><path pid=\"1\" fill-rule=\"nonzero\" d=\"M2 9.451c1.104 0 2-.878 2-1.96 0-1.084-.896-1.962-2-1.962S0 6.407 0 7.49c.001 1.083.896 1.96 2 1.961zm0-3.137c.663 0 1.2.526 1.2 1.176 0 .65-.537 1.177-1.2 1.177-.663 0-1.2-.527-1.2-1.177S1.337 6.314 2 6.314zm8.8.392c0 .866.716 1.569 1.6 1.569.884 0 1.6-.703 1.6-1.57 0-.865-.716-1.568-1.6-1.568-.884 0-1.6.703-1.6 1.569zm2.4 0a.792.792 0 01-.8.784.792.792 0 01-.8-.784c0-.433.358-.784.8-.784.442 0 .8.35.8.784zM4.8 4.745c0 1.516 1.254 2.745 2.8 2.745 1.546 0 2.8-1.229 2.8-2.745S9.146 2 7.6 2c-1.546.002-2.798 1.23-2.8 2.745zm4.8 0c0 1.083-.896 1.96-2 1.96s-2-.877-2-1.96.896-1.96 2-1.96 1.999.878 2 1.96z\"></path><path pid=\"2\" d=\"M7.197 5.014a.722.722 0 01-.017-.54.39.39 0 00-.255-.495.402.402 0 00-.505.25c-.145.413-.1.867.127 1.243a1.22 1.22 0 001.053.45c.22 0 .4-.176.4-.393a.396.396 0 00-.4-.392.527.527 0 01-.403-.123z\"></path><path pid=\"3\" fill-rule=\"nonzero\" d=\"M21.6 16.118a2.38 2.38 0 00-.431.042c.02-.144.03-.29.031-.435v-3.137c-.002-1.948-1.613-3.527-3.6-3.53H6.4c-1.987.003-3.598 1.582-3.6 3.53v3.137c.002 1.949 1.613 3.528 3.6 3.53h6.54a2.397 2.397 0 002.26 1.569c.349 0 .694-.076 1.008-.224A2.4 2.4 0 0018.4 22a2.4 2.4 0 002.192-1.4c.314.148.66.224 1.008.224 1.325 0 2.4-1.054 2.4-2.353 0-1.3-1.075-2.353-2.4-2.353zm-8.8 2.353H6.4c-1.546-.002-2.798-1.23-2.8-2.746v-3.137c.002-1.515 1.254-2.743 2.8-2.745h11.2c1.546.002 2.798 1.23 2.8 2.745v3.137c0 .086-.01.17-.018.253a2.409 2.409 0 00-2.196-1.028 2.39 2.39 0 00-1.978 1.39 2.375 2.375 0 00-1.008-.222c-1.325.001-2.399 1.054-2.4 2.353zm8.8 1.568a1.598 1.598 0 01-.988-.345.406.406 0 00-.387-.059.394.394 0 00-.253.294 1.588 1.588 0 01-1.57 1.286 1.588 1.588 0 01-1.57-1.286.395.395 0 00-.253-.294.406.406 0 00-.387.059c-.28.223-.63.345-.992.345-.884 0-1.6-.702-1.6-1.568 0-.867.716-1.569 1.6-1.569.36.001.708.123.988.345.11.085.256.107.387.06a.394.394 0 00.253-.295 1.588 1.588 0 011.57-1.285c.772 0 1.433.54 1.57 1.285a.395.395 0 00.253.294c.13.048.278.026.387-.059.28-.222.63-.344.992-.345.884 0 1.6.702 1.6 1.569 0 .866-.716 1.568-1.6 1.568z\"></path></g></svg>', 1);
INSERT INTO `tiennghi` VALUES (15, 'Cảnh quan đẹp', '<svg version=\"1.1\" viewBox=\"0 0 24 23\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" d=\"M23.486 22.457a.469.469 0 0 0 .377-.745c-.072-.098-1.743-2.364-3.933-4.039V15.86a2.343 2.343 0 0 0 1.872-2.292v-.936a.468.468 0 0 0-.936 0v.936c0 .61-.391 1.13-.936 1.323v-1.323a.468.468 0 0 0-.935 0v3.453c-1.177-.74-2.275-1.114-3.275-1.114-1.152 0-2.41.495-3.743 1.473-1.333-.978-2.59-1.473-3.742-1.473-.154 0-.31.01-.468.027v-2.881a2.343 2.343 0 0 0 1.871-2.292V8.889a.468.468 0 0 0-.936 0v1.872c0 .61-.39 1.13-.935 1.323V8.889a.468.468 0 0 0-.936 0v5.066a1.406 1.406 0 0 1-.936-1.323v-.936a.468.468 0 0 0-.935 0v.936c0 1.13.805 2.075 1.871 2.292v1.208c-.88.271-1.821.788-2.807 1.542v-3.17a.468.468 0 0 0-.936 0v1.323a1.406 1.406 0 0 1-.935-1.324v-.935a.468.468 0 0 0-.936 0v.935c0 1.13.805 2.075 1.871 2.293v1.653a23.375 23.375 0 0 0-2.997 3.263.469.469 0 0 0 .377.745h23.018zm-.968-.936H19.93v-2.646c1.093.926 2.021 1.965 2.588 2.646zm-3.523-3.375v3.375h-9.83c1.477-1.891 4.144-4.678 6.555-4.678.954 0 2.055.438 3.275 1.303zm-10.76-1.303c.892 0 1.893.383 2.98 1.142C9.623 19.34 8.4 20.956 7.992 21.52h-.225v-4.644c.16-.023.316-.034.468-.034zm-1.404.276v4.402H4.024v-2.645c1.003-.85 1.944-1.439 2.807-1.757zm-3.743 2.609v1.793H1.436c.396-.476.97-1.128 1.652-1.793z\"></path><path pid=\"1\" d=\"M15.72 12.164a3.279 3.279 0 0 0 3.275-3.275 3.279 3.279 0 0 0-3.275-3.274 3.279 3.279 0 0 0-3.275 3.274 3.279 3.279 0 0 0 3.275 3.275zm0-5.614c1.29 0 2.34 1.05 2.34 2.34 0 1.29-1.05 2.339-2.34 2.339-1.29 0-2.34-1.05-2.34-2.34 0-1.29 1.05-2.339 2.34-2.339zM0 4.211c0 .774.63 1.404 1.404 1.404h1.484c.193.544.713.935 1.323.935h2.807c.774 0 1.404-.63 1.404-1.403 0-.774-.63-1.404-1.404-1.404H6.47a1.406 1.406 0 0 0-1.323-.935H1.404c-.774 0-1.403.63-1.403 1.403zm5.615 0c0 .258.21.468.467.468h.936a.468.468 0 0 1 0 .936H4.211a.468.468 0 0 1-.468-.468.468.468 0 0 0-.468-.468h-1.87a.468.468 0 0 1 0-.936h3.742c.258 0 .468.21.468.468zM22.55 0h-3.742c-.61 0-1.13.392-1.324.936h-1.483c-.774 0-1.404.63-1.404 1.404 0 .774.63 1.403 1.404 1.403h3.742c.61 0 1.13-.39 1.324-.935h1.483c.774 0 1.404-.63 1.404-1.404 0-.774-.63-1.403-1.404-1.403zm0 1.872h-1.87a.468.468 0 0 0-.468.468c0 .258-.21.468-.468.468h-3.742a.468.468 0 0 1 0-.936h1.871c.258 0 .468-.21.468-.468s.21-.468.468-.468h3.742a.468.468 0 0 1 0 .936z\"></path></svg>', 5);
INSERT INTO `tiennghi` VALUES (16, 'Ban công', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><g fill-rule=\"evenodd\"><path pid=\"0\" fill-rule=\"nonzero\" d=\"M23.485 13.987H18.2V6.87h.257a.468.468 0 0 0 0-.935h-.264A6.23 6.23 0 0 0 11.977 0 6.23 6.23 0 0 0 5.76 5.936h-.264a.468.468 0 0 0 0 .935h.257v7.116H.468a.468.468 0 0 0-.468.468v9.03c0 .259.21.468.468.468h23.017c.259 0 .468-.21.468-.468v-9.03a.468.468 0 0 0-.468-.468zm-5.286.936h1.941v5.287H18.2v-5.287zM12.444.957a5.294 5.294 0 0 1 4.811 4.979h-1.608a3.708 3.708 0 0 0-3.203-3.203V.957zm0 2.721a2.772 2.772 0 0 1 2.258 2.258h-2.258V3.678zm0 5.543V6.87h3.269l-.89.89a.468.468 0 0 0 .662.662l1.551-1.552h.227v7.116h-4.157l3.266-3.266a.468.468 0 0 0-.662-.661l-3.266 3.265V9.221zm4.82 5.702v5.287h-1.942v-5.287h1.941zm-4.82 0h1.942v5.287h-1.942v-5.287zM11.51.957v1.776a3.708 3.708 0 0 0-3.203 3.203H6.698a5.295 5.295 0 0 1 4.81-4.98zm0 2.721v2.258H9.25a2.772 2.772 0 0 1 2.258-2.258zm-4.82 8.427l1.551-1.552a.468.468 0 0 0-.661-.661l-.89.89v-3.91h4.819v2.155L9.25 11.285a.468.468 0 0 0 .662.661l1.596-1.596v3.637H6.69v-1.882zm4.819 2.818v5.287H9.567v-5.287h1.942zm-4.819 0h1.942v5.287H6.69v-5.287zm-2.877 0h1.941v5.287H3.813v-5.287zm-2.877 0h1.941v5.287H.936v-5.287zm0 8.095v-1.872h22.082v1.872H.936zm22.082-2.808h-1.942v-5.287h1.942v5.287z\"></path><path pid=\"1\" d=\"M9.202 9.593a.468.468 0 0 0-.666-.658l-.008.008a.468.468 0 0 0 .666.658l.008-.008zm4.671-.882l-.008.008a.468.468 0 0 0 .661.662l.008-.008a.468.468 0 0 0-.661-.662z\"></path></g></svg>', 3);
INSERT INTO `tiennghi` VALUES (17, 'Cửa sổ', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"Cửa sổ\" ><g fill=\"#000\" fill-rule=\"evenodd\"><path pid=\"0\" d=\"M22 21.01V4c.662-.002.998-.538 1-1.2V.4a.4.4 0 0 0-.4-.4H1.416a.4.4 0 0 0-.4.4v2.4c.002.662.322 1.198.984 1.2v17.01H.408a.4.4 0 0 0-.4.4v2.19c0 .22.18.4.4.4H23.6a.4.4 0 0 0 .4-.4v-2.19a.4.4 0 0 0-.4-.4H22zM2 2.62V.996h20V2.62a.4.4 0 0 1-.4.4H2.4a.4.4 0 0 1-.4-.4zM21 4v17.01H3V4h18zm2 19H1v-1h22v1z\" fill-rule=\"nonzero\"></path><path pid=\"1\" d=\"M19.612 5.032H4.449a.4.4 0 0 0-.4.4v14.184c0 .22.179.4.4.4h15.163a.4.4 0 0 0 .4-.4V5.432a.4.4 0 0 0-.4-.4zm-8.136 13.967H5.003V13h6.473V19zm0-7H5.003V6.005h6.473v5.994zm7.524 7h-6.45V13H19V19zm0-7h-6.45V6.005H19v5.994z\" fill-rule=\"nonzero\"></path><path pid=\"2\" d=\"M5.512 8l1.6-1.6.566.565-1.6 1.6zM5.679 10.315l3.6-3.599.565.566-3.6 3.6z\"></path></g></svg>', 3);
INSERT INTO `tiennghi` VALUES (18, 'Smart tivi', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><g fill-rule=\"evenodd\"><path pid=\"0\" fill-rule=\"nonzero\" d=\"M22.5 2h-21C.673 2 0 2.673 0 3.5v14c0 .827.673 1.5 1.5 1.5H10v1.077l-5.582.93a.5.5 0 0 0 .164.986L10.54 21h2.919l5.958.993a.497.497 0 0 0 .575-.411.5.5 0 0 0-.411-.575L14 20.077V19h8.5c.827 0 1.5-.673 1.5-1.5v-14c0-.827-.673-1.5-1.5-1.5zM13 20h-2v-1h2v1zm10-2.5a.5.5 0 0 1-.5.5h-21a.5.5 0 0 1-.5-.5v-14a.5.5 0 0 1 .5-.5h21a.5.5 0 0 1 .5.5v14z\"></path><path pid=\"1\" d=\"M12.121 13.084a.967.967 0 0 0-.97.964c0 .532.435.964.97.964.535 0 .97-.432.97-.964a.967.967 0 0 0-.97-.964zm-3.25-2.781a.506.506 0 0 0 0 .707.486.486 0 0 0 .695 0 3.406 3.406 0 0 1 4.868 0 .49.49 0 0 0 .695 0 .506.506 0 0 0 0-.707 4.379 4.379 0 0 0-6.258 0z\"></path><path pid=\"2\" d=\"M7.419 8.89a.47.47 0 0 0 0 .68.51.51 0 0 0 .704 0c2.138-2.065 5.615-2.065 7.754 0a.51.51 0 0 0 .704 0 .47.47 0 0 0 0-.68c-2.526-2.44-6.636-2.44-9.162 0zm2.669 2.922a.436.436 0 0 0 0 .655c.197.18.518.18.716 0 .574-.524 1.576-.524 2.15 0 .099.09.229.135.358.135a.53.53 0 0 0 .358-.135.436.436 0 0 0 0-.655c-.956-.874-2.627-.874-3.582 0z\"></path></g></svg>', 6);
INSERT INTO `tiennghi` VALUES (19, 'Phù hợp với trẻ nhỏ', '<svg version=\"1.1\" viewBox=\"0 0 24 24\" class=\"cozy__base--list-icon\" alt=\"\" ><path pid=\"0\" fill=\"#000\" fill-rule=\"nonzero\" d=\"M7 5.416c-1.048.18-2.054.416-3 .703V14h3V5.417zm1-.153V14h3.5V5.004c-1.197.02-2.37.107-3.5.26zm4.5-.259V14H16V5.263a29.966 29.966 0 0 0-3.5-.259zm4.5.412V14h3V6.12a24.728 24.728 0 0 0-3-.704zm4 1.034V14h2V7.304c-.622-.314-1.291-.6-2-.854zm2-.258V4.5a.5.5 0 0 1 1 0v16a.5.5 0 0 1-1 0V18H1v2.5a.5.5 0 1 1-1 0v-16a.5.5 0 1 1 1 0v1.692C3.99 4.792 7.875 4 12 4s8.011.792 11 2.192zM1 7.304V14h2V6.45c-.709.255-1.378.54-2 .854zM1 15v2h22v-2H1z\"></path></svg>', 4);

-- ----------------------------
-- Table structure for tiennghicategory
-- ----------------------------
DROP TABLE IF EXISTS `tiennghicategory`;
CREATE TABLE `tiennghicategory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenDanhMuc` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiennghicategory
-- ----------------------------
INSERT INTO `tiennghicategory` VALUES (1, 'Tiện ích');
INSERT INTO `tiennghicategory` VALUES (2, 'Tiện ích bếp');
INSERT INTO `tiennghicategory` VALUES (3, 'Tiện ích phòng');
INSERT INTO `tiennghicategory` VALUES (4, 'Tiện ích gia đình');
INSERT INTO `tiennghicategory` VALUES (5, 'Tiện ích giải trí');
INSERT INTO `tiennghicategory` VALUES (6, 'Tiện ích nổi bật');

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

-- ----------------------------
-- Records of tiennghicuaphong
-- ----------------------------
INSERT INTO `tiennghicuaphong` VALUES (1, 1);
INSERT INTO `tiennghicuaphong` VALUES (2, 1);
INSERT INTO `tiennghicuaphong` VALUES (32, 1);
INSERT INTO `tiennghicuaphong` VALUES (33, 1);
INSERT INTO `tiennghicuaphong` VALUES (36, 1);
INSERT INTO `tiennghicuaphong` VALUES (37, 1);
INSERT INTO `tiennghicuaphong` VALUES (38, 1);
INSERT INTO `tiennghicuaphong` VALUES (49, 1);
INSERT INTO `tiennghicuaphong` VALUES (50, 1);
INSERT INTO `tiennghicuaphong` VALUES (1, 2);
INSERT INTO `tiennghicuaphong` VALUES (32, 2);
INSERT INTO `tiennghicuaphong` VALUES (33, 2);
INSERT INTO `tiennghicuaphong` VALUES (36, 2);
INSERT INTO `tiennghicuaphong` VALUES (37, 2);
INSERT INTO `tiennghicuaphong` VALUES (49, 2);
INSERT INTO `tiennghicuaphong` VALUES (50, 2);
INSERT INTO `tiennghicuaphong` VALUES (1, 3);
INSERT INTO `tiennghicuaphong` VALUES (32, 3);
INSERT INTO `tiennghicuaphong` VALUES (33, 3);
INSERT INTO `tiennghicuaphong` VALUES (36, 3);
INSERT INTO `tiennghicuaphong` VALUES (37, 3);
INSERT INTO `tiennghicuaphong` VALUES (38, 3);
INSERT INTO `tiennghicuaphong` VALUES (49, 3);
INSERT INTO `tiennghicuaphong` VALUES (50, 3);
INSERT INTO `tiennghicuaphong` VALUES (1, 4);
INSERT INTO `tiennghicuaphong` VALUES (2, 4);
INSERT INTO `tiennghicuaphong` VALUES (32, 4);
INSERT INTO `tiennghicuaphong` VALUES (33, 4);
INSERT INTO `tiennghicuaphong` VALUES (36, 4);
INSERT INTO `tiennghicuaphong` VALUES (37, 4);
INSERT INTO `tiennghicuaphong` VALUES (49, 4);
INSERT INTO `tiennghicuaphong` VALUES (50, 4);
INSERT INTO `tiennghicuaphong` VALUES (1, 5);
INSERT INTO `tiennghicuaphong` VALUES (32, 5);
INSERT INTO `tiennghicuaphong` VALUES (33, 5);
INSERT INTO `tiennghicuaphong` VALUES (36, 5);
INSERT INTO `tiennghicuaphong` VALUES (37, 5);
INSERT INTO `tiennghicuaphong` VALUES (49, 5);
INSERT INTO `tiennghicuaphong` VALUES (50, 5);
INSERT INTO `tiennghicuaphong` VALUES (1, 6);
INSERT INTO `tiennghicuaphong` VALUES (32, 6);
INSERT INTO `tiennghicuaphong` VALUES (33, 6);
INSERT INTO `tiennghicuaphong` VALUES (36, 6);
INSERT INTO `tiennghicuaphong` VALUES (37, 6);
INSERT INTO `tiennghicuaphong` VALUES (49, 6);
INSERT INTO `tiennghicuaphong` VALUES (50, 6);
INSERT INTO `tiennghicuaphong` VALUES (1, 7);
INSERT INTO `tiennghicuaphong` VALUES (2, 7);
INSERT INTO `tiennghicuaphong` VALUES (32, 7);
INSERT INTO `tiennghicuaphong` VALUES (33, 7);
INSERT INTO `tiennghicuaphong` VALUES (36, 7);
INSERT INTO `tiennghicuaphong` VALUES (37, 7);
INSERT INTO `tiennghicuaphong` VALUES (49, 7);
INSERT INTO `tiennghicuaphong` VALUES (1, 8);
INSERT INTO `tiennghicuaphong` VALUES (2, 8);
INSERT INTO `tiennghicuaphong` VALUES (32, 8);
INSERT INTO `tiennghicuaphong` VALUES (33, 8);
INSERT INTO `tiennghicuaphong` VALUES (36, 8);
INSERT INTO `tiennghicuaphong` VALUES (37, 8);
INSERT INTO `tiennghicuaphong` VALUES (49, 8);
INSERT INTO `tiennghicuaphong` VALUES (1, 9);
INSERT INTO `tiennghicuaphong` VALUES (32, 9);
INSERT INTO `tiennghicuaphong` VALUES (33, 9);
INSERT INTO `tiennghicuaphong` VALUES (36, 9);
INSERT INTO `tiennghicuaphong` VALUES (37, 9);
INSERT INTO `tiennghicuaphong` VALUES (49, 9);
INSERT INTO `tiennghicuaphong` VALUES (50, 9);
INSERT INTO `tiennghicuaphong` VALUES (1, 10);
INSERT INTO `tiennghicuaphong` VALUES (2, 10);
INSERT INTO `tiennghicuaphong` VALUES (37, 10);
INSERT INTO `tiennghicuaphong` VALUES (49, 10);
INSERT INTO `tiennghicuaphong` VALUES (50, 10);
INSERT INTO `tiennghicuaphong` VALUES (1, 11);
INSERT INTO `tiennghicuaphong` VALUES (2, 11);
INSERT INTO `tiennghicuaphong` VALUES (36, 11);
INSERT INTO `tiennghicuaphong` VALUES (37, 11);
INSERT INTO `tiennghicuaphong` VALUES (49, 11);
INSERT INTO `tiennghicuaphong` VALUES (50, 11);
INSERT INTO `tiennghicuaphong` VALUES (1, 12);
INSERT INTO `tiennghicuaphong` VALUES (2, 12);
INSERT INTO `tiennghicuaphong` VALUES (49, 12);
INSERT INTO `tiennghicuaphong` VALUES (50, 12);
INSERT INTO `tiennghicuaphong` VALUES (1, 13);
INSERT INTO `tiennghicuaphong` VALUES (2, 13);
INSERT INTO `tiennghicuaphong` VALUES (36, 13);
INSERT INTO `tiennghicuaphong` VALUES (37, 13);
INSERT INTO `tiennghicuaphong` VALUES (49, 13);
INSERT INTO `tiennghicuaphong` VALUES (50, 13);
INSERT INTO `tiennghicuaphong` VALUES (1, 14);
INSERT INTO `tiennghicuaphong` VALUES (2, 14);
INSERT INTO `tiennghicuaphong` VALUES (49, 14);
INSERT INTO `tiennghicuaphong` VALUES (50, 14);
INSERT INTO `tiennghicuaphong` VALUES (1, 15);
INSERT INTO `tiennghicuaphong` VALUES (37, 15);
INSERT INTO `tiennghicuaphong` VALUES (49, 15);
INSERT INTO `tiennghicuaphong` VALUES (1, 16);
INSERT INTO `tiennghicuaphong` VALUES (2, 16);
INSERT INTO `tiennghicuaphong` VALUES (37, 16);
INSERT INTO `tiennghicuaphong` VALUES (49, 16);
INSERT INTO `tiennghicuaphong` VALUES (50, 16);
INSERT INTO `tiennghicuaphong` VALUES (1, 17);
INSERT INTO `tiennghicuaphong` VALUES (2, 17);
INSERT INTO `tiennghicuaphong` VALUES (37, 17);
INSERT INTO `tiennghicuaphong` VALUES (49, 17);
INSERT INTO `tiennghicuaphong` VALUES (50, 17);
INSERT INTO `tiennghicuaphong` VALUES (1, 18);
INSERT INTO `tiennghicuaphong` VALUES (49, 18);
INSERT INTO `tiennghicuaphong` VALUES (50, 18);
INSERT INTO `tiennghicuaphong` VALUES (1, 19);
INSERT INTO `tiennghicuaphong` VALUES (2, 19);
INSERT INTO `tiennghicuaphong` VALUES (49, 19);
INSERT INTO `tiennghicuaphong` VALUES (50, 19);

SET FOREIGN_KEY_CHECKS = 1;
