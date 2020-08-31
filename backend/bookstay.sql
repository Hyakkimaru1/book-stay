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

 Date: 25/08/2020 22:51:48
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
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `img` VALUES (162, 1, 'http://localhost:3300/imgs/1/file-1595766823007');
INSERT INTO `img` VALUES (163, 1, 'http://localhost:3300/imgs/1/file-1595766823022');
INSERT INTO `img` VALUES (164, 1, 'http://localhost:3300/imgs/1/file-1595766823044');
INSERT INTO `img` VALUES (165, 1, 'http://localhost:3300/imgs/1/file-1595766823044');
INSERT INTO `img` VALUES (166, 1, 'http://localhost:3300/imgs/1/file-1595766823064');
INSERT INTO `img` VALUES (167, 1, 'http://localhost:3300/imgs/1/file-1595766823065');
INSERT INTO `img` VALUES (168, 1, 'http://localhost:3300/imgs/1/file-1595766823084');
INSERT INTO `img` VALUES (169, 1, 'http://localhost:3300/imgs/1/file-1595766823096');
INSERT INTO `img` VALUES (170, 1, 'http://localhost:3300/imgs/1/file-1595766823108');
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
INSERT INTO `img` VALUES (268, 29, 'http://localhost:3300/imgs/29/file-room_32741_29_1569474072.jpg');
INSERT INTO `img` VALUES (269, 29, 'http://localhost:3300/imgs/29/file-room_32741_30_1569474073.jpg');
INSERT INTO `img` VALUES (270, 29, 'http://localhost:3300/imgs/29/file-room_32741_39_1569409868.jpg');
INSERT INTO `img` VALUES (271, 29, 'http://localhost:3300/imgs/29/file-room_32741_40_1569409869.jpg');
INSERT INTO `img` VALUES (272, 29, 'http://localhost:3300/imgs/29/file-room_32741_41_1569409870.jpg');
INSERT INTO `img` VALUES (273, 29, 'http://localhost:3300/imgs/29/file-room_32741_42_1569409871.jpg');
INSERT INTO `img` VALUES (274, 29, 'http://localhost:3300/imgs/29/file-room_32741_43_1569409872.jpg');
INSERT INTO `img` VALUES (275, 29, 'http://localhost:3300/imgs/29/file-room_32741_44_1569409873.jpg');
INSERT INTO `img` VALUES (276, 29, 'http://localhost:3300/imgs/29/file-room_32741_45_1569409874.jpg');
INSERT INTO `img` VALUES (277, 29, 'http://localhost:3300/imgs/29/file-room_32741_46_1569409875.jpg');
INSERT INTO `img` VALUES (278, 29, 'http://localhost:3300/imgs/29/file-sIa_vRru06yIzasca5GGlwx2.jpg');
INSERT INTO `img` VALUES (279, 29, 'http://localhost:3300/imgs/29/file-xLgEY6zjchsrDcg4pMubu8Q9.jpg');
INSERT INTO `img` VALUES (280, 29, 'http://localhost:3300/imgs/29/file-Xyo4JO5jtSomsWktKJLIBhfY.jpg');
INSERT INTO `img` VALUES (281, 29, 'http://localhost:3300/imgs/29/file-yds7oiBuyz9hKY99UTk1LMl2.jpg');
INSERT INTO `img` VALUES (282, 29, 'http://localhost:3300/imgs/29/file-zG4U6_6Bg5_L-C_9CgZVEanv.jpg');
INSERT INTO `img` VALUES (283, 29, 'http://localhost:3300/imgs/29/file-zTVEMsAtuhWxE_yGx_WKbCk3.jpg');
INSERT INTO `img` VALUES (284, 28, 'http://localhost:3300/imgs/28/file-room_32741_30_1569474073.jpg');
INSERT INTO `img` VALUES (285, 28, 'http://localhost:3300/imgs/28/file-room_32741_44_1569409873.jpg');
INSERT INTO `img` VALUES (286, 28, 'http://localhost:3300/imgs/28/file-room_32741_45_1569409874.jpg');
INSERT INTO `img` VALUES (287, 28, 'http://localhost:3300/imgs/28/file-room_32741_47_1569409876.jpg');
INSERT INTO `img` VALUES (288, 28, 'http://localhost:3300/imgs/28/file-room_32741_48_1569409877.jpg');
INSERT INTO `img` VALUES (289, 28, 'http://localhost:3300/imgs/28/file-sIa_vRru06yIzasca5GGlwx2.jpg');
INSERT INTO `img` VALUES (290, 28, 'http://localhost:3300/imgs/28/file-xLgEY6zjchsrDcg4pMubu8Q9.jpg');
INSERT INTO `img` VALUES (291, 28, 'http://localhost:3300/imgs/28/file-yds7oiBuyz9hKY99UTk1LMl2.jpg');
INSERT INTO `img` VALUES (292, 28, 'http://localhost:3300/imgs/28/file-zG4U6_6Bg5_L-C_9CgZVEanv.jpg');
INSERT INTO `img` VALUES (293, 28, 'http://localhost:3300/imgs/28/file-zTVEMsAtuhWxE_yGx_WKbCk3.jpg');
INSERT INTO `img` VALUES (294, 30, 'http://localhost:3300/imgs/30/file-5joRk8xJm0QpeJIcAg_pIpZj.jpg');
INSERT INTO `img` VALUES (295, 30, 'http://localhost:3300/imgs/30/file-7yLGNpZE_YKSJEa6sRWVOlGp.jpg');
INSERT INTO `img` VALUES (296, 30, 'http://localhost:3300/imgs/30/file-8MpPu2cVCF6yTfYSwEmRXebd.jpg');
INSERT INTO `img` VALUES (297, 30, 'http://localhost:3300/imgs/30/file-dRyTboTfYtX5qx4dlj68EoOQ.jpg');
INSERT INTO `img` VALUES (298, 30, 'http://localhost:3300/imgs/30/file-dvgNsZ5mGISE1LdMlRJnTyWA.jpg');
INSERT INTO `img` VALUES (299, 30, 'http://localhost:3300/imgs/30/file-dwIZr9RtPmq0lUApVECQntAS.jpg');
INSERT INTO `img` VALUES (300, 30, 'http://localhost:3300/imgs/30/file-fNVZ4t-fh4pMSdynkcbfNkgd.jpg');
INSERT INTO `img` VALUES (301, 30, 'http://localhost:3300/imgs/30/file-hRLzjFi1Uqng3tlrJvzo6Cvb.jpg');
INSERT INTO `img` VALUES (302, 30, 'http://localhost:3300/imgs/30/file-ibB-JXBfsyyKT8ibkophCYps.jpg');
INSERT INTO `img` VALUES (303, 30, 'http://localhost:3300/imgs/30/file-ODczQgtKa5a3CGOF7_tTw3x1.jpg');
INSERT INTO `img` VALUES (304, 30, 'http://localhost:3300/imgs/30/file-room_18193_4_1544932796.jpg');
INSERT INTO `img` VALUES (305, 30, 'http://localhost:3300/imgs/30/file-room_18193_13_1544932802.jpg');
INSERT INTO `img` VALUES (306, 30, 'http://localhost:3300/imgs/30/file-room_18193_19_1544932806.jpg');
INSERT INTO `img` VALUES (307, 31, 'http://localhost:3300/imgs/31/file-1sHqDRzxWJaiunrm8VbCvOlG.jpg');
INSERT INTO `img` VALUES (308, 31, 'http://localhost:3300/imgs/31/file-7yLGNpZE_YKSJEa6sRWVOlGp.jpg');
INSERT INTO `img` VALUES (309, 31, 'http://localhost:3300/imgs/31/file-8MpPu2cVCF6yTfYSwEmRXebd.jpg');
INSERT INTO `img` VALUES (310, 31, 'http://localhost:3300/imgs/31/file-65ayHJrWb3B5zXmUpz9_1ZvS.jpg');
INSERT INTO `img` VALUES (311, 31, 'http://localhost:3300/imgs/31/file-1531882036_114982116.jpg');
INSERT INTO `img` VALUES (312, 31, 'http://localhost:3300/imgs/31/file-1531882037_114980540.jpg');
INSERT INTO `img` VALUES (313, 31, 'http://localhost:3300/imgs/31/file-1531882038_114980538.jpg');
INSERT INTO `img` VALUES (314, 31, 'http://localhost:3300/imgs/31/file-1531882039_Room-4-1.jpg');
INSERT INTO `img` VALUES (315, 31, 'http://localhost:3300/imgs/31/file-1531882040_114980518.jpg');
INSERT INTO `img` VALUES (316, 31, 'http://localhost:3300/imgs/31/file-1531882041_Room-1-4.jpg');
INSERT INTO `img` VALUES (317, 31, 'http://localhost:3300/imgs/31/file-1531882042_Room-2-2.jpg');
INSERT INTO `img` VALUES (318, 31, 'http://localhost:3300/imgs/31/file-1531882042_Room-2-3.jpg');
INSERT INTO `img` VALUES (319, 31, 'http://localhost:3300/imgs/31/file-1531882042_Room-3-3.jpg');
INSERT INTO `img` VALUES (320, 31, 'http://localhost:3300/imgs/31/file-1531882043_Room-2-4.jpg');
INSERT INTO `img` VALUES (321, 31, 'http://localhost:3300/imgs/31/file-1531882043_Room-3-5.jpg');
INSERT INTO `img` VALUES (322, 31, 'http://localhost:3300/imgs/31/file-1531882044_Room-2-1.jpg');
INSERT INTO `img` VALUES (323, 31, 'http://localhost:3300/imgs/31/file-1531882044_Room-3-1.jpg');
INSERT INTO `img` VALUES (324, 31, 'http://localhost:3300/imgs/31/file-1531882045_Room-3-6.jpg');
INSERT INTO `img` VALUES (325, 31, 'http://localhost:3300/imgs/31/file-dRyTboTfYtX5qx4dlj68EoOQ.jpg');
INSERT INTO `img` VALUES (326, 34, 'http://localhost:3300/imgs/34/file-1531882043_Room-2-4.jpg');
INSERT INTO `img` VALUES (327, 34, 'http://localhost:3300/imgs/34/file-1531882044_Room-2-1 - Copy.jpg');
INSERT INTO `img` VALUES (328, 34, 'http://localhost:3300/imgs/34/file-1531882045_Room-3-6 - Copy.jpg');
INSERT INTO `img` VALUES (329, 34, 'http://localhost:3300/imgs/34/file-1531882045_Room-3-6.jpg');
INSERT INTO `img` VALUES (330, 34, 'http://localhost:3300/imgs/34/file-dRyTboTfYtX5qx4dlj68EoOQ - Copy.jpg');
INSERT INTO `img` VALUES (331, 34, 'http://localhost:3300/imgs/34/file-dvgNsZ5mGISE1LdMlRJnTyWA - Copy.jpg');
INSERT INTO `img` VALUES (332, 34, 'http://localhost:3300/imgs/34/file-dwIZr9RtPmq0lUApVECQntAS - Copy.jpg');
INSERT INTO `img` VALUES (333, 34, 'http://localhost:3300/imgs/34/file-fNVZ4t-fh4pMSdynkcbfNkgd - Copy.jpg');
INSERT INTO `img` VALUES (334, 34, 'http://localhost:3300/imgs/34/file-ibB-JXBfsyyKT8ibkophCYps.jpg');
INSERT INTO `img` VALUES (335, 34, 'http://localhost:3300/imgs/34/file-ODczQgtKa5a3CGOF7_tTw3x1.jpg');
INSERT INTO `img` VALUES (336, 35, 'http://localhost:3300/imgs/35/file-1531882040_114980518.jpg');
INSERT INTO `img` VALUES (337, 35, 'http://localhost:3300/imgs/35/file-1531882041_Room-1-4.jpg');
INSERT INTO `img` VALUES (338, 35, 'http://localhost:3300/imgs/35/file-1531882043_Room-2-4.jpg');
INSERT INTO `img` VALUES (339, 35, 'http://localhost:3300/imgs/35/file-1531882044_Room-2-1.jpg');
INSERT INTO `img` VALUES (340, 35, 'http://localhost:3300/imgs/35/file-1531882044_Room-3-1.jpg');
INSERT INTO `img` VALUES (341, 35, 'http://localhost:3300/imgs/35/file-1531882045_Room-3-6.jpg');
INSERT INTO `img` VALUES (342, 35, 'http://localhost:3300/imgs/35/file-dRyTboTfYtX5qx4dlj68EoOQ - Copy.jpg');
INSERT INTO `img` VALUES (343, 35, 'http://localhost:3300/imgs/35/file-dRyTboTfYtX5qx4dlj68EoOQ.jpg');
INSERT INTO `img` VALUES (344, 35, 'http://localhost:3300/imgs/35/file-dvgNsZ5mGISE1LdMlRJnTyWA - Copy.jpg');
INSERT INTO `img` VALUES (345, 35, 'http://localhost:3300/imgs/35/file-dvgNsZ5mGISE1LdMlRJnTyWA.jpg');
INSERT INTO `img` VALUES (346, 35, 'http://localhost:3300/imgs/35/file-dwIZr9RtPmq0lUApVECQntAS - Copy.jpg');
INSERT INTO `img` VALUES (347, 35, 'http://localhost:3300/imgs/35/file-ibB-JXBfsyyKT8ibkophCYps.jpg');
INSERT INTO `img` VALUES (348, 35, 'http://localhost:3300/imgs/35/file-room_18193_7_1544932798.jpg');
INSERT INTO `img` VALUES (349, 37, 'http://localhost:3300/imgs/37/file-5tYoOHhmpiXAplmMjEC4m-7k.jpg');
INSERT INTO `img` VALUES (350, 37, 'http://localhost:3300/imgs/37/file-DkYzhyUMepvnUYWdpvZ5ioZD.jpg');
INSERT INTO `img` VALUES (351, 37, 'http://localhost:3300/imgs/37/file-IVosRNl7NHz5s65bdZXJQV_x.png');
INSERT INTO `img` VALUES (352, 37, 'http://localhost:3300/imgs/37/file-mBtzOjQujrXfScFI1X5XK6y0.jpg');
INSERT INTO `img` VALUES (353, 37, 'http://localhost:3300/imgs/37/file-NTXYR8-3eFganLaWinU5cHIs.png');
INSERT INTO `img` VALUES (354, 37, 'http://localhost:3300/imgs/37/file-RK0-8lI4t96FjHrO68IrkdpU.jpg');
INSERT INTO `img` VALUES (355, 37, 'http://localhost:3300/imgs/37/file-t6Bj5VvDvPXoVGqgcIyErvrH.jpg');
INSERT INTO `img` VALUES (356, 37, 'http://localhost:3300/imgs/37/file-U71YbBxOMn--DmEYw9U1RSwz.jpg');
INSERT INTO `img` VALUES (357, 38, 'http://localhost:3300/imgs/38/file-DSCF3064.jpg');
INSERT INTO `img` VALUES (358, 38, 'http://localhost:3300/imgs/38/file-DSCF3070.jpg');
INSERT INTO `img` VALUES (359, 38, 'http://localhost:3300/imgs/38/file-DSCF3107.jpg');
INSERT INTO `img` VALUES (360, 38, 'http://localhost:3300/imgs/38/file-DSCF3118.jpg');
INSERT INTO `img` VALUES (361, 38, 'http://localhost:3300/imgs/38/file-DSCF3121.jpg');
INSERT INTO `img` VALUES (362, 38, 'http://localhost:3300/imgs/38/file-DSCF3132.jpg');
INSERT INTO `img` VALUES (363, 38, 'http://localhost:3300/imgs/38/file-DSCF3151.jpg');
INSERT INTO `img` VALUES (364, 38, 'http://localhost:3300/imgs/38/file-DSCF3196.jpg');
INSERT INTO `img` VALUES (365, 38, 'http://localhost:3300/imgs/38/file-DSCF3226.jpg');
INSERT INTO `img` VALUES (366, 38, 'http://localhost:3300/imgs/38/file-IVosRNl7NHz5s65bdZXJQV_x.png');
INSERT INTO `img` VALUES (367, 38, 'http://localhost:3300/imgs/38/file-mBtzOjQujrXfScFI1X5XK6y0.jpg');
INSERT INTO `img` VALUES (368, 56, 'http://localhost:3300/imgs/56/file--0WadafNQBZ-UpmwwayqriFD.jpg');
INSERT INTO `img` VALUES (369, 56, 'http://localhost:3300/imgs/56/file-5tYoOHhmpiXAplmMjEC4m-7k.jpg');
INSERT INTO `img` VALUES (370, 56, 'http://localhost:3300/imgs/56/file-08oslxFzdrMS_Kdv-2pJdbLc.jpg');
INSERT INTO `img` VALUES (371, 56, 'http://localhost:3300/imgs/56/file-aMOT7eMJHfwUCNJxhPEqgdeo.jpg');
INSERT INTO `img` VALUES (372, 56, 'http://localhost:3300/imgs/56/file-AUl6KCT79lijiuFQ749WNrwH.jpg');
INSERT INTO `img` VALUES (373, 56, 'http://localhost:3300/imgs/56/file-CguE3Ps6aXjJ8MizRmK_AJFz.jpg');
INSERT INTO `img` VALUES (374, 56, 'http://localhost:3300/imgs/56/file-DkYzhyUMepvnUYWdpvZ5ioZD.jpg');
INSERT INTO `img` VALUES (375, 56, 'http://localhost:3300/imgs/56/file-DSCF3048.jpg');
INSERT INTO `img` VALUES (376, 56, 'http://localhost:3300/imgs/56/file-DSCF3226.jpg');
INSERT INTO `img` VALUES (377, 56, 'http://localhost:3300/imgs/56/file-NTXYR8-3eFganLaWinU5cHIs.png');
INSERT INTO `img` VALUES (378, 57, 'http://localhost:3300/imgs/57/file--0WadafNQBZ-UpmwwayqriFD.jpg');
INSERT INTO `img` VALUES (379, 57, 'http://localhost:3300/imgs/57/file-5tYoOHhmpiXAplmMjEC4m-7k.jpg');
INSERT INTO `img` VALUES (380, 57, 'http://localhost:3300/imgs/57/file-08oslxFzdrMS_Kdv-2pJdbLc.jpg');
INSERT INTO `img` VALUES (381, 57, 'http://localhost:3300/imgs/57/file-aMOT7eMJHfwUCNJxhPEqgdeo.jpg');
INSERT INTO `img` VALUES (382, 57, 'http://localhost:3300/imgs/57/file-AUl6KCT79lijiuFQ749WNrwH.jpg');
INSERT INTO `img` VALUES (383, 57, 'http://localhost:3300/imgs/57/file-DkYzhyUMepvnUYWdpvZ5ioZD.jpg');
INSERT INTO `img` VALUES (384, 57, 'http://localhost:3300/imgs/57/file-DSCF3048.jpg');
INSERT INTO `img` VALUES (385, 58, 'http://localhost:3300/imgs/58/file--0WadafNQBZ-UpmwwayqriFD.jpg');
INSERT INTO `img` VALUES (386, 58, 'http://localhost:3300/imgs/58/file-5tYoOHhmpiXAplmMjEC4m-7k.jpg');
INSERT INTO `img` VALUES (387, 58, 'http://localhost:3300/imgs/58/file-08oslxFzdrMS_Kdv-2pJdbLc.jpg');
INSERT INTO `img` VALUES (388, 58, 'http://localhost:3300/imgs/58/file-aMOT7eMJHfwUCNJxhPEqgdeo.jpg');
INSERT INTO `img` VALUES (389, 58, 'http://localhost:3300/imgs/58/file-DSCF3048.jpg');
INSERT INTO `img` VALUES (390, 58, 'http://localhost:3300/imgs/58/file-DSCF3056.jpg');
INSERT INTO `img` VALUES (391, 58, 'http://localhost:3300/imgs/58/file-DSCF3064.jpg');
INSERT INTO `img` VALUES (392, 58, 'http://localhost:3300/imgs/58/file-kkDt3XrWSKjSN1wPbHsdPFl_.jpg');
INSERT INTO `img` VALUES (393, 58, 'http://localhost:3300/imgs/58/file-L571EGkJEWJBUqYaVNtZUTuF.jpg');
INSERT INTO `img` VALUES (394, 59, 'http://localhost:3300/imgs/59/file-slzSMCTyrzP8HvntQg97Iecz.jpg');
INSERT INTO `img` VALUES (395, 59, 'http://localhost:3300/imgs/59/file-t6Bj5VvDvPXoVGqgcIyErvrH.jpg');
INSERT INTO `img` VALUES (396, 59, 'http://localhost:3300/imgs/59/file-tHTOIoiakiipmlh2hspTnBYq.jpg');
INSERT INTO `img` VALUES (397, 59, 'http://localhost:3300/imgs/59/file-U71YbBxOMn--DmEYw9U1RSwz.jpg');
INSERT INTO `img` VALUES (398, 59, 'http://localhost:3300/imgs/59/file-uXPI4Rrbbpyei_ofGYGXSETH.jpg');
INSERT INTO `img` VALUES (399, 60, 'http://localhost:3300/imgs/60/file-_9Hgm-7tMDc8kNuR8x_A3ujt.jpg');
INSERT INTO `img` VALUES (400, 60, 'http://localhost:3300/imgs/60/file-0AMXlALNH4dxs_T9t5siWILu.jpg');
INSERT INTO `img` VALUES (401, 60, 'http://localhost:3300/imgs/60/file-0zum-eEAlCfJ2ko8fRJJolIj.jpg');
INSERT INTO `img` VALUES (402, 60, 'http://localhost:3300/imgs/60/file-1lP8LwT6vDWbBW06caDIihSh.jpg');
INSERT INTO `img` VALUES (403, 60, 'http://localhost:3300/imgs/60/file-9C_0EsdSSYndFQFGiOVFjvTs.jpg');
INSERT INTO `img` VALUES (404, 60, 'http://localhost:3300/imgs/60/file-14TV89QAdStalIwme22GOT_D.jpg');
INSERT INTO `img` VALUES (405, 60, 'http://localhost:3300/imgs/60/file-BLEhqby0hzTQ7z0WptRa1wd_.jpg');
INSERT INTO `img` VALUES (406, 60, 'http://localhost:3300/imgs/60/file-kGAXZ1QKnX_FXPZvju8HO8cv.jpg');
INSERT INTO `img` VALUES (407, 60, 'http://localhost:3300/imgs/60/file-Mw6TIMGuNvb7RhN3KxmpFWcr.jpg');
INSERT INTO `img` VALUES (408, 61, 'http://localhost:3300/imgs/61/file-_2pL7ccO3FRW-nyaebG9lycn.jpg');
INSERT INTO `img` VALUES (409, 61, 'http://localhost:3300/imgs/61/file-_9Hgm-7tMDc8kNuR8x_A3ujt.jpg');
INSERT INTO `img` VALUES (410, 61, 'http://localhost:3300/imgs/61/file-0AMXlALNH4dxs_T9t5siWILu.jpg');
INSERT INTO `img` VALUES (411, 61, 'http://localhost:3300/imgs/61/file-0zum-eEAlCfJ2ko8fRJJolIj.jpg');
INSERT INTO `img` VALUES (412, 61, 'http://localhost:3300/imgs/61/file-hyY7SKONGm35NR1jbGVv1_5b.png');
INSERT INTO `img` VALUES (413, 61, 'http://localhost:3300/imgs/61/file-Mw6TIMGuNvb7RhN3KxmpFWcr.jpg');
INSERT INTO `img` VALUES (414, 61, 'http://localhost:3300/imgs/61/file-Rl8XIEMayYzrLExgu18pCjAc.jpg');
INSERT INTO `img` VALUES (415, 61, 'http://localhost:3300/imgs/61/file-v-fVm71tpOhJcxo6g1fpYAVQ.jpg');
INSERT INTO `img` VALUES (416, 61, 'http://localhost:3300/imgs/61/file-XcRW24fZ2RU73Hi0GgEhdPdu.jpg');
INSERT INTO `img` VALUES (417, 61, 'http://localhost:3300/imgs/61/file-YtZdpA2K4b4WBhxddSYchlw8.png');
INSERT INTO `img` VALUES (418, 61, 'http://localhost:3300/imgs/61/file-zuxU26cRCcDmq6nVXo5PFTCn.jpg');
INSERT INTO `img` VALUES (419, 61, 'http://localhost:3300/imgs/61/file-zW8BlkIaW5_lOGIX2Xy8Mwnl.png');
INSERT INTO `img` VALUES (420, 62, 'http://localhost:3300/imgs/62/file-p7ClIecJbl0mMQFH-3yGJfEq.jpg');
INSERT INTO `img` VALUES (421, 62, 'http://localhost:3300/imgs/62/file-pjVyPe3gQuEcm1hKBNExobKF.jpg');
INSERT INTO `img` VALUES (422, 62, 'http://localhost:3300/imgs/62/file-PYwn0jtc_6zeqZdb3b_3orPj.png');
INSERT INTO `img` VALUES (423, 62, 'http://localhost:3300/imgs/62/file-room_34085_1_1570879026.jpg');
INSERT INTO `img` VALUES (424, 62, 'http://localhost:3300/imgs/62/file-room_34085_2_1570879028.jpg');
INSERT INTO `img` VALUES (425, 62, 'http://localhost:3300/imgs/62/file-room_34085_4_1570879031.jpg');
INSERT INTO `img` VALUES (426, 62, 'http://localhost:3300/imgs/62/file-room_34085_6_1570879034.jpg');
INSERT INTO `img` VALUES (427, 62, 'http://localhost:3300/imgs/62/file-room_34085_7_1570879036.jpg');
INSERT INTO `img` VALUES (428, 62, 'http://localhost:3300/imgs/62/file-room_34085_8_1570879037.jpg');
INSERT INTO `img` VALUES (429, 62, 'http://localhost:3300/imgs/62/file-room_34085_9_1570879039.jpg');
INSERT INTO `img` VALUES (430, 62, 'http://localhost:3300/imgs/62/file-v-fVm71tpOhJcxo6g1fpYAVQ.jpg');
INSERT INTO `img` VALUES (431, 62, 'http://localhost:3300/imgs/62/file-XcRW24fZ2RU73Hi0GgEhdPdu.jpg');
INSERT INTO `img` VALUES (432, 62, 'http://localhost:3300/imgs/62/file-YtZdpA2K4b4WBhxddSYchlw8.png');
INSERT INTO `img` VALUES (433, 62, 'http://localhost:3300/imgs/62/file-zuxU26cRCcDmq6nVXo5PFTCn.jpg');
INSERT INTO `img` VALUES (434, 62, 'http://localhost:3300/imgs/62/file-zW8BlkIaW5_lOGIX2Xy8Mwnl.png');
INSERT INTO `img` VALUES (435, 63, 'http://localhost:3300/imgs/63/file-ogosj5Bj9wWNzSgZlTw2fwbD.png');
INSERT INTO `img` VALUES (436, 63, 'http://localhost:3300/imgs/63/file-QPzaaXJB-O2fn6yYEDecriwp.jpg');
INSERT INTO `img` VALUES (437, 63, 'http://localhost:3300/imgs/63/file-room_34085_6_1570879034.jpg');
INSERT INTO `img` VALUES (438, 63, 'http://localhost:3300/imgs/63/file-room_34085_7_1570879036.jpg');
INSERT INTO `img` VALUES (439, 63, 'http://localhost:3300/imgs/63/file-room_34085_8_1570879037.jpg');
INSERT INTO `img` VALUES (440, 63, 'http://localhost:3300/imgs/63/file-room_34085_9_1570879039.jpg');
INSERT INTO `img` VALUES (441, 63, 'http://localhost:3300/imgs/63/file-SFvuJ3crpb3CMIp9OTkrkSRs.jpg');
INSERT INTO `img` VALUES (442, 63, 'http://localhost:3300/imgs/63/file-v-fVm71tpOhJcxo6g1fpYAVQ.jpg');
INSERT INTO `img` VALUES (443, 63, 'http://localhost:3300/imgs/63/file-XcRW24fZ2RU73Hi0GgEhdPdu.jpg');
INSERT INTO `img` VALUES (444, 63, 'http://localhost:3300/imgs/63/file-YtZdpA2K4b4WBhxddSYchlw8.png');
INSERT INTO `img` VALUES (445, 64, 'http://localhost:3300/imgs/64/file-SFvuJ3crpb3CMIp9OTkrkSRs.jpg');
INSERT INTO `img` VALUES (446, 64, 'http://localhost:3300/imgs/64/file-v-fVm71tpOhJcxo6g1fpYAVQ.jpg');
INSERT INTO `img` VALUES (447, 64, 'http://localhost:3300/imgs/64/file-XcRW24fZ2RU73Hi0GgEhdPdu.jpg');
INSERT INTO `img` VALUES (448, 64, 'http://localhost:3300/imgs/64/file-YtZdpA2K4b4WBhxddSYchlw8.png');
INSERT INTO `img` VALUES (449, 64, 'http://localhost:3300/imgs/64/file-zomSwBPAKWBO1BwlvbJqSO21.jpg');
INSERT INTO `img` VALUES (450, 64, 'http://localhost:3300/imgs/64/file-zuxU26cRCcDmq6nVXo5PFTCn.jpg');
INSERT INTO `img` VALUES (451, 64, 'http://localhost:3300/imgs/64/file-zW8BlkIaW5_lOGIX2Xy8Mwnl.png');
INSERT INTO `img` VALUES (452, 65, 'http://localhost:3300/imgs/65/file-Q3hoJqnIVyQr175wllLtVUTn.jpg');
INSERT INTO `img` VALUES (453, 65, 'http://localhost:3300/imgs/65/file-QPzaaXJB-O2fn6yYEDecriwp.jpg');
INSERT INTO `img` VALUES (454, 65, 'http://localhost:3300/imgs/65/file-room_34085_1_1570879026.jpg');
INSERT INTO `img` VALUES (455, 65, 'http://localhost:3300/imgs/65/file-room_34085_2_1570879028.jpg');
INSERT INTO `img` VALUES (456, 65, 'http://localhost:3300/imgs/65/file-room_34085_4_1570879031.jpg');
INSERT INTO `img` VALUES (457, 65, 'http://localhost:3300/imgs/65/file-room_34085_5_1570879033.jpg');
INSERT INTO `img` VALUES (458, 65, 'http://localhost:3300/imgs/65/file-room_34085_7_1570879036.jpg');
INSERT INTO `img` VALUES (459, 65, 'http://localhost:3300/imgs/65/file-room_34085_8_1570879037.jpg');
INSERT INTO `img` VALUES (460, 65, 'http://localhost:3300/imgs/65/file-room_34085_9_1570879039.jpg');
INSERT INTO `img` VALUES (461, 65, 'http://localhost:3300/imgs/65/file-v-fVm71tpOhJcxo6g1fpYAVQ.jpg');
INSERT INTO `img` VALUES (462, 65, 'http://localhost:3300/imgs/65/file-XcRW24fZ2RU73Hi0GgEhdPdu.jpg');
INSERT INTO `img` VALUES (463, 65, 'http://localhost:3300/imgs/65/file-YtZdpA2K4b4WBhxddSYchlw8.png');
INSERT INTO `img` VALUES (464, 66, 'http://localhost:3300/imgs/66/file-room_34085_7_1570879036.jpg');
INSERT INTO `img` VALUES (465, 66, 'http://localhost:3300/imgs/66/file-room_34085_8_1570879037.jpg');
INSERT INTO `img` VALUES (466, 66, 'http://localhost:3300/imgs/66/file-room_34085_9_1570879039.jpg');
INSERT INTO `img` VALUES (467, 66, 'http://localhost:3300/imgs/66/file-SFvuJ3crpb3CMIp9OTkrkSRs.jpg');
INSERT INTO `img` VALUES (468, 66, 'http://localhost:3300/imgs/66/file-v-fVm71tpOhJcxo6g1fpYAVQ.jpg');
INSERT INTO `img` VALUES (469, 66, 'http://localhost:3300/imgs/66/file-XcRW24fZ2RU73Hi0GgEhdPdu.jpg');
INSERT INTO `img` VALUES (470, 66, 'http://localhost:3300/imgs/66/file-YtZdpA2K4b4WBhxddSYchlw8.png');
INSERT INTO `img` VALUES (471, 66, 'http://localhost:3300/imgs/66/file-zomSwBPAKWBO1BwlvbJqSO21.jpg');
INSERT INTO `img` VALUES (472, 66, 'http://localhost:3300/imgs/66/file-zuxU26cRCcDmq6nVXo5PFTCn.jpg');
INSERT INTO `img` VALUES (473, 66, 'http://localhost:3300/imgs/66/file-zW8BlkIaW5_lOGIX2Xy8Mwnl.png');
INSERT INTO `img` VALUES (474, 67, 'http://localhost:3300/imgs/67/file-_2pL7ccO3FRW-nyaebG9lycn.jpg');
INSERT INTO `img` VALUES (475, 67, 'http://localhost:3300/imgs/67/file-_9Hgm-7tMDc8kNuR8x_A3ujt.jpg');
INSERT INTO `img` VALUES (476, 67, 'http://localhost:3300/imgs/67/file-0AMXlALNH4dxs_T9t5siWILu.jpg');
INSERT INTO `img` VALUES (477, 67, 'http://localhost:3300/imgs/67/file-0zum-eEAlCfJ2ko8fRJJolIj.jpg');
INSERT INTO `img` VALUES (478, 67, 'http://localhost:3300/imgs/67/file-1lP8LwT6vDWbBW06caDIihSh.jpg');
INSERT INTO `img` VALUES (479, 67, 'http://localhost:3300/imgs/67/file-5KSn1a_c3ePQ_BTL3mV_qjpt.jpg');
INSERT INTO `img` VALUES (480, 67, 'http://localhost:3300/imgs/67/file-9C_0EsdSSYndFQFGiOVFjvTs.jpg');
INSERT INTO `img` VALUES (481, 67, 'http://localhost:3300/imgs/67/file-14TV89QAdStalIwme22GOT_D.jpg');
INSERT INTO `img` VALUES (482, 68, 'http://localhost:3300/imgs/68/file-20200204_030205513_iOS.jpg');
INSERT INTO `img` VALUES (483, 68, 'http://localhost:3300/imgs/68/file-20200204_030205519_iOS.jpg');
INSERT INTO `img` VALUES (484, 68, 'http://localhost:3300/imgs/68/file-20200204_030205726_iOS.jpg');
INSERT INTO `img` VALUES (485, 68, 'http://localhost:3300/imgs/68/file-20200204_030205867_iOS.jpg');
INSERT INTO `img` VALUES (486, 68, 'http://localhost:3300/imgs/68/file-20200204_030205879_iOS.jpg');
INSERT INTO `img` VALUES (487, 68, 'http://localhost:3300/imgs/68/file-20200204_030205886_iOS.jpg');
INSERT INTO `img` VALUES (488, 68, 'http://localhost:3300/imgs/68/file-20200204_030205896_iOS.jpg');
INSERT INTO `img` VALUES (489, 68, 'http://localhost:3300/imgs/68/file-20200204_030205900_iOS.jpg');
INSERT INTO `img` VALUES (490, 68, 'http://localhost:3300/imgs/68/file-20200204_030205906_iOS.jpg');
INSERT INTO `img` VALUES (491, 68, 'http://localhost:3300/imgs/68/file-20200204_030205910_iOS.jpg');
INSERT INTO `img` VALUES (492, 68, 'http://localhost:3300/imgs/68/file-20200204_030205911_iOS.jpg');
INSERT INTO `img` VALUES (493, 68, 'http://localhost:3300/imgs/68/file-20200204_030205914_iOS.jpg');
INSERT INTO `img` VALUES (494, 68, 'http://localhost:3300/imgs/68/file-20200204_030206033_iOS.jpg');
INSERT INTO `img` VALUES (495, 68, 'http://localhost:3300/imgs/68/file-20200204_030206195_iOS.jpg');
INSERT INTO `img` VALUES (496, 68, 'http://localhost:3300/imgs/68/file-20200204_030206561_iOS.jpg');
INSERT INTO `img` VALUES (497, 68, 'http://localhost:3300/imgs/68/file-20200204_030206986_iOS.jpg');
INSERT INTO `img` VALUES (498, 68, 'http://localhost:3300/imgs/68/file-20200204_030207137_iOS.jpg');
INSERT INTO `img` VALUES (499, 69, 'http://localhost:3300/imgs/69/file-room_33653_155_1569902607.jpg');
INSERT INTO `img` VALUES (500, 69, 'http://localhost:3300/imgs/69/file-room_33653_156_1569902607.jpg');
INSERT INTO `img` VALUES (501, 69, 'http://localhost:3300/imgs/69/file-room_33653_157_1569902608.jpg');
INSERT INTO `img` VALUES (502, 69, 'http://localhost:3300/imgs/69/file-room_33653_158_1569902609.jpg');
INSERT INTO `img` VALUES (503, 69, 'http://localhost:3300/imgs/69/file-room_33653_159_1569902609.jpg');
INSERT INTO `img` VALUES (504, 69, 'http://localhost:3300/imgs/69/file-room_33653_160_1569902706.jpg');
INSERT INTO `img` VALUES (505, 69, 'http://localhost:3300/imgs/69/file-room_33653_161_1569902707.jpg');
INSERT INTO `img` VALUES (506, 69, 'http://localhost:3300/imgs/69/file-room_33653_162_1569902707.jpg');
INSERT INTO `img` VALUES (507, 69, 'http://localhost:3300/imgs/69/file-room_33653_165_1569902709.jpg');
INSERT INTO `img` VALUES (508, 69, 'http://localhost:3300/imgs/69/file-room_33653_166_1569902710.jpg');
INSERT INTO `img` VALUES (509, 69, 'http://localhost:3300/imgs/69/file-room_33653_184_1569902721.jpg');
INSERT INTO `img` VALUES (510, 70, 'http://localhost:3300/imgs/70/file-room_18668_3_1571761258.jpg');
INSERT INTO `img` VALUES (511, 70, 'http://localhost:3300/imgs/70/file-room_18668_4_1571761259.jpg');
INSERT INTO `img` VALUES (512, 70, 'http://localhost:3300/imgs/70/file-room_18668_5_1571761477 (1).jpg');
INSERT INTO `img` VALUES (513, 70, 'http://localhost:3300/imgs/70/file-room_18668_5_1571761477.jpg');
INSERT INTO `img` VALUES (514, 70, 'http://localhost:3300/imgs/70/file-room_18668_6_1571761517.jpg');
INSERT INTO `img` VALUES (515, 70, 'http://localhost:3300/imgs/70/file-room_18668_22_1570117160.jpg');
INSERT INTO `img` VALUES (516, 70, 'http://localhost:3300/imgs/70/file-room_18668_23_1570117161.jpg');
INSERT INTO `img` VALUES (517, 70, 'http://localhost:3300/imgs/70/file-room_18668_26_1570117163.jpg');
INSERT INTO `img` VALUES (518, 71, 'http://localhost:3300/imgs/71/file-610A2960.jpg');
INSERT INTO `img` VALUES (519, 71, 'http://localhost:3300/imgs/71/file-f542dbda2f86d6d88f97.jpg');
INSERT INTO `img` VALUES (520, 71, 'http://localhost:3300/imgs/71/file-room_18668_22_1570117160.jpg');
INSERT INTO `img` VALUES (521, 71, 'http://localhost:3300/imgs/71/file-room_29985_2_1565973340.jpg');
INSERT INTO `img` VALUES (522, 71, 'http://localhost:3300/imgs/71/file-room_29985_3_1565973439.jpg');
INSERT INTO `img` VALUES (523, 71, 'http://localhost:3300/imgs/71/file-room_29985_4_1565973470.jpg');
INSERT INTO `img` VALUES (524, 71, 'http://localhost:3300/imgs/71/file-room_29985_5_1565973511.jpg');
INSERT INTO `img` VALUES (525, 71, 'http://localhost:3300/imgs/71/file-room_29985_7_1565973625.jpg');
INSERT INTO `img` VALUES (526, 71, 'http://localhost:3300/imgs/71/file-room_29985_8_1565973647.jpg');
INSERT INTO `img` VALUES (527, 71, 'http://localhost:3300/imgs/71/file-room_29985_97_1566206472.jpg');
INSERT INTO `img` VALUES (528, 72, 'http://localhost:3300/imgs/72/file-room_18668_6_1571761517.jpg');
INSERT INTO `img` VALUES (529, 72, 'http://localhost:3300/imgs/72/file-room_18668_22_1570117160.jpg');
INSERT INTO `img` VALUES (530, 72, 'http://localhost:3300/imgs/72/file-room_29985_2_1565973340.jpg');
INSERT INTO `img` VALUES (531, 72, 'http://localhost:3300/imgs/72/file-room_29985_3_1565973439.jpg');
INSERT INTO `img` VALUES (532, 72, 'http://localhost:3300/imgs/72/file-room_29985_7_1565973625.jpg');
INSERT INTO `img` VALUES (533, 72, 'http://localhost:3300/imgs/72/file-room_29985_8_1565973647.jpg');
INSERT INTO `img` VALUES (534, 73, 'http://localhost:3300/imgs/73/file-room_22212_247_1552906475.jpg');
INSERT INTO `img` VALUES (535, 73, 'http://localhost:3300/imgs/73/file-room_22212_241_1552906293.jpg');
INSERT INTO `img` VALUES (536, 73, 'http://localhost:3300/imgs/73/file-mPRDo-QolDifE8uty5Ya9p0b.jpg');
INSERT INTO `img` VALUES (537, 73, 'http://localhost:3300/imgs/73/file-room_24262_560_1558603431.jpg');
INSERT INTO `img` VALUES (538, 73, 'http://localhost:3300/imgs/73/file-room_24262_569_1558603448.jpg');
INSERT INTO `img` VALUES (539, 73, 'http://localhost:3300/imgs/73/file-room_24262_1_1560166410.jpg');

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
INSERT INTO `nguoidung` VALUES (2, 'b@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Duy Duy', '2020-06-26', 'a', '0355196555', 'hehee 123', 1, 'https://cdn.luxstay.com/users/45593/avatar_5b53b9b8-9b92-4632-9e1c-bcd51b683241.', '2020-08-25 22:46:02', 1, 0);
INSERT INTO `nguoidung` VALUES (3, 'k@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Lê Thị Việt Dương', '2020-08-21', 'hehe', '', '', 1, 'https://lh3.googleusercontent.com/-V96Xmm9xLBE/AAAAAAAAAAI/AAAAAAAAABo/xwB_4iAqHUc/s96-c/photo.jpg', '2020-08-21 16:51:45', 0, 0);
INSERT INTO `nguoidung` VALUES (4, 'a@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Huynh Duy', '2020-08-21', 'Đăk Lăk', '0355196515', 'TUi 21 tuổi', 1, 'http://localhost:3300/imgs/user/4/file-20200306_133031.jpg', '2020-08-21 23:30:55', 2, 0);
INSERT INTO `nguoidung` VALUES (5, 'bt@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Bùi Tuấn', NULL, NULL, NULL, NULL, NULL, 'https://cdn.luxstay.com/users/275656/avatar_63591e41-e370-4503-b7cc-8c8f0f783b49.jpg', '2020-08-25 22:46:17', 3, 0);
INSERT INTO `nguoidung` VALUES (6, 't@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Trương', NULL, NULL, NULL, NULL, NULL, 'https://cdn.luxstay.com/users/68918/avatar_9_1552967969.jpg', '2020-08-25 22:46:36', 0, 0);
INSERT INTO `nguoidung` VALUES (7, 'td@gmail.com', '$2a$10$ivRbU5vO46eT/hQOmaBIVO3CECkjKdKVihVgYOtWXnVG9ZSx8JSka', 'Trương Diệp 2', NULL, NULL, NULL, NULL, NULL, 'https://cdn.luxstay.com/users/68918/avatar_9_1552967969.jpg', '2020-08-25 22:46:42', 0, 0);
INSERT INTO `nguoidung` VALUES (8, 'hyakkimaru08011999@gmail.com', '$2a$10$jbvuK4YnV7sprtq1yMEuQOUFTZbBbkaUiPoMpRBr9JslHQv1X01Ju', 'Duy', '2020-08-13', 'TP HCM', '0355196515', 'TP HCM', 1, 'http://localhost:3300/imgs/user/8/file-distance-icon.png', '2020-08-25 22:44:45', 0, 0);

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
INSERT INTO `phong` VALUES (28, 'Magnolia room - Phòng đôi có ban công nhìn xuống hồ bơi và vườn hoa tuyệt đẹp', 1, 'Hội An, Quảng Nam, Vietnam', 20, 478143, 549136, 1, 1, 0, 0, 2, '<p><strong>Hội An Aroma Villa - Magnolia Room&nbsp;</strong>c&oacute; diện t&iacute;ch 20m2 nằm trong một Villa tuyệt đẹp rộng 400m2. Đầy đủ c&aacute;c trang thiết bị tiện nghi hiện đạị với cửa lớn v&agrave; ban c&ocirc;ng nh&igrave;n ra hồ bơi v&agrave; vườn hoa. Ch&uacute;ng t&ocirc;i rất th&acirc;n thiện, giao tiếp tiếng Anh tốt v&agrave; sống trong Villa n&ecirc;n dễ d&agrave;ng hỗ trợ kh&aacute;ch.</p>\n\n<p>C&aacute;c bữa ăn v&agrave; đồ uống sẽ được phục vụ với gi&aacute; thấp. Chỉ cần 280.000 VNĐ (12 USD) cho dịch vụ đ&oacute;n tại s&acirc;n bay. C&aacute;c tour du lịch được cung cấp với gi&aacute; thấp.</p>\n\n<p>Hội An Aroma Villa rất đẹp, thanh tĩnh, y&ecirc;n b&igrave;nh với&nbsp;<strong>hồ bơi ngo&agrave;i trời&nbsp;</strong>v&agrave; vườn hoa hồng, giao th&ocirc;ng rất dễ d&agrave;ng. Chỉ c&aacute;ch phố đi bộ Hội An, B&atilde;i biển Hamy, B&atilde;i biển An B&agrave;ng 4km v&agrave; c&aacute;c điểm tham quan kh&aacute;c của Hội An.</p>\n', '<p>- Xuất tr&igrave;nh giấy tờ hợp lệ khi nhận ph&ograve;ng (hộ chiếu, chứng minh thư c&ograve;n hạn sử dụng)</p>\n\n<p>- Kh&ocirc;ng tiếp kh&aacute;ch lạ, kh&ocirc;ng h&uacute;t thuốc l&aacute; v&agrave; ăn uống trong ph&ograve;ng ngủ, nếu cần xin mời sử dụng ph&ograve;ng kh&aacute;ch hoặc s&acirc;n vườn</p>\n\n<p>- Kh&aacute;ch kh&ocirc;ng đăng k&yacute; kh&ocirc;ng được ở lại sau 10 pm. Kh&ocirc;ng tổ chức tiệc t&ugrave;ng nếu kh&ocirc;ng được ph&eacute;p của ch&uacute;ng t&ocirc;i</p>\n\n<p>- Kh&ocirc;ng tự &yacute; thay đổi, di chuyển vị tr&iacute; c&aacute;c đồ vật trong ph&ograve;ng, kh&ocirc;ng mang đồ đạc từ ph&ograve;ng n&agrave;y sang ph&ograve;ng kh&aacute;c</p>\n\n<p>- Kh&ocirc;ng đ&aacute;nh bạc, sử dụng chất k&iacute;ch th&iacute;ch, ma t&uacute;y, kh&ocirc;ng sử dụng thiết bị điện c&ocirc;ng suất cao trong ph&ograve;ng, kh&ocirc;ng mang vũ kh&iacute;, chất độc, chất thải nguy hiểm</p>\n\n<p>- Kh&aacute;ch tự quản l&yacute; c&aacute;c t&agrave;i sản qu&yacute; gi&aacute; của m&igrave;nh như tiền, điện thoại, m&aacute;y t&iacute;nh, trang sức v&agrave;ng bạc đ&aacute; qu&yacute;. Nếu cần thiết xin gửi cho lễ t&acirc;n giữ miễn ph&iacute;, ch&uacute;ng t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm đối với mất m&aacute;t hoặc hư hỏng của những t&agrave;i sản n&oacute;i tr&ecirc;n</p>\n\n<p>- Kh&aacute;ch cần th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i để kiểm tra ph&ograve;ng trước khi check out, kh&aacute;ch phải bồi thường cho ch&uacute;ng t&ocirc;i c&aacute;c hư hỏng, mất m&aacute;t do m&igrave;nh g&acirc;y ra v&agrave; chi ph&iacute; l&agrave;m sạch ph&ograve;ng, chăn ga giường, khăn tắm... nếu g&acirc;y ra c&aacute;c vết bẩn qu&aacute; nghi&ecirc;m trọng kh&ocirc;ng xử l&yacute; được.</p>\n', '14:00:00', '00:00:00', '2020-08-25 20:53:38', 1, 1);
INSERT INTO `phong` VALUES (29, 'WINDBELL VILLA / Garden view room 2', 1, 'Hội An, Quảng Nam, Vietnam', 50, 1200000, 1250000, 1, 1, 1300000, -1, 2, '<p>Located in Cam Nam islland, but take only 10 minutes walking to Old Town in Hoi An city. It is easy to reach any visiting places in Hoi An.</p>\n\n<p>We put an &quot;Information Book&quot; in each room and also have receptions who will support you any information about tours/visiting Hoi An.</p>\n', '<p>Check in time: 14:00</p>\n\n<p>Check out time: 12:00</p>\n\n<p>If the rooms are ready, we will offer early check in. It will be advised at Check in date.</p>\n', '12:00:00', '12:00:00', '2020-08-25 20:37:18', 1, 3);
INSERT INTO `phong` VALUES (30, 'VENITY VILLA Chill', 1, 'Nha Trang, Khánh Hòa, Vietnam', 450, 11414400, 19024000, 4, 4, 0, 0, 8, '<p>Ch&agrave;o mừng bạn đến&nbsp;<strong>VENITY VILLA Chill</strong></p>\n\n<p>Cửa sổ lớn từ trần đến s&agrave;n của c&aacute;c ph&ograve;ng ngủ tr&ecirc;n tầng 3 mang đến trải nghiệm biệt thự độc đ&aacute;o b&ecirc;n bờ biển cho kh&aacute;ch. Ph&ograve;ng ngủ ở tầng trệt c&oacute; ph&ograve;ng tắm ri&ecirc;ng b&ecirc;n v&aacute;ch đ&aacute; v&agrave; v&ograve;i sen ngo&agrave;i trời. Ph&ograve;ng ngủ thứ 4 ẩn m&igrave;nh c&oacute; lối đi ri&ecirc;ng từ s&acirc;n hi&ecirc;n.</p>\n\n<p>Đặc biệt đề cập đến ph&ograve;ng ngủ lớn lửng, mở ra kh&ocirc;ng gian ch&iacute;nh nh&igrave;n ra vịnh sẽ l&agrave; nơi l&yacute; tưởng cho những ai muốn cảm thấy ri&ecirc;ng tư nhưng kh&ocirc;ng bị c&ocirc; lập.Tầng trệt c&oacute; ph&ograve;ng giải tr&iacute; lớn với cửa sổ dưới nước, ph&ograve;ng x&ocirc;ng hơi ướt v&agrave; ph&ograve;ng x&ocirc;ng hơi kh&ocirc;.</p>\n\n<p>Tầng 1</p>\n\n<p>- C&oacute; diện t&iacute;ch 145 m2</p>\n\n<p>- Ph&ograve;ng giải tr&iacute; / truyền th&ocirc;ng /&nbsp;<strong>rạp chiếu phim rộng 44 m2 với cửa sổ lớn dưới nước xuy&ecirc;n qua hồ bơi</strong></p>\n\n<p>- Tắm hơi, x&ocirc;ng hơi, ph&ograve;ng tắm, ph&ograve;ng giặt ủi, b&atilde;i đỗ xe trong nh&agrave;</p>\n\n<p>Tầng hai</p>\n\n<p>- Diện t&iacute;ch trong nh&agrave; 142 m&eacute;t vu&ocirc;ng</p>\n\n<p>- Ph&ograve;ng ngủ giường đ&ocirc;i với giường cỡ King, ph&ograve;ng tắm v&aacute;ch đ&aacute; trong vườn ri&ecirc;ng v&agrave; v&ograve;i sen ngo&agrave;i trời</p>\n\n<p>- Kh&ocirc;ng gian mở, ghế sofa, truyền h&igrave;nh vệ tinh, hệ thống &acirc;m thanh Sonos, b&agrave;n bi-a, khu ẩm thực 6/8 người, nh&agrave; bếp đầy đủ tiện nghi</p>\n\n<p>- Mặt tiền 123sqm ngo&agrave;i trời với<strong>&nbsp;hồ bơi Sala, Boong trước, tiện nghi BBQ</strong>&nbsp;với b&agrave;n ăn ngo&agrave;i trời 8-10 người, vườn,&nbsp;<strong>hồ bơi v&ocirc; cực 10m x 4.2m nh&igrave;n ra vịnh</strong>, v&ograve;i sen ngo&agrave;i trời.</p>\n\n<p>- Ph&ograve;ng lửng c&oacute; 2 giường rộng 40 m2, ph&ograve;ng tắm với v&ograve;i sen</p>\n\n<p>Tầng ba</p>\n\n<p>- Ph&ograve;ng ngủ ch&iacute;nh rộng 50 m&eacute;t vu&ocirc;ng với giường cỡ King, ph&ograve;ng tắm c&oacute; bồn tắm v&agrave; v&ograve;i sen, s&acirc;n hi&ecirc;n c&oacute; m&aacute;i che, m&aacute;y lạnh</p>\n\n<p>- Ph&ograve;ng ngủ giường đ&ocirc;i c&oacute; giường cỡ King rộng 29 m2, ph&ograve;ng tắm với bồn tắm v&agrave; v&ograve;i sen, s&acirc;n hi&ecirc;n c&oacute; m&aacute;i che, m&aacute;y lạnh</p>\n', '<p>- Kh&ocirc;ng mang theo th&uacute; cưng</p>\n\n<p>- Kh&ocirc;ng h&uacute;t thuốc l&aacute; v&agrave; kh&ocirc;ng sử dụng c&aacute;c chất cấm</p>\n', '15:00:00', '00:00:00', '2020-08-25 20:59:50', 1, 1);
INSERT INTO `phong` VALUES (31, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 420, 11627700, 11626700, 4, 4, 0, 0, 8, '<p><strong>Hapier Villa&nbsp;</strong>l&agrave; biệt thự biệt lập c&oacute; s&acirc;n hi&ecirc;n tắm nắng nằm tại th&agrave;nh phố Nha Trang thuộc tỉnh Kh&aacute;nh H&ograve;a. Bến Ph&agrave; Vinpearl, Viện Hải dương học v&agrave; Dinh Bảo Đại đều c&aacute;ch chỗ ở của ch&uacute;ng t&ocirc;i 1 km.</p>\n\n<p>Du kh&aacute;ch c&oacute; thể cho một bữa ăn ngon v&agrave; thư gi&atilde;n trong vườn khi thời tiết đẹp. S&acirc;n bay gần nhất l&agrave; S&acirc;n bay Quốc tế Cam Ranh, c&aacute;ch Hapier Villa 22 km.</p>\n\n<p>Với&nbsp;<strong>tầm nh&igrave;n ra quang cảnh n&uacute;i non, biển v&agrave; th&agrave;nh phố từ ban c&ocirc;ng ri&ecirc;ng</strong>, biệt thự sang trọng n&agrave;y c&oacute;&nbsp;<strong>hồ bơi ri&ecirc;ng</strong>. Nh&agrave; bếp đầy đủ tiện nghi c&oacute; khu vực ăn uống với b&agrave;n ăn, bếp nấu ăn, đồ d&ugrave;ng nấu nướng v&agrave; tủ lạnh.</p>\n\n<p>TV m&agrave;n h&igrave;nh phẳng với c&aacute;c k&ecirc;nh truyền h&igrave;nh c&aacute;p v&agrave; Netflix cũng được trang bị trong biệt thự. Biệt thự c&ograve;n c&oacute; d&agrave;n &acirc;m thanh JBL, TV Apple v&agrave; d&agrave;n karaoke với hệ thống &acirc;m thanh Hi-Fi DENON. Tiện nghi tập thể dục cũng c&oacute; tại đ&acirc;y.</p>\n\n<p>Du kh&aacute;ch c&oacute; thể chơi b&oacute;ng b&agrave;n v&agrave; n&eacute;m phi ti&ecirc;u tại đ&acirc;y. Đồng thời chơi g&ocirc;n cũng như lặn với ống thở l&agrave; những hoạt động phổ biến trong khu vực n&agrave;y.</p>\n\n<p>Du kh&aacute;ch c&oacute; thể tham gia nhiều hoạt động kh&aacute;c nhau như lặn biển v&agrave; c&acirc;u c&aacute;. Chỗ ở của ch&uacute;ng t&ocirc;i cũng&nbsp;<strong>cung cấp xe tay ga miễn ph&iacute;</strong>&nbsp;cho những kh&aacute;ch muốn kh&aacute;m ph&aacute; khu vực xung quanh.</p>\n\n<p>Chỗ ở của ch&uacute;ng t&ocirc;i cũng được đ&aacute;nh gi&aacute; l&agrave; đ&aacute;ng gi&aacute; tiền nhất ở Nha Trang! Kh&aacute;ch sẽ tiết kiệm được nhiều hơn so với nghỉ tại những chỗ nghỉ kh&aacute;c ở th&agrave;nh phố n&agrave;y.</p>\n', '<p>Giờ nhận ph&ograve;ng từ 14:00-22:00</p>\n\n<p>Giờ trả ph&ograve;ng từ 07:00-12:00</p>\n\n<ul>\n	<li>Kh&aacute;ch kh&ocirc;ng khai b&aacute;o lưu tr&uacute; vui l&ograve;ng kh&ocirc;ng ở lại villa.</li>\n</ul>\n\n<p>- Kh&ocirc;ng mang theo vật nu&ocirc;i, kh&ocirc;ng h&uacute;t thuốc l&aacute; v&agrave; kh&ocirc;ng sử dụng c&aacute;c chất k&iacute;ch th&iacute;ch trong Hapier Villa</p>\n\n<p>- Book ph&ograve;ng trước 7 ng&agrave;y,vui l&ograve;ng th&ocirc;ng b&aacute;o số người lưu tr&uacute;.</p>\n\n<ul>\n	<li>Vui l&ograve;ng kh&ocirc;ng tiệc t&ugrave;ng với kh&aacute;ch từ b&ecirc;n ngo&agrave;i đến. Số kh&aacute;ch tối đa tại Villa l&agrave; 8 người lớn v&agrave; 3 trẻ em dưới 6 tuổi.</li>\n	<li>Kh&ocirc;ng g&acirc;y ồn &agrave;o sau 10 giờ đ&ecirc;m cho đến 7 giờ s&aacute;ng.</li>\n</ul>\n', '14:00:00', '00:00:00', '2020-08-25 21:06:17', 1, 1);
INSERT INTO `phong` VALUES (32, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:31', 1, 1);
INSERT INTO `phong` VALUES (33, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:54', 1, 1);
INSERT INTO `phong` VALUES (34, '999 CONDOTEL Mường Thanh Viễn Triều - Căn hộ 2 Phòng ngủ Nhìn ra 1 phía biển', 1, 'Nha Trang, Khánh Hòa, Vietnam', 65, 749000, 999000, 2, 2, 999000, -19, 4, '<p><strong>999 Condotel&nbsp;</strong>toạ lạc tại khu b&atilde;i biển Phạm Văn Đồng l&agrave; Căn hộ cao cấp c&oacute; tầm nh&igrave;n ra biển bao gồm 2 ph&ograve;ng ngủ, 2 ph&ograve;ng tắm, ban c&ocirc;ng , ph&ograve;ng kh&aacute;ch, một gian bếp đầy đủ tiện nghi để nấu nướng...Tất cả căn hộ đều trang bị Smart TV m&agrave;n h&igrave;nh phẳng, Wifi miễn ph&iacute;, bếp từ, tủ lạnh cỡ lớn, l&ograve; vi s&oacute;ng, m&aacute;y giặt, m&aacute;y sấy, b&agrave;n ủi v&agrave; đầy đủ thiết bị vệ sinh c&aacute; nh&acirc;n...</p>\n\n<p>- Chỗ nghỉ c&aacute;ch bờ biển chỉ 100m, địa danh H&ograve;n Chồng 500m, Th&aacute;p B&agrave; Ponagar 1,3km, tắm b&ugrave;n i-resort 2km, chợ đầm 2,4km...</p>\n\n<p>- Khu&ocirc;n vi&ecirc;n 999 Condotel tho&aacute;ng đ&atilde;ng m&aacute;t mẽ . Bạn c&oacute; thể tản bộ ngắm nh&igrave;n đường phố v&agrave; b&atilde;i biển danh tiếng H&ograve;n Chồng. Tha hồ trải nghiệm c&aacute;c qu&aacute;n ăn, nh&agrave; h&agrave;ng, c&agrave; ph&ecirc;, spa, si&ecirc;u thị 24h tại tầng trệt,...</p>\n\n<p>- Qu&yacute; kh&aacute;ch nghỉ dưỡng tại 999 Condotel c&oacute; thể thưởng thức Buffet s&aacute;ng l&ecirc;n tới 100 m&oacute;n với gi&aacute; chỉ từ 100.000đ, ch&uacute;ng t&ocirc;i cung cấp dịch vụ cho thu&ecirc; xe m&aacute;y, xe đưa đ&oacute;n s&acirc;n bay, tour du lịch gi&aacute; rẻ...</p>\n\n<p>- Với thiết kế kh&ocirc;ng gian sang trọng v&agrave; nội thất cao cấp mang phong c&aacute;ch Ch&acirc;u &Acirc;u, c&aacute;c căn hộ của ch&uacute;ng t&ocirc;i sẽ đem đến sự thoải m&aacute;i nhẹ nh&agrave;ng gi&uacute;p bạn c&oacute; một giấc ngủ ngon sau một ng&agrave;y d&agrave;i l&agrave;m việc, giải tr&iacute;...</p>\n\n<p>- Chỗ nghỉ ch&uacute;ng t&ocirc;i ph&ugrave; hợp cho tất cả mọi người, gia đ&igrave;nh v&agrave; nhất l&agrave; c&aacute;c cặp đ&ocirc;i.</p>\n\n<p>- Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn.</p>\n', '<p>*Nghi&ecirc;m cấm mang vũ kh&iacute;, chất nổ, dễ ch&aacute;y, ma t&uacute;y (ma t&uacute;y), h&agrave;ng cấm tr&aacute;i với quy định của ph&aacute;p luật&hellip;</p>\n\n<p>*Thời gian nhận ph&ograve;ng từ 2:00pm v&agrave; trả ph&ograve;ng l&agrave;</p>\n\n<p>12:00 trưa, nếu muộn hơn sẽ phải thanh to&aacute;n th&ecirc;m phụ ph&iacute; tương ứng. Mọi chi tiết</p>\n\n<p>xin li&ecirc;n hệ tại quầy Lễ t&acirc;n.</p>\n\n<p>*Xin vui l&ograve;ng kh&ocirc;ng thay đổi ph&ograve;ng hoặc đưa</p>\n\n<p>th&ecirc;m người v&agrave;o ph&ograve;ng khi chưa đăng k&yacute; trước với Lễ t&acirc;n.</p>\n\n<p>*Qu&yacute; kh&aacute;ch vui l&ograve;ng xuất tr&igrave;nh hộ chiếu hoặc</p>\n\n<p>chứng minh nh&acirc;n d&acirc;n để l&agrave;m thủ tục nhận ph&ograve;ng tại quầy Lễ t&acirc;n.</p>\n\n<p>*Ch&uacute;ng t&ocirc;i chỉ chịu tr&aacute;ch nhiệm với những t&agrave;i</p>\n\n<p>sản hoặc tiền được gửi tại quầy Lễ t&acirc;n.</p>\n\n<p>*Trước khi rời khỏi kh&aacute;ch sạn, xin Qu&yacute; kh&aacute;ch vui l&ograve;ng thanh to&aacute;n to&agrave;n bộ c&aacute;c ho&aacute; đơn v&agrave; gửi lại ch&igrave;a kho&aacute; ph&ograve;ng tại quầy Lễ t&acirc;n.</p>\n', '00:00:00', '00:00:00', '2020-08-25 21:08:47', 1, 1);
INSERT INTO `phong` VALUES (35, '♛Nha Trang- Near Hon Chong ♛ Blue Ocean Balcony with 2BRs/ 50m to the beach', 1, 'Nha Trang, Khánh Hòa, Vietnam', 35, 250000, 250000, 1, 2, 0, 0, 4, '<p>&quot;Mira Moon&quot; l&agrave; nơi dừng ch&acirc;n mới đưa kh&aacute;ch v&agrave;o một h&agrave;nh tr&igrave;nh kỳ lạ v&agrave;o b&atilde;i biển Nha Trang. Chỉ 2 ph&uacute;t đi bộ đến b&atilde;i biển!</p>\n\n<p>C&acirc;u chuyện về Trăng Tr&ograve;n được diễn giải lại một c&aacute;ch nghệ thuật trong phong c&aacute;ch trang tr&iacute; cổ điển, sang trọng của ng&ocirc;i nh&agrave; - một phi&ecirc;n bản đương đại của một c&acirc;u chuyện thần thoại truyền thống được kể trong đồ đạc kết hợp c&aacute;c chi tiết thời trang với c&aacute;c yếu tố cổ xưa của Việt Nam. Ch&uacute;ng t&ocirc;i kết hợp sự hiếu kh&aacute;ch truyền thống của người ch&acirc;u &Aacute; với c&aacute;c tiện &iacute;ch am hiểu c&ocirc;ng nghệ, như Wi-Fi mạnh v&agrave; nhanh, NetFlix miễn ph&iacute; cho c&aacute;c hoạt động giải tr&iacute; bất tận của bạn.</p>\n\n<p>B&ecirc;n cạnh đ&oacute;, t&ocirc;i cũng l&agrave; một người&nbsp;v&ocirc; c&ugrave;ng th&acirc;n thiện v&agrave; thoải m&aacute;i. Ch&iacute;nh v&igrave; vậy đừng ngại ngần m&agrave; chia sẻ với ch&uacute;ng t&ocirc;i những điều bạn đang thắc mắc hoặc những kh&oacute; khăn bạn gặp phải khi ở đ&acirc;y.</p>\n\n<p>Ch&uacute;ng t&ocirc;i cũng lu&ocirc;n mong muốn được c&ugrave;ng bạn kh&aacute;m ph&aacute; nhiều địa điểm tốt đẹp nhất tại đ&acirc;y.</p>\n', '<p>Kh&ocirc;ng sử dụng c&aacute;c chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở nhạc qu&aacute; 11 PM (23:00)</p>\n\n<p>Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ngủ</p>\n\n<p>Kh&ocirc;ng mở tiệc trong ph&ograve;ng</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '12:00:00', '12:00:00', '2020-08-25 21:11:51', 1, 1);
INSERT INTO `phong` VALUES (36, 'Studio(C2)★near my khe beach★night market★balcony', 1, 'Sơn Trà, Đà Nẵng, Vietnam ', 34, 123123, 1223, 3, 3, 1223, -12, 6, '<p><strong>LEM&#39;S APARTMENT &amp; COFFEE - LƯU TR&Uacute; ẤM C&Uacute;NG NHƯ TẠI NH&Agrave; BẠN.</strong></p>\n\n<p>?Kh&ocirc;ng cần phải đến những kh&aacute;ch sạn sang trọng v&agrave; cao cấp mới được trải nghiệm dịch vụ nghỉ dưỡng năm sao, đến với Lem&#39;s Coffee &amp; Apartment, bạn sẽ được h&ograve;a m&igrave;nh v&agrave;o khu vườn xanh mướt với những dịch vụ h&agrave;ng đầu, mang đến trải nghiệm kh&oacute; qu&ecirc;n cho du kh&aacute;ch lần đầu đến Đ&agrave; Nẵng.</p>\n\n<p>Tại Lem&rsquo;s Coffee &amp; Apartment, bạn sẽ được trải nghiệm một kh&ocirc;ng gian tinh tế v&agrave; đẳng cấp với:</p>\n\n<p>&bull; Nhiều loại ph&ograve;ng với kh&ocirc;ng gian đẹp trang nh&atilde; để du kh&aacute;ch thoải m&aacute;i lựa chọn.</p>\n\n<p>&bull; Đ&acirc;̀y đủ ti&ecirc;̣n nghi: tủ lạnh, máy lạnh, TV, &hellip; hay các n&ocirc;̣i th&acirc;́t bằng g&ocirc;̃: bàn gh&ecirc;́, giường, tủ&hellip; v&ocirc; cùng sang trọng và tinh t&ecirc;́.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Được thiết kế v&agrave; trang bị đầy đủ những tiện &iacute;ch như: quầy bar, s&acirc;n vườn</p>\n\n<p>, s&acirc;n thượng view&nbsp;đẹp thỏa th&iacute;ch check-in Facebook, ph&ugrave; hợp với bạn trẻ l&atilde;ng mạn y&ecirc;u kh&ocirc;ng gian xanh.</p>\n\n<p>&nbsp;</p>\n\n<p>&bull; Nằm ở khu trung t&acirc;m giữa c&aacute;c địa điểm vui chơi nổi tiếng: Cầu S&ocirc;</p>\n\n<p>ng H&agrave;n, Bảo t&agrave;ng&nbsp;Chăm, Cầu t&agrave;u t&igrave;nh y&ecirc;u&hellip;</p>\n\n<p>V&agrave; c&ograve;n nhiều điểm đặc biệt kh&aacute;c chỉ c&oacute; du kh&aacute;ch của Lem&rsquo;s mới c&oacute; thể trải ng</p>\n\n<p>hiệm. Đến đ&acirc;y&nbsp;ngay h&ocirc;m nay để tận hưởng c&ugrave;ng bạn b&egrave;, người y&ecirc;u hay gia đ&igrave;nh nh&eacute;!</p>\n\n<p>&nbsp;</p>\n\n<p>H&atilde;y để Lem&rsquo;s phục vụ giấc ngủ v&agrave; sự an y&ecirc;n của bạn</p>\n\n<p>khi đặt ch&acirc;n&nbsp;đến Đ&agrave; Nẵng du lịch m&ugrave;a thu n&agrave;y.</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-24 22:46:56', 1, 1);
INSERT INTO `phong` VALUES (37, 'Căn hộ Penthouse 1 phòng ngủ MLibrary PentStudio View Hồ Tây', 1, 'Tây Hồ, Hà Nội, Vietnam', 45, 1690000, 1890000, 1, 1, 0, 0, 2, '<p>Ch&agrave;o mừng bạn đến MLibrary!&nbsp;</p>\n\n<p>MLibrary thuộc chung cư cao cấp Pentstudio T&acirc;y Hồ, dự &aacute;n Condotel đầu ti&ecirc;n tại H&agrave; Nội, được quản l&yacute; v&agrave; vận h&agrave;nh bởi tập đo&agrave;n The Ascott&nbsp;Singapore.&nbsp;</p>\n\n<p>Lấy cảm hứng từ những thư viện cổ điển, khổng lồ Ch&acirc;u &Acirc;u, c&ugrave;ng với vị tr&iacute; đắc địa giữa trung t&acirc;m quận T&acirc;y Hồ, MLibrary sẽ gi&uacute;p bạn được trải nghiệm bầu kh&ocirc;ng kh&iacute; trong l&agrave;nh, kh&ocirc;ng gian y&ecirc;n tĩnh, sang trọng, v&agrave; thoải m&aacute;i; đặc biệt nh&acirc;t ch&iacute;nh l&agrave; những tiện nghi, dịch vụ đẳng cấp, hiện đại chuẩn ti&ecirc;u ch&iacute; 5 sao.</p>\n\n<p>MLibrary ph&ugrave; hợp cho du lịch nghỉ dưỡng, tuần trăng mật, c&ocirc;ng t&aacute;c, giải tr&iacute;.</p>\n\n<p>Với vị tr&iacute; đắc địa:&nbsp;</p>\n\n<p>C&aacute;ch Thung lũng hoa Hồ T&acirc;y 1,4 km</p>\n\n<p>C&aacute;ch Hồ T&acirc;y 4 km</p>\n\n<p>C&aacute;ch phố đi bộ Hồ Gươm 9 km</p>\n\n<p>C&aacute;ch C&ocirc;ng vi&ecirc;n nước Hồ T&acirc;y 1,6 km</p>\n\n<p>C&aacute;ch s&acirc;n bay Nội B&agrave;i 22 km</p>\n\n<p>Kh&ocirc;ng những thế bạn c&ograve;n được trải nghiệm c&aacute;c dịch vụ xa hoa, đẳng cấp:&nbsp;</p>\n\n<p>&nbsp;⁃ To&agrave;n bộ căn hộ gồm: 1 ph&ograve;ng kh&aacute;ch, 1 ph&ograve;ng ngủ, nh&agrave; bếp, nh&agrave; tắm, nh&agrave; vệ sinh</p>\n\n<p>&nbsp;⁃ Giường đ&ocirc;i ti&ecirc;u chuẩn cho 2 người</p>\n\n<p>&nbsp;⁃ Ph&ograve;ng tắm đầy đủ khăn tắm, đồ d&ugrave;ng c&aacute; nh&acirc;n</p>\n\n<p>&nbsp;⁃ Nh&agrave; bếp đầy đủ tiện nghi, nơi bạn c&oacute; thể tự tay nấu nướng những m&oacute;n ăn m&igrave;nh y&ecirc;u th&iacute;ch ngay cả khi kh&ocirc;ng ở nh&agrave;.</p>\n\n<p>&nbsp;⁃ Ngo&agrave;i ra, c&oacute; thể dễ d&agrave;ng đi bộ v&agrave;i bứớc ch&acirc;n tới c&ocirc;ng vi&ecirc;n, khu vực d&agrave;nh cho người đi bộ, si&ecirc;u thị, cửa h&agrave;ng tiện lợi, qu&aacute;n c&agrave; ph&ecirc;</p>\n\n<p>Đặt ph&ograve;ng ngay để nhận được ưu đ&atilde;i v&agrave; c&oacute; những trải nghiệm th&uacute; vị c&ugrave;ng căn hộ cao cấp MLibrary ngay h&ocirc;m nay nh&eacute;!</p>\n', '<p>Với mong muốn đem đến cho kh&aacute;ch lưu tr&uacute; &quot; tự nhi&ecirc;n như ở nh&agrave; bạn&quot; kh&ocirc;ng phải lo về vấn đề đi sớm về muộn v&igrave; ch&uacute;ng t&ocirc;i lu&ocirc;n mở cửa 24/24.</p>\n\n<p>Hổ trợ c&aacute;c dịch vụ đưa đ&oacute;n từ s&acirc;n bay về căn hộ hoặc từ căn hộ duy chuyển nội th&agrave;nh ( c&oacute; ph&iacute; ưu đ&atilde;i ), hổ trợ dịch vụ thu&ecirc; xe m&aacute;y gi&aacute; ưu đ&atilde;i hơn, hướng dẫn thưởng thức c&aacute;c m&oacute;n ăn địa phương v&agrave; tham qua c&aacute;c địa điểm du lịch.</p>\n', '12:00:00', '12:00:00', '2020-08-25 21:14:31', 1, 1);
INSERT INTO `phong` VALUES (38, 'COSY MODERN FRENCH BOUTIQUE - 3mins to Old Quarter', 1, 'Hoàn Kiếm, Hà Nội, Vietnam', 36, 500000, 500000, 1, 2, 0, 0, 2, '<p>Ch&agrave;o mừng c&aacute;c bạn đến với &quot;Home Sweet Home&quot; của ch&uacute;ng t&ocirc;i - một ng&ocirc;i nh&agrave; tiện nghi nằm trong X&oacute;m Hạ Hồi (Ho&agrave;n Kiếm) - nơi bạn sẽ c&oacute; trải nghiệm rất H&agrave; Nội.</p>\n\n<p><em>&quot;T&igrave;m về x&oacute;m H&agrave; Hồi trong c&aacute;i nắng th&aacute;ng 6 oi ả, được thấy một cảm gi&aacute;c thật y&ecirc;n tĩnh đến lạ l&ugrave;ng. Gọi l&agrave; x&oacute;m, nhưng thực ra đ&oacute; lại l&agrave; một con ng&otilde; d&agrave;i, chạy v&ograve;ng nối từ phố Trần Hưng Đạo sang phố Quang Trung, một ng&aacute;ch nữa ra đường Trần Quốc Toản, 2 ng&aacute;ch c&aacute;ch nhau chưa đến trăm bước ch&acirc;n b&ecirc;n số chẵn đường Quang Trung. C&oacute; lẽ v&igrave; nằm lọt thỏm giữa những đường phố đ&ocirc;ng đ&uacute;c của H&agrave; Nội n&ecirc;n khi ai đ&oacute; bước v&agrave;o x&oacute;m H&agrave; Hồi đều c&oacute; cảm tưởng mọi sự vội v&atilde; dường như tan biến, m&agrave; thay v&agrave;o đ&oacute; l&agrave; ch&uacute;t nhẩn nha, thong dong...&quot;</em></p>\n\n<p>Ngo&agrave;i vị tr&iacute; đắc địa nằm giữa trung t&acirc;m thủ đ&ocirc;, s&aacute;t cạnh những cửa h&agrave;ng cafe đẹp nhất H&agrave; Nội (All Day Coffee...), hiệu s&aacute;ch, tụ điểm văn h&oacute;a, những ng&ocirc;i nh&agrave; trong x&oacute;m mang đậm phong c&aacute;ch Ph&aacute;p,.. th&igrave; căn hộ&quot;Home Sweet Home&quot; của ch&uacute;ng t&ocirc;i c&oacute; kiến tr&uacute;c hiện đại pha lẫn với những n&eacute;t cổ điển, được trang bị rất tiện nghi - Chắc chắn sẽ khiến bạn cảm thấy ấm &aacute;p v&agrave; thoải m&aacute;i khi tới đ&acirc;y.</p>\n\n<p>Ch&uacute;ng t&ocirc;i muốn bạn cảm thấy như đang ở trong ch&iacute;nh ng&ocirc;i nh&agrave; của m&igrave;nh! Bạn c&oacute; thể t&igrave;m thấy hầu hết c&aacute;c tiện nghi cơ bản trong căn hộ của ch&uacute;ng t&ocirc;i:</p>\n\n<p>- Nh&agrave; bếp hiện đại được trang bị bếp điện, l&ograve; vi s&oacute;ng, nồi cơm điện,h&uacute;t m&ugrave;i...</p>\n\n<p>- Ph&ograve;ng tắm kh&ocirc; r&aacute;o v&agrave; sạch sẽ với v&aacute;ch tắm k&iacute;nh, WC th&ocirc;ng minh...</p>\n\n<p>- Kh&ocirc;ng gian ch&iacute;nh của căn hộ được tận dụng để thiết kế hệ tủ th&ocirc;ng minh vừa l&agrave; nơi nghỉ ngơi, l&agrave;m việc, vừa l&agrave; ph&ograve;ng tiếp được kh&aacute;ch trang bị Smart TV để c&aacute;c bạn c&oacute; thể thỏa sức xem c&aacute;c chương tr&igrave;nh truyền h&igrave;nh hay sử dụng Netflix, Youtube... để giải tr&iacute; với hệ tủ th&ocirc;ng minh v&agrave; kh&ocirc;ng k&eacute;m phần tinh tế.</p>\n', '<p>Kh&ocirc;ng sử dụng c&aacute;c chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở nhạc qu&aacute; 10 PM</p>\n\n<p>Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ngủ</p>\n\n<p>Kh&ocirc;ng mở tiệc trong ph&ograve;ng</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '00:03:00', '12:00:00', '2020-08-25 21:17:21', 1, 2);
INSERT INTO `phong` VALUES (41, 'Nhà sang trọng sát biển Mỹ Khê', 1, 'A22/4 Phạm Thế Hiền, Phường 3, Quận 8, Hồ Chí Minh', 40, 255000, 300000, 2, 2, 255000, -5, 3, '<p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p>  \r\n                        <p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p> \r\n                        <p >\r\n                        Chào mừng bạn đến Namto House City 2 mới của chúng tôi!\r\n                            <br/>\r\n                            Vị trí tuyệt vời trong khoảng cách đi bộ đến tất cả các điểm nóng Đà Nẵng. Khám phá nhà hàng tuyệt vời Đà Nẵng, quán cà phê, quán bar, trung tâm mua sắm và cuộc sống về đêm chỉ cách nhà vài bước chân. Bạn sẽ yêu nơi của chúng tôi vì vị trí hoàn hảo, chiếc giường thoải mái và khu phố khá.\r\n                            <br/>\r\n                            - Chúng tôi miễn phí đưa đón bạn tại sân bay\r\n                            <br/>\r\n                            - Sông Hàn: 4 phút đi bộ\r\n                            <br/>\r\n                            - Bãi biển Mỹ Khê: 5 phút lái xe\r\n                            <br/>\r\n                            - Sân bay: 10 phút lái xe\r\n                            <br/>\r\n                            - Cầu rồng: 15 phút đi bộ\r\n                            <br/>\r\n                            - Dễ dàng đi đến đồi Bà Nà, Hội An\r\n                            <br/>\r\n                            Tọa lạc tại trung tâm thành phố Đà Nẵng. Chỗ ở của chúng tôi là một không gian mới được cải tạo và trang bị với tất cả mọi thứ bạn cần. Bạn sẽ thích chỗ ở của chúng tôi sạch sẽ, quyến rũ, an toàn và riêng tư này.\r\n                        </p>  ', '<p class=\"mb--0\"><p>- Tự check in &amp; nhận phòng với nhân viên</p><p>- Check in time : 13:00 ( Có thể nhận phòng sớm tùy tình trạng phòng,quý khách liên hệ trước khi đến )</p><p>- Check our time : 11:30 (Có thể muộn hơn tùy tình trạng phòng.)</p><p>- Không hút thuốc</p><p>- Không sử dụng các chất kích thích, văn hoá phẩm đồi truỵ</p><p>- Không mang theo vật nuôi</p><p>- Hạn chế làm ồn sau 22h đêm</p><p><br></p></p>', '14:00:00', '12:00:00', '2020-08-24 22:46:58', 1, 1);
INSERT INTO `phong` VALUES (49, '✦ Luxury Villa 5BRs ✦Thao Dien Dist 2✦Bathtub✦Big yard✦Sai Gon River View _[Sweethost]', 4, 'Quận 2, Hồ Chí Minh, Vietnam', 500, 7890000, 10919000, 2, 4, NULL, NULL, 7, '<p><strong>✦Luxury Villa 5BR✦Bathtub✦Big yard✦Sai Gon River View [Sweethost]&nbsp;</strong>l&agrave; một biệt thự y&ecirc;n tĩnh nằm trong khu biệt thự Thảo Điền, quận 02, với 06 ph&ograve;ng ngủ hiện đại, 02 ghế sofa v&agrave; 02 đệm phụ, đủ cho những nh&oacute;m bạn hay gia đ&igrave;nh từ 16 kh&aacute;ch, v&agrave; lu&ocirc;n tr&agrave;n ngập &aacute;nh s&aacute;ng từ rất nhiều những khung cửa sổ v&agrave; ban cộng rộng.</p>\n\n<p><strong><em>Lưu &yacute;: Khi bạn đặt ph&ograve;ng tại listing n&agrave;y bạn, sẽ được sử dụng ph&ograve;ng ngủ Tầng 2 của villa được thiết kế rất đặc biệt với 02 ph&ograve;ng ngủ, 02 nh&agrave; vệ sinh v&agrave; Tầng 3 của villa c&oacute; 03 ph&ograve;ng ngủ lớn với 02 nh&agrave; vệ sinh, c&oacute; ban c&ocirc;ng lớn nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n. C&ugrave;ng c&aacute;c tiện &iacute;ch của ph&ograve;ng kh&aacute;ch (c&oacute; 1 WC), ph&ograve;ng bếp v&agrave; s&acirc;n vườn.</em></strong></p>\n\n<p><strong>Tiện &iacute;ch của villa:</strong></p>\n\n<p>- Tầng 1 bao gồm 01ph&ograve;ng kh&aacute;ch c&oacute; view trực diện ra s&acirc;n vườn rộng với rất nhiều c&acirc;y xanh v&agrave; hồ sen thơ mộng, 01 ph&ograve;ng bếp đầy đủ tiện nghi (bếp từ, tủ lạnh, nồi cơm điện, l&ograve; vi s&oacute;ng v&agrave; b&aacute;t đũa&hellip;) để du kh&aacute;ch c&oacute; thể tổ chức một bữa tiệc lớn b&ecirc;n gia đ&igrave;nh, bạn b&egrave;. Đồng thời, du kh&aacute;ch c&oacute; thể sử dụng thang m&aacute;y hoặc thang m&aacute;y tại tầng 1 để di chuyển l&ecirc;n c&aacute;c tầng ph&iacute;a tr&ecirc;n.</p>\n\n<p>- Tầng 2 của villa được thiết kế rất đặc biệt với 02 ph&ograve;ng ngủ, 02 nh&agrave; vệ sinh được thiết kế chủ yếu bằng k&iacute;nh thu h&uacute;t rất nhiều &aacute;nh s&aacute;ng v&agrave; view trực diện ra s&ocirc;ng S&agrave;i G&ograve;n. Ngo&agrave;i ra, tầng 2 c&ograve;n c&oacute; 01 khu vực chung với sofa v&agrave; TV lớn để mọi người c&oacute; thể qu&acirc;y quần h&aacute;t karaoke, xem Netflix hoặc tr&ograve; chuyện với nhau.</p>\n\n<p>- Tầng 3 của villa cũng c&oacute; 03 ph&ograve;ng ngủ lớn với 02 nh&agrave; vệ sinh, c&oacute; ban c&ocirc;ng lớn nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n. Mỗi buổi s&aacute;ng sớm hay chiều t&agrave;, nh&acirc;m nhi một t&aacute;ch tr&agrave; hay caf&eacute;, đọc một cuốn s&aacute;ch sẽ thật l&agrave; th&uacute; vị.</p>\n\n<p>- Tầng 4 của villa c&oacute; 01 ph&ograve;ng ngủ lớn được bao bọc xung quanh bởi k&iacute;nh n&ecirc;n mỗi buổi s&aacute;ng thức dậy đều tạo cảm gi&aacute;c khoan kho&aacute;i ch&agrave;o đ&oacute;n một ng&agrave;y mới cho du kh&aacute;ch. (closed)</p>\n\n<p>- Đặc biệt&nbsp;<strong>✦Luxury Villa 5BR✦Bathtub✦Big yard✦Sai Gon River View [Sweethost]&nbsp;</strong>c&ograve;n c&oacute; một&nbsp;<strong>kh&ocirc;ng gian s&acirc;n ngo&agrave;i trời, rất th&iacute;ch hợp để c&aacute;c nh&oacute;m bạn, gia đ&igrave;nh tổ chức tiệc nướng&nbsp;</strong>hay tr&ograve; chuyện thư gi&atilde;n.</p>\n\n<p>-Thời gian chủ nh&agrave; hỗ trợ check in muộn nhất l&agrave;: 20:00</p>\n', '<p>Kh&aacute;ch h&agrave;ng cần gửi lại ảnh CMND hoặc passport trước khi check in. Đồng thời kh&aacute;ch h&agrave;ng phải đặt cọc 100% gi&aacute; trị đặt ph&ograve;ng cho chủ nh&agrave;, sau khi check out, kiểm tra t&agrave;i sản đảm bảo chủ nh&agrave; sẽ chuyển khoản lại số tiền n&agrave;y cho kh&aacute;ch h&agrave;ng</p>\n', '03:00:00', '23:30:00', '2020-08-24 22:46:59', 1, 1);
INSERT INTO `phong` VALUES (50, '✦Premium 3BR✦Landmark 81 Sai Gon River - City View [Sweethost]', 4, 'Bình Thạnh, Hồ Chí Minh, Vietnam', 117, 3310000, 4219000, 2, 3, 4500000, -5, 8, '<p><strong>Sweethost Premium 3BR&nbsp;</strong>tọa lạc tr&ecirc;n tầng&nbsp;44 của&nbsp;<strong>t&ograve;a nh&agrave; cao nhất Việt Nam Landmark 81</strong>, với tổng diện t&iacute;ch 117m2 c&oacute; sức chứa l&ecirc;n đến 8 kh&aacute;ch. Căn hộ được trang tr&iacute; nội thất hiện đại, trang nh&atilde; c&ugrave;ng với view nh&igrave;n trực diện ra s&ocirc;ng S&agrave;i G&ograve;n v&agrave; to&agrave;n th&agrave;nh phố. Ngo&agrave;i ra, c&aacute;c dịch vụ đi k&egrave;m cũng sẽ l&agrave; một điểm cộng lớn kh&ocirc;ng thể bỏ qua khi trải nghiệm c&ugrave;ng&nbsp;<strong>Sweethost</strong>.﻿</p>\n\n<ul>\n	<li><strong>View trực diện</strong>&nbsp;nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n v&agrave; th&agrave;nh phố từ tr&ecirc;n cao</li>\n	<li><strong>Miễn ph&iacute;</strong>&nbsp;wifi tốc độ cao v&agrave; nước uống, đồ ăn nhẹ</li>\n	<li><strong>Miễn ph&iacute;</strong>&nbsp;vệ sinh 1 tuần/lần cho booking từ 1 tuần trở l&ecirc;n</li>\n	<li><strong>Miễn ph&iacute; sử dụng ph&ograve;ng gym﻿</strong>&nbsp;ở tầng 5 của t&ograve;a nh&agrave;</li>\n	<li>Hệ thống loa kết nối bằng bluetooth khắp nh&agrave;</li>\n	<li>Hệ thống m&aacute;y lạnh &acirc;m tường to&agrave;n căn hộ</li>\n	<li>Ph&ograve;ng kh&aacute;ch rộng r&atilde;i gồm bộ sofa lớn để mọi người qu&acirc;y quần, Smart TV m&agrave;n h&igrave;nh phẳng c&oacute; Netflix UltraHD</li>\n	<li>Ban c&ocirc;ng rộng tho&aacute;ng, c&oacute; b&agrave;n ghế ngồi để thư gi&atilde;n</li>\n	<li>3 ph&ograve;ng ngủ master c&oacute; giường size 1m6, nệm cao cấp, m&agrave;n che 2 lớp, tủ quần &aacute;o ri&ecirc;ng</li>\n	<li>Đặc biệt view từ cả 3 ph&ograve;ng ngủ đều c&oacute; view s&ocirc;ng S&agrave;i G&ograve;n v&agrave; th&agrave;nh phố</li>\n	<li>Khu vực bếp sạch sẽ v&agrave; được trang bị đầy đủ thiết bị gia dụng bằng th&eacute;p kh&ocirc;ng gỉ</li>\n	<li>2 nh&agrave; vệ sinh hiện đại, sạch sẽ, được trang bị đầy đủ c&aacute;c đồ d&ugrave;ng cần thiết</li>\n	<li>C&oacute; khu vực ri&ecirc;ng gần bếp d&agrave;nh ri&ecirc;ng cho việc giặt v&agrave; phơi đồ</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>Sweethost</strong>&nbsp;c&oacute; cung cấp dịch vụ đưa đ&oacute;n từ s&acirc;n bay về thẳng Landmark 81 bằng xe đời mới 4 hoặc 7 chỗ, thời gian di chuyển mất khoảng 20-30 ph&uacute;t. Với lợi thế tọa lạc trong t&ograve;a nh&agrave; phức hợp bao gồm c&aacute;c dịch vụ ăn uống, mua sắm ngay tại chỗ ở,&nbsp;<strong>Sweethost</strong>&nbsp;tự tin mang đến cho kh&aacute;ch h&agrave;ng những trải nghiệm đẹp v&agrave; bổ &iacute;ch trong thời gian ở đ&acirc;y.</p>\n\n<p>&nbsp;</p>\n\n<p>Kh&aacute;ch h&agrave;ng được to&agrave;n quyền sử dụng căn hộ v&agrave; c&aacute;c dịch vụ trong căn hộ trong thời gian ở tại đ&acirc;y.&nbsp;<strong>Sweethost</strong>&nbsp;sẽ cung cấp m&atilde; số v&agrave; thẻ cư d&acirc;n để kh&aacute;ch h&agrave;ng được tự do ra v&agrave;o căn hộ. Nếu cần check in sớm hoặc check out trễ, vui l&ograve;ng li&ecirc;n hệ&nbsp;<strong>Sweethost</strong>&nbsp;trước để được hỗ trợ.</p>\n', '<ul>\n	<li>Trong qu&aacute; tr&igrave;nh lưu tr&uacute;, nếu bạn c&oacute; nhu cầu thay ga gối, vệ sinh, vui l&ograve;ng th&ocirc;ng b&aacute;o trước cho ch&uacute;ng t&ocirc;i &iacute;t nhất 01 ng&agrave;y. Xin lưu &yacute; đ&acirc;y l&agrave; dịch vụ c&oacute; t&iacute;nh ph&iacute;</li>\n	<li>Sweethost sẵn s&agrave;ng hỗ trợ check-in sớm nếu ph&ograve;ng trống v&agrave;o đ&ecirc;m trước đ&oacute; hoặc kh&aacute;ch trước check out sớm. Vui l&ograve;ng th&ocirc;ng b&aacute;o về kế hoạch check-in sớm (nếu c&oacute;) để Sweethost chuẩn bị được tốt nhất.</li>\n	<li>Đối với việc check-out trễ, ch&uacute;ng t&ocirc;i sẽ charge ph&iacute; 100.000VND/giờ từ 12h-18h. Sau 18h, Sweethost sẽ t&iacute;nh ph&iacute; full 1 đ&ecirc;m.</li>\n	<li>Vui l&ograve;ng tắt c&aacute;c thiết bị điện trước khi ra ngo&agrave;i.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>VUI L&Ograve;NG KH&Ocirc;NG THỰC HIỆN NHỮNG ĐIỀU SAU:</p>\n\n<ul>\n	<li>Kh&ocirc;ng h&uacute;t thuốc trong nh&agrave; (c&oacute; thể h&uacute;t ngo&agrave;i ban c&ocirc;ng)</li>\n	<li>Kh&ocirc;ng tổ chức tiệc t&ugrave;ng</li>\n	<li>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</li>\n	<li>Kh&ocirc;ng mang th&uacute; nu&ocirc;i v&agrave;o ph&ograve;ng</li>\n</ul>\n', '12:00:00', '12:00:00', '2020-08-24 22:47:05', 2, 1);
INSERT INTO `phong` VALUES (56, 'LAKESIDE WASHER&DRYER FREE POCKET WIFI✧2BR', 1, 'Ba Đình, Hà Nội, Vietnam ', 100, 1314894, 1500000, 2, 2, 0, 0, 4, '<p>Khuyến mại m&ugrave;a covid-19. Giảm 15%/tuần &amp; 30%/th&aacute;ng (&Aacute;p dụng từ 15/07/2020 - 31/12/2020)</p>\n\n<p>Căn hộ ngay mặt hồ Tr&uacute;c Bạch, nằm tr&ecirc;n đường Trấn Vũ si&ecirc;u y&ecirc;n tĩnh v&agrave; tho&aacute;ng m&aacute;t với 2 mặt tiền. Vị tr&iacute; số 1 tại H&agrave; Nội khi đủ gần để v&agrave;o trung t&acirc;m phố cổ với 5p đi bộ, đủ xa để y&ecirc;n tĩnh, tr&aacute;nh ồn &agrave;o kh&oacute;i bụi khi nằm cạnh hồ Tr&uacute;c Bạch.</p>\n\n<p>H&agrave;ng loạt dịch vụ xung quanh b&aacute;n k&iacute;nh 300m đ&aacute;p ứng mọi nhu cầu: CircleK, stand bar, coffee, nh&agrave; h&agrave;ng...</p>\n', '<p>Qu&yacute; kh&aacute;ch vui l&ograve;ng h&uacute;t thuốc ở ban c&ocirc;ng. Xin cảm ơn!</p>\n', '12:00:00', '12:00:00', '2020-08-25 21:22:04', 1, 1);
INSERT INTO `phong` VALUES (57, 'Rustic Studio 3/ Mặt đường p.Lý Nam Đế/ View đẹp/p.khép kín/ netflix/có bếp', 1, 'Hoàn Kiếm, Hà Nội, Vietnam', 35, 650000, 650000, 1, 1, 0, 0, 2, '<p>Rustic Studio lu&ocirc;n mong muốn mang lại cho bạn trải nghiệm sống c&acirc;n bằng, h&agrave;i ho&agrave; với thi&ecirc;n nhi&ecirc;n, kết nối bản th&acirc;n với những người xung quanh, trau dồi cảm x&uacute;c cho t&acirc;m hồn. Giữa l&ograve;ng H&agrave; Nội thật kh&oacute; để c&oacute; thể t&igrave;m thấy nơi n&agrave;o y&ecirc;n b&igrave;nh hơn Rustic Studio 79C L&yacute; Nam Đế , hơn nữa ch&uacute;ng t&ocirc;i c&ograve;n trang bị đầy đủ tiện &iacute;ch kh&eacute;p k&iacute;n ho&agrave;n to&agrave;n , nhằm tăng sự trải nhiệm v&agrave; bảo đảm quyền ri&ecirc;ng tư cho kh&aacute;ch h&agrave;ng!</p>\n\n<p>Những điểm nổi bật tại cơ sở L&yacute; Nam Đế</p>\n\n<p>+ C&oacute; thể thấy điểm nổi bật đầu ti&ecirc;n đ&oacute; l&agrave; Kh&ocirc;ng Gian Xanh nơi bạn chắc chắn sẽ được nạp rất nhiều năng lượng khi đến với Rustic Studio 79C L&yacute; Nam Đế.</p>\n\n<p>+ Tất cả c&aacute;c ph&ograve;ng tại Rustic studio đều kh&eacute;p k&iacute;n gồm bếp v&agrave; nh&agrave; vệ sinh b&ecirc;n trong + Tất cả nội thất đều tự thiết kế v&agrave; đ&oacute;ng theo rustic style đảm bảo c&aacute;c bạn sẽ kh&ocirc;ng thể thẩy ở đ&acirc;u ngo&agrave;i Rustic Studio 79C L&yacute; Nam Đế</p>\n\n<p>+ Cửa k&iacute;nh si&ecirc;u rộng , c&aacute;c ph&ograve;ng đều c&oacute; cửa sổ to ngay s&aacute;t bếp n&ecirc;n th&ocirc;ng tho&aacute;ng v&agrave; ko &aacute;m m&ugrave;i + C&aacute;c ph&ograve;ng đều c&oacute; b&agrave;n tr&agrave; &amp; sofa</p>\n\n<p>+ Smart TV / xem youtube &amp; netflix</p>\n\n<p>+ Bếp đủ đồ d&ugrave;ng cần thiết - Bếp từ, b&aacute;t đũa nồi chảo gia vị&hellip;</p>\n\n<p>+ Trung t&acirc;m H&agrave; nội. Rất nhiều shop 24h, street food vỉa h&egrave; hay nh&agrave; h&agrave;ng đều từ 3-10 ph&uacute;t</p>\n\n<p>Chợ H&agrave;ng Da - 5 ph&uacute;t</p>\n\n<p>đi bộ Phố cổ - 5 ph&uacute;t đi bộ</p>\n\n<p>Phố ăn đ&ecirc;m Tống Duy T&acirc;n 8 ph&uacute;t đi bộ</p>\n', '<p>Tất cả c&aacute;c ph&ograve;ng tại Rustic studio đều kh&eacute;p k&iacute;n gồm bếp v&agrave; nh&agrave; vệ sinh b&ecirc;n trong + Tất cả nội thất đều tự thiết kế v&agrave; đ&oacute;ng theo rustic style đảm bảo c&aacute;c bạn sẽ kh&ocirc;ng thể thẩy ở đ&acirc;u ngo&agrave;i Rustic Studio 79C L&yacute; Nam Đế</p>\n', '14:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (58, 'Mia\'s Home - căn hộ có ban công, view phố cổ, 10p đi bộ tới Hồ Gươm', 1, 'Hoàn Kiếm, Hà Nội, Vietnam ', 25, 400000, 400000, 1, 1, 450000, -1, 2, '<p>Mia&#39;s Home l&agrave; căn hộ tiện nghi tr&ecirc;n tầng 5 t&ograve;a nh&agrave; ch&iacute;nh giữa phố cổ H&agrave; Nội, nơi tập trung tinh hoa ẩm thực của th&agrave;nh phố. Căn hộ c&oacute; cửa sổ lớn th&ocirc;ng tho&aacute;ng, ban c&ocirc;ng nh&igrave;n xuống khung cảnh đẹp nhất khu phố cổ. Từ căn hộ, bạn c&oacute; thể đi bộ đến hầu hết c&aacute;c địa điểm tham quan nổi tiếng của th&agrave;nh phố:</p>\n\n<ul>\n	<li>\n	<p>Hồ Gươm c&aacute;ch 10 ph&uacute;t đi bộ</p>\n	</li>\n	<li>\n	<p>Phố c&agrave; ph&ecirc; t&agrave;u hỏa Ph&ugrave;ng Hưng, c&aacute;ch 4 ph&uacute;t đi bộ</p>\n	</li>\n	<li>\n	<p>Khu di t&iacute;ch nh&agrave; t&ugrave; Hỏa L&ograve;, c&aacute;ch 10 ph&uacute;t đi bộ</p>\n	</li>\n	<li>\n	<p>C&aacute;ch Nh&agrave; Thờ Lớn 7 ph&uacute;t đi bộ</p>\n	</li>\n	<li>\n	<p>C&aacute;ch Chợ Đồng Xu&acirc;n 10 ph&uacute;t đi bộ</p>\n	</li>\n	<li>\n	<p>Khu di t&iacute;ch ho&agrave;ng th&agrave;nh Thăng Long, 10 ph&uacute;t taxi</p>\n	</li>\n</ul>\n\n<p>Căn hộ của ch&uacute;ng t&ocirc;i c&oacute; đầy đủ tiện nghi bao gồm:</p>\n\n<ul>\n	<li>\n	<p>1 giường đ&ocirc;i lớn</p>\n	</li>\n	<li>\n	<p>Điều h&ograve;a nhiệt độ</p>\n	</li>\n	<li>\n	<p>TV m&agrave;n h&igrave;nh phẳng</p>\n	</li>\n	<li>\n	<p>B&agrave;n ghế l&agrave;m việc</p>\n	</li>\n	<li>\n	<p>Wifi tốc độ nhanh</p>\n	</li>\n	<li>\n	<p>Bếp với đầy đủ dụng cụ</p>\n	</li>\n	<li>\n	<p>Nh&agrave; tắm c&oacute; nước n&oacute;ng, m&aacute;y giặt</p>\n	</li>\n</ul>\n', '<p>no thing</p>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (59, 'Flower\'s House in a Luxury @Vinhomes Greenbay HaNoi @Studio', 1, 'Nam Từ Liêm, Hà Nội, Vietnam', 28, 486900, 500000, 1, 1, 0, 0, 2, '<p>Địa điểm căn hộ tọa lạc tại số 7 đường Thăng Long, phường Mỹ Trị, quận Nam Từ Li&ecirc;m, H&agrave; Nội, Việt Nam. Mất khoảng 50 ph&uacute;t từ s&acirc;n bay quốc tế Nội B&agrave;i để đến đ&oacute; khoảng c&aacute;ch 31 km, từ s&acirc;n bay Nội B&agrave;i bạn c&oacute; thể đi taxi, Grab v&agrave; chi ph&iacute; khoảng 15 đ&ocirc; la Mỹ, Minivan của Vietnam Airlines, Vietjet air hoặc Jestar chỉ với 2$.</p>\n\n<p>Vinhomes Green Bay c&oacute; 3 t&ograve;a nh&agrave; v&agrave; n&oacute; cũng c&oacute; biệt thự. N&oacute; được x&acirc;y dựng bởi Vingroup- Tập đo&agrave;n bất động sản lớn nhất Việt Nam. Căn hộ của ch&uacute;ng t&ocirc;i tọa lạc tại t&ograve;a th&aacute;p G3.</p>\n\n<p>- T&ograve;a nh&agrave; n&agrave;y c&oacute; diện t&iacute;ch hồ 10,6 ha v&agrave; cũng c&oacute; hơn 100 cơ sở như bể bơi ngo&agrave;i trời, bể bơi trong nh&agrave;, ph&ograve;ng tập thể dục, nhiều khu vực s&acirc;n chơi, g&oacute;c BBQ, an ninh 24/7, khu vực đỗ xe, Vinmart +, K mart, cửa h&agrave;ng dược phẩm .....</p>\n\n<p>- T&ograve;a nh&agrave; n&agrave;y được bảo vệ bởi 4 cấp độ an ninh. Đ&oacute; l&agrave; nơi rất an to&agrave;n với đội ngũ nh&acirc;n vi&ecirc;n th&acirc;n thiện</p>\n\n<p>- Căn hộ rất gần với 2 si&ecirc;u thị lớn nhất l&agrave; Vincom Trần Duy Hưng (6 ph&uacute;t) v&agrave; Big C Thang Long tại H&agrave; Nội (5 ph&uacute;t)</p>\n\n<p>- Căn hộ c&oacute; view hồ v&agrave; rất đẹp v&agrave;o buổi tối Ở Vinhomes Green Bay Me Tri bạn c&oacute; thể dễ d&agrave;ng v&agrave;o GYM, Hồ bơi, Quần vợt hoặc bạn c&oacute; thể chạy quanh hồ b&ecirc;n trong. B&ecirc;n cạnh hồ, bạn c&oacute; thể chuẩn bị BBQ cho bạn b&egrave; v&agrave;o buổi ho&agrave;ng h&ocirc;n v&agrave; con bạn c&oacute; thể chơi xung quanh với nhiều điều th&uacute; vị.</p>\n\n<p>Căn hộ n&agrave;y được trang bị nh&agrave; bếp đầy đủ (tủ lạnh, l&ograve; vi s&oacute;ng, chảo, v&agrave; dụng cụ nh&agrave; bếp đầy đủ), một chiếc giường, ph&ograve;ng tắm (t&ocirc;i cung cấp sữa tắm, khăn tắm v&agrave; thậm ch&iacute; m&aacute;y sấy t&oacute;c) v&agrave; nh&agrave; vệ sinh (bằng giấy). TV v&agrave; wifi miễn ph&iacute; cũng c&oacute; sẵn. Trong nh&agrave; bếp, bạn sẽ t&igrave;m thấy một t&aacute;ch tr&agrave;, c&agrave; ph&ecirc; v&agrave; đường ch&agrave;o mừng miễn ph&iacute; để bạn c&oacute; thể thư gi&atilde;n khi đến nơi. Bản đồ v&agrave; tờ rơi th&ocirc;ng tin du lịch cũng sẽ gi&uacute;p bạn l&ecirc;n kế hoạch lưu tr&uacute;.</p>\n\n<p>Xin đừng ngần ngại hỏi t&ocirc;i bất kỳ c&acirc;u hỏi hoặc th&ocirc;ng tin bạn cần để chuẩn bị cho kỳ nghỉ của bạn ở đ&acirc;y v&agrave; l&agrave;m cho n&oacute; thoải m&aacute;i nhất c&oacute; thể! T&ocirc;i sẽ l&agrave;m hết sức m&igrave;nh để gi&uacute;p đỡ bạn. T&ocirc;i c&oacute; thể chắc chắn rằng bạn sẽ cảm thấy rất y&ecirc;n b&igrave;nh, an to&agrave;n v&agrave; tận hưởng từng khoảnh khắc trong suốt thời gian lưu tr&uacute;. T&ocirc;i hy vọng sớm được gặp bạn!</p>\n', '<p>Kh&ocirc;ng l&agrave;m ồn &agrave;o v&agrave; tổ chức tiệc t&ugrave;ng sau 10 giờ đ&ecirc;m</p>\n\n<p>Kh&ocirc;ng h&uacute;t thuốc trong căn hộ</p>\n\n<p>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở tiệc trong căn hộ</p>\n\n<p>Kh&ocirc;ng mang theo vật nu&ocirc;i</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '13:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (60, '✦ Luxury Villa 6BR ✦Thao Dien Dist 2✦Bathtub✦Big yard✦Sai Gon River View _[Sweethost]', 1, 'Quận 2, Hồ Chí Minh, Vietnam', 500, 7020000, 8400000, 6, 6, 0, 0, 12, '<p><strong>✦Luxury Villa 6BR✦Bathtub✦Big yard✦Sai Gon River View [Sweethost]&nbsp;</strong>l&agrave; một biệt thự y&ecirc;n tĩnh nằm trong khu biệt thự Thảo Điền, quận 02, với 06 ph&ograve;ng ngủ hiện đại, 02 ghế sofa v&agrave; 02 đệm phụ, đủ cho những nh&oacute;m bạn hay gia đ&igrave;nh từ 16 kh&aacute;ch, v&agrave; lu&ocirc;n tr&agrave;n ngập &aacute;nh s&aacute;ng từ rất nhiều những khung cửa sổ v&agrave; ban cộng rộng.</p>\n\n<p><strong>Tiện &iacute;ch của villa:</strong></p>\n\n<p>- Tầng 1 bao gồm 01ph&ograve;ng kh&aacute;ch c&oacute; view trực diện ra s&acirc;n vườn rộng với rất nhiều c&acirc;y xanh v&agrave; hồ sen thơ mộng, 01 ph&ograve;ng bếp đầy đủ tiện nghi (bếp từ, tủ lạnh, nồi cơm điện, l&ograve; vi s&oacute;ng v&agrave; b&aacute;t đũa&hellip;) để du kh&aacute;ch c&oacute; thể tổ chức một bữa tiệc lớn b&ecirc;n gia đ&igrave;nh, bạn b&egrave;. Đồng thời, du kh&aacute;ch c&oacute; thể sử dụng thang m&aacute;y hoặc thang m&aacute;y tại tầng 1 để di chuyển l&ecirc;n c&aacute;c tầng ph&iacute;a tr&ecirc;n.</p>\n\n<p>- Tầng 2 của villa được thiết kế rất đặc biệt với 02 ph&ograve;ng ngủ, 02 nh&agrave; vệ sinh được thiết kế chủ yếu bằng k&iacute;nh thu h&uacute;t rất nhiều &aacute;nh s&aacute;ng v&agrave; view trực diện ra s&ocirc;ng S&agrave;i G&ograve;n. Ngo&agrave;i ra, tầng 2 c&ograve;n c&oacute; 01 khu vực chung với sofa v&agrave; TV lớn để mọi người c&oacute; thể qu&acirc;y quần h&aacute;t karaoke, xem Netflix hoặc tr&ograve; chuyện với nhau.</p>\n\n<p>- Tầng 3 của villa cũng c&oacute; 03 ph&ograve;ng ngủ lớn với 02 nh&agrave; vệ sinh, c&oacute; ban c&ocirc;ng lớn nh&igrave;n ra s&ocirc;ng S&agrave;i G&ograve;n. Mỗi buổi s&aacute;ng sớm hay chiều t&agrave;, nh&acirc;m nhi một t&aacute;ch tr&agrave; hay caf&eacute;, đọc một cuốn s&aacute;ch sẽ thật l&agrave; th&uacute; vị.</p>\n\n<p>- Tầng 4 của villa c&oacute; 01 ph&ograve;ng ngủ lớn được bao bọc xung quanh bởi k&iacute;nh n&ecirc;n mỗi buổi s&aacute;ng thức dậy đều tạo cảm gi&aacute;c khoan kho&aacute;i ch&agrave;o đ&oacute;n một ng&agrave;y mới cho du kh&aacute;ch.</p>\n\n<p>- Đặc biệt&nbsp;<strong>✦Luxury Villa 6BR✦Bathtub✦Big yard✦Sai Gon River View [Sweethost]&nbsp;</strong>c&ograve;n c&oacute; một&nbsp;<strong>kh&ocirc;ng gian s&acirc;n ngo&agrave;i trời, rất th&iacute;ch hợp để c&aacute;c nh&oacute;m bạn, gia đ&igrave;nh tổ chức tiệc nướng&nbsp;</strong>hay tr&ograve; chuyện thư gi&atilde;n.</p>\n\n<p>-Thời gian chủ nh&agrave; hỗ trợ check in muộn nhất l&agrave;: 20:00</p>\n', '<p>Kh&aacute;ch h&agrave;ng cần gửi lại ảnh CMND hoặc passport trước khi check in. Đồng thời kh&aacute;ch h&agrave;ng phải đặt cọc 50% gi&aacute; trị đặt ph&ograve;ng cho chủ nh&agrave;, sau khi check out, kiểm tra t&agrave;i sản đảm bảo chủ nh&agrave; sẽ chuyển khoản lại số tiền n&agrave;y cho kh&aacute;ch h&agrave;ng.</p>\n\n<p><strong><em>Trong trường hợp kh&aacute;ch h&agrave;ng tổ chức tiệc/ sự kiện: gi&aacute; trị khoản cọc l&agrave; 100% gi&aacute; trị đặt ph&ograve;ng.</em></strong></p>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (61, '✦Chura Homestay✦ Căn hộ kiểu Pháp 1PN với sân thượng riêng ở quận 1_ [Sweethost]', 1, 'Quận 1, Hồ Chí Minh, Vietnam', 35, 790000, 830000, 1, 1, 0, 0, 3, '<p><strong>Ch&agrave;o mừng bạn đến với Căn hộ của Sweethost !</strong></p>\n\n<p><em>Tại sao bạn n&ecirc;n đặt chỗ ở Chura Homestay ?</em></p>\n\n<p>+ Vị tr&iacute; thuận lợi, ngay trung t&acirc;m th&agrave;nh phố, c&aacute;ch chợ Bến Th&agrave;nh chỉ 5 ph&uacute;t đi bộ</p>\n\n<p>+ Xung quanh l&agrave; rất nhiều nh&agrave; h&agrave;ng, qu&aacute;n c&agrave; ph&ecirc;, cửa h&agrave;ng, địa điểm du lịch nổi tiếng</p>\n\n<p>+ C&oacute; thang tải h&agrave;nh l&yacute; tiện lợi</p>\n\n<p>+ WiFi miễn ph&iacute;</p>\n\n<p>+ Studio c&oacute; toilet v&agrave; bếp ri&ecirc;ng</p>\n\n<p>+ C&oacute; s&acirc;n thượng ri&ecirc;ng, tho&aacute;ng m&aacute;t, s&aacute;ng sủa</p>\n\n<p>+ Căn hộ đầy đủ tiện nghi</p>\n\n<p>+ Chủ nh&agrave; hỗ trợ nhiệt t&igrave;nh</p>\n\n<p>&nbsp;</p>\n\n<p><strong>M&ocirc; tả t&ograve;a nh&agrave;:</strong></p>\n\n<p>Địa chỉ: L&ecirc; Thị Hồng Gấm, phường Nguyễn Th&aacute;i B&igrave;nh, quận 1</p>\n\n<p>Chura Homestay tọa lạc trong một căn nh&agrave; kiến tr&uacute;c Ph&aacute;p, gồm 1 trệt 3 lầu v&agrave; s&acirc;n thượng. Khu d&acirc;n cư cực kỳ an ninh v&agrave; th&acirc;n thiện.</p>\n\n<p>&nbsp;</p>\n\n<p>Homestay chỉ c&oacute; 4 studio n&ecirc;n rất y&ecirc;n tĩnh. C&aacute;c khu vực sử dụng chung: thang bộ, thang m&aacute;y, s&acirc;n thượng, m&aacute;y giặt tr&ecirc;n s&acirc;n thượng. Tất cả c&aacute;c studio đều c&oacute; cửa sổ hoặc ban c&ocirc;ng n&ecirc;n lu&ocirc;n tr&agrave;n ngập &aacute;nh s&aacute;ng tự nhi&ecirc;n.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>M&ocirc; tả căn hộ:</strong></p>\n\n<p>+ Diện t&iacute;ch: 35m2 gồm ph&ograve;ng ngủ (giường Queen 1m6 x 2m, nệm l&ograve; xo), bếp, ph&ograve;ng tắm, cửa sổ, ban c&ocirc;ng.</p>\n\n<p>+ Căn hộ đầy đủ nội thất v&agrave; trang thiết bị bạn cần, d&ugrave; bạn ở 1 đ&ecirc;m hay 1 th&aacute;ng: đồ d&ugrave;ng nh&agrave; bếp, l&ograve; vi s&oacute;ng, bếp (gas/ điện), m&aacute;y nước n&oacute;ng, m&aacute;y điều h&ograve;a, m&aacute;y giặt, WiFi miễn ph&iacute;, nước uống miễn ph&iacute;, v..v&hellip; Lưu &yacute;: căn hộ n&agrave;y kh&ocirc;ng c&oacute; tivi.</p>\n\n<p>+ B&agrave;n chải v&agrave; kem đ&aacute;nh răng sẽ được cung cấp nếu kh&aacute;ch c&oacute; nhu cầu</p>\n', '<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KH&Ocirc;NG được h&uacute;t thuốc trong căn hộ. Bạn c&oacute; thể h&uacute;t ở s&acirc;n thượng hoặc khu vực c&ocirc;ng cộng b&ecirc;n ngo&agrave;i t&ograve;a nh&agrave;. Phạt tiền 50 USD nếu vi phạm.</p>\n\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Được ph&eacute;p tổ chức tiệc, sự kiện miễn l&agrave; bạn KH&Ocirc;NG g&acirc;y ồn &agrave;o ảnh hưởng h&agrave;ng x&oacute;m, KH&Ocirc;NG sử dụng ma t&uacute;y, chất cấm, v..v&hellip;; được sử dụng thức uống c&oacute; cồn nhưng kh&ocirc;ng được qu&aacute; kh&iacute;ch v&agrave; vui l&ograve;ng chịu tr&aacute;ch nhiệm về h&agrave;nh vi của bạn. Nếu vi bạn, ch&uacute;ng t&ocirc;i sẽ cắt điện/ nước để cảnh c&aacute;o; nếu t&aacute;i phạm, ch&uacute;ng t&ocirc;i được quyền mời bạn ra khỏi nh&agrave; m&agrave; kh&ocirc;ng bồi thường bất kỳ khoản tiền n&agrave;o cho bạn.</p>\n\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vui l&ograve;ng sử dụng tiết kiệm điện (tắt đ&egrave;n, quạt, m&aacute;y điều h&ograve;a khi bạn đi ra ngo&agrave;i), nước, bao đựng r&aacute;c để bảo vệ m&ocirc;i trường.</p>\n\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vui l&ograve;ng kh&ocirc;ng n&eacute;m băng vệ sinh hoặc c&aacute;c r&aacute;c thải kh&oacute; ph&acirc;n hủy kh&aacute;c xuống bồn cầu. Phạt tiền 50 USD nếu vi phạm.</p>\n\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vui l&ograve;ng kh&ocirc;ng tự &yacute; sửa điện/ nước trong căn hộ. Nếu c&oacute; sự cố, vui l&ograve;ng b&aacute;o ngay cho ch&uacute;ng t&ocirc;i.</p>\n\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vui l&ograve;ng giữ kỹ ch&igrave;a kh&oacute;a m&agrave; b&ecirc;n m&igrave;nh cung cấp cho bạn (để ra v&agrave;o t&ograve;a nh&agrave; v&agrave; đi thang m&aacute;y). Nếu l&agrave;m mất thẻ, vui l&ograve;ng b&aacute;o ngay cho ch&uacute;ng t&ocirc;i, v&agrave; bạn sẽ phải đ&oacute;ng phạt 50 USD tiền l&agrave;m lại thẻ.</p>\n\n<p>Cảm ơn sự hợp t&aacute;c của bạn!</p>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (62, 'Pura Vida 2★Vintage Studio★ Perfect Getaway | Saigon Central', 1, 'Quận 1, Hồ Chí Minh, Vietnam', 35, 669401, 669401, 1, 1, 0, 0, 2, '<p>Nh&oacute;m&nbsp;<strong>Pura Vida Home&nbsp;</strong>lu&ocirc;n c&oacute; thể hỗ trợ kh&aacute;ch qua điện thoại/ trực tiếp nếu cần. Giới thiệu c&aacute;c địa điểm du lịch, ăn uống, vui chơi. Bạn c&oacute; thể gọi điện thoại cho ch&uacute;ng m&igrave;nh bất kỳ khi n&agrave;o.</p>\n\n<p>Đ&acirc;y l&agrave; studio nằm trong một khu chung cư cũ, c&oacute; bảo vệ 24/7, nếu bạn về trễ c&oacute; thể b&aacute;o m&igrave;nh để m&igrave;nh nhắn ch&uacute; bảo vệ hỗ trợ cho m&igrave;nh v&agrave;o chung cư. L&agrave; trung t&acirc;m gần với nhiều địa chỉ ăn uống vui chơi, gần chợ Bến Th&agrave;nh, B&ugrave;i Viện...</p>\n\n<p>B&ecirc;n cạnh đ&oacute;, t&ocirc;i cũng l&agrave; một người bản địa&nbsp;v&ocirc; c&ugrave;ng th&acirc;n thiện v&agrave; thoải m&aacute;i. Ch&iacute;nh v&igrave; vậy đừng ngại ngần m&agrave; chia sẻ với ch&uacute;ng t&ocirc;i những điều bạn đang thắc mắc hoặc những kh&oacute; khăn bạn gặp phải khi ở đ&acirc;y.</p>\n\n<p>Ch&uacute;ng t&ocirc;i cũng lu&ocirc;n mong muốn được c&ugrave;ng bạn kh&aacute;m ph&aacute; nhiều địa điểm tốt đẹp nhất tại đ&acirc;y.</p>\n\n<p>Vậy c&ograve;n chần chừ g&igrave; nữa ngay b&acirc;y giờ h&atilde;y l&ecirc;n kế hoạch để tận hưởng những khoảnh khắc tuyệt vời c&ugrave;ng nhau.</p>\n', '<p>Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ngủ</p>\n\n<p>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở tiệc trong ph&ograve;ng</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '12:00:00', '12:00:00', NULL, 1, 4);
INSERT INTO `phong` VALUES (63, '*SWEETHOUSE* in Vinhome Central Park ✨Luxury Apartment-2bedroom, full furniture ✨', 1, 'Bình Thạnh, Hồ Chí Minh, Vietnam', 84, 805000, 900000, 2, 2, 0, 0, 4, '<p>- Sweethouse tự tin sẽ l&agrave; nơi nghỉ dưỡng thoải m&aacute;i v&agrave; sang trọng nhất khi bạn chọn lựa. Với thiết kế 2 ph&ograve;ng ngủ( 1master_1King),2 toilet, 1 ph&ograve;ng kh&aacute;ch, 1 bếp sẽ cho bạn cảm gi&aacute;c thật sự thư gi&atilde;n v&agrave; tiện nghi.</p>\n\n<p>- Ghế sofa, tủ đựng quần &aacute;o ri&ecirc;ng biệt, tivi m&agrave;n h&igrave;nh led, m&aacute;y lạnh, m&aacute;y n&oacute;ng lạnh, m&aacute;y giặt, tủ lạnh ,m&aacute;y sấy, tủ gi&agrave;y, bếp &acirc;m điện từ sang trọng.</p>\n\n<p>- Full nội thất cao cấp vừa ho&agrave;n thiện.</p>\n\n<p>- Ban c&ocirc;ng view tho&aacute;ng m&aacute;t nh&igrave;n hướng s&ocirc;ng S&agrave;i G&ograve;n,bến du thuyền 5 sao.</p>\n\n<p>- Đầy đủ tiện nghi v&agrave; dịch vu xung quanh :nh&agrave; h&agrave;ng, spa, trường học, bệnh viện, s&acirc;n thể thao, hồ bơi, ph&ograve;ng gym, si&ecirc;u thị, s&acirc;n chơi d&agrave;nh cho trẻ em, c&ocirc;ng vi&ecirc;n đẹp nhất S&agrave;i G&ograve;n , s&aacute;t Trung T&acirc;m Thương Mại LANDMARK 81.</p>\n\n<p>- Bảo Vệ An Ninh 24/7, cư d&acirc;n lịch sự.</p>\n', '<ol>\n	<li>\n	<p>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch/chất cấm</p>\n	</li>\n	<li>\n	<p>Kh&ocirc;ng mang th&uacute; cưng v&agrave;o căn hộ</p>\n	</li>\n	<li>\n	<p>Vui l&ograve;ng kh&ocirc;ng ở qu&aacute; số người đăng k&yacute;,nếu ph&aacute;t sinh ph&iacute; 200.000vnđ/1 kh&aacute;ch</p>\n	</li>\n	<li>\n	<p>Khi check out vui l&ograve;ng tắt hết đ&egrave;n v&agrave; điện, sau đ&oacute; để lại thẻ trong hộp thư.</p>\n	</li>\n	<li>\n	<p>Hộ chiếu or ID c&oacute; thể được y&ecirc;u cầu khi nhận ph&ograve;ng</p>\n	</li>\n	<li>\n	<p>Phạt 200.000vnđ/1 thẻ truy cập khi mất</p>\n	</li>\n</ol>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (64, 'Sky Center - Tan Son Nhat Airport Homestay', 1, 'Tân Bình, Hồ Chí Minh, Vietnam', 36, 650000, 700000, 1, 1, 800000, -10, 2, '<p>- Nằm ngay trục đường từ s&acirc;n bay T&acirc;n Sơn Nhất di chuyển v&agrave; khu nội th&agrave;nh th&agrave;nh phố, c&aacute;ch s&acirc;n bay chưa đầy 1km</p>\n\n<p>- Đ&acirc;y l&agrave; vị tr&iacute; thuận lợi cho những kh&aacute;ch h&agrave;ng sử dụng phương tiện di chuyển h&agrave;ng kh&ocirc;ng</p>\n\n<p>- T&ograve;a nh&agrave; Sky Center c&oacute;&nbsp;<strong>hồ bơi sử dụng miễn ph&iacute; quanh năm</strong>, c&oacute; c&ocirc;ng vi&ecirc;n c&acirc;y xanh, c&oacute; si&ecirc;u thị Vinsmart ở tầng trệt c&ugrave;ng với h&agrave;ng trăm nh&agrave; h&agrave;ng, shophouse, qu&aacute;n c&agrave; ph&ecirc;, hiệu thuốc t&acirc;y...Đảm bảo cho mọi nhu cầu mua sắm v&agrave; ẩm thực của bạn</p>\n\n<p>- Ngo&agrave;i ra tại Sky Center, lực lượng an ninh hoạt động 24/7, lễ t&acirc;n v&agrave; dịch vụ vệ sinh hoạt động cả ng&agrave;y, đ&aacute;p ứng được những nhu cầu ph&aacute;t sinh từ kh&aacute;ch h&agrave;ng.</p>\n\n<p>- Trong chỗ ở của ch&uacute;ng t&ocirc;i c&oacute; trang bị tủ lạnh, m&aacute;y giặt, tivi m&agrave;n h&igrave;nh phẳng, m&aacute;y điều h&ograve;a nhiệt độ, m&aacute;y nước n&oacute;ng, tủ quần &aacute;o c&oacute; kh&oacute;a, bếp nấu c&ugrave;ng phụ kiện nh&agrave; bếp, c&oacute; nồi cơm, ấm đun nước, m&aacute;y sấy t&oacute;c.....</p>\n\n<p>- Ngo&agrave;i ra ch&uacute;ng t&ocirc;i c&ograve;n cung cấp m&igrave; g&oacute;i, c&agrave; ph&ecirc;,<strong>&nbsp;nước lọc miễn ph&iacute;</strong>&nbsp;cho kh&aacute;ch h&agrave;ng</p>\n\n<p>- Đối với những kh&aacute;ch lưu tr&uacute; d&agrave;i ng&agrave;y, ch&uacute;ng t&ocirc;i cung cấp dịch vụ&nbsp;<strong>vệ sinh ph&ograve;ng miễn ph&iacute; 2 lần/tuần</strong>&nbsp;v&agrave; những dịch vụ kh&aacute;ch theo thỏa thuận của kh&aacute;ch h&agrave;ng</p>\n', '<p>Những lưu &yacute; khi đặt ph&ograve;ng:</p>\n\n<p>- Check in: từ 2pm đến 22pm</p>\n\n<p>- Check out: trước 12am</p>\n\n<p>- Vui l&ograve;ng kh&ocirc;ng g&acirc;y ồn &agrave;o sau 10PM</p>\n\n<p>- Mỗi tầng đều c&oacute; ph&ograve;ng chứa r&aacute;c ở ngay cạnh thang m&aacute;y. Qu&yacute; kh&aacute;ch vui l&ograve;ng bỏ r&aacute;c đ&uacute;ng nơi quy định.</p>\n\n<p>- Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ( t&ograve;a nh&agrave; c&oacute; khu vực h&uacute;t thuốc ri&ecirc;ng)</p>\n\n<p>- Kh&ocirc;ng nu&ocirc;i động vật trong ph&ograve;ng</p>\n\n<p>- Kh&ocirc;ng sử dụng ma t&uacute;y, cờ bạc trong ph&ograve;ng</p>\n\n<p>- Đường d&acirc;y hotline của ch&uacute;ng t&ocirc;i hoạt động 24/24 để hỗ trợ bạn, vui l&ograve;ng gọi cho ch&uacute;ng t&ocirc;i khi bạn hỗ trợ</p>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (65, 'Andy\'s House - Lotus Room/Rooftop View/Big Balcony', 1, 'Quận 1, Hồ Chí Minh, Vietnam', 60, 650000, 650000, 1, 1, 0, 0, 2, '<p><strong>Andy&#39;s House&nbsp;</strong>-&nbsp;<strong>VIP Room</strong>&nbsp;với diện t&iacute;ch 60m2. Gồm 1 ph&ograve;ng ngủ v&agrave; 1 ph&ograve;ng tắm. Được ch&uacute;ng t&ocirc;i trang bị đầy đủ c&aacute;c thiết bị tiện nghi, hiện đại: wifi, tivi, m&aacute;y sấy t&oacute;c, chổ giữ xe&hellip;Ph&ugrave; hợp cho những chuyến đi c&ocirc;ng t&aacute;c v&agrave; gia đ&igrave;nh nhỏ 3 người.</p>\n\n<p>Bạn c&oacute; thể mở cửa sổ k&iacute;nh lớn để &aacute;nh s&aacute;ng v&agrave; gi&oacute; từ thi&ecirc;n nhi&ecirc;n v&agrave;o trong ph&ograve;ng. Hay mở cửa để ra ngo&agrave;i ban c&ocirc;ng rộng r&atilde;i, sạch sẽ c&oacute; sẵn ghế hồ bơi bằng gỗ tắm nắng nh&eacute;. Ch&uacute;ng t&ocirc;i c&ograve;n trồng rất nhiều c&acirc;y xanh trong ph&ograve;ng nữa đấy nh&eacute;. C&oacute; khu sinh hoạt v&agrave; bồn tắm ngo&agrave;i trời tạo cảm gi&aacute;c thoải m&aacute;i, thư gi&atilde;n khi đến với th&agrave;nh phố Hồ Ch&iacute; Minh nhộn nhịp.</p>\n\n<p>Andy&#39;s House sử dụng m&agrave;u trắng v&agrave; m&agrave;u xanh l&aacute; c&acirc;y l&agrave;m gam m&agrave;u chủ đạo, tạo cảm gi&aacute;c rộng r&atilde;i, m&aacute;t mẻ. Được thiết kế theo phong c&aacute;ch hiện đại. Nội thất chủ yếu đều từ gỗ c&ocirc;ng nghiệp.</p>\n\n<p>Chỗ ở của ch&uacute;ng t&ocirc;i c&oacute; vị tr&iacute;&nbsp;<strong>ở trung t&acirc;m th&agrave;nh phố v&agrave; gần c&aacute;c điểm nổi tiếng&nbsp;</strong>của th&agrave;nh phố Hồ Ch&iacute; Minh:</p>\n\n<p>- C&aacute;ch phố t&acirc;y B&ugrave;i Viện khoảng 0.5km</p>\n\n<p>- C&aacute;ch chợ Bến Th&agrave;nh khoảng 1.7 km</p>\n', '<p>- Kh&ocirc;ng mang theo vật nu&ocirc;i</p>\n\n<p>- Kh&ocirc;ng h&uacute;t thuốc l&aacute; v&agrave; sử dụng c&aacute;c chất cấm</p>\n\n<p>- Kh&ocirc;ng tự &yacute; mời kh&aacute;ch đến chỗ ở của ch&uacute;ng t&ocirc;i</p>\n\n<p>Ch&uacute;ng t&ocirc;i đ&oacute;ng cửa từ 3 giờ đến 6 giờ s&aacute;ng</p>\n\n<p>Kh&ocirc;ng tiệc t&ugrave;ng, kh&ocirc;ng gầy ồn &agrave;o sau 22h30.</p>\n', '15:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (66, 'Watching Airplane From Luxury Apt w/ Free Gym&Pool', 1, 'Phú Nhuận, Hồ Chí Minh, Vietnam', 80, 1600000, 1700000, 2, 2, 0, 0, 6, '<p>Ch&agrave;o mừng bạn đến chỗ ở của ch&uacute;ng t&ocirc;i. Để l&agrave;m cho kỳ nghỉ của bạn ở S&agrave;i G&ograve;n (th&agrave;nh phố Hồ Ch&iacute; Minh, Việt Nam) dễ chịu nhất c&oacute; thể, ch&uacute;ng t&ocirc;i cung cấp c&aacute;c dịch vụ sau:</p>\n\n<p>-<strong>&nbsp;Đ&oacute;n s&acirc;n bay MIỄN PH&Iacute;&nbsp;</strong>(đặt chỗ từ 3 đ&ecirc;m, từ S&acirc;n bay T&acirc;n Sơn Nhất đến chỗ ở của ch&uacute;ng t&ocirc;i ở t&ograve;a nh&agrave; biệt thự The Golden, từ 5:00 s&aacute;ng - 9:00 tối)</p>\n\n<p>- C&agrave; ph&ecirc;, tr&agrave; địa phương MIỄN PH&Iacute;</p>\n\n<p>- S&aacute;ch hướng dẫn MIỄN PH&Iacute;</p>\n\n<p>- Bể bơi &amp; ph&ograve;ng tập MIỄN PH&Iacute;</p>\n\n<p>- Hỗ trợ MIỄN PH&Iacute; l&agrave;m hướng dẫn vi&ecirc;n kh&aacute;m ph&aacute; th&agrave;nh phố</p>\n\n<p>-&nbsp;<strong>Dịch vụ dọn dẹp MIỄN PH&Iacute; 1 lần mỗi tuần</strong></p>\n\n<p><strong>V&agrave;ng Manson&nbsp;</strong>l&agrave; khu vực cư tr&uacute; LUXURY MỚI ở Hồ Ch&iacute; Minh, nơi bạn c&oacute; thể thấy sự pha trộn giữa phong c&aacute;ch sống truyền thống v&agrave; hiện đại. Được biết đến l&agrave; khu vực gia đ&igrave;nh th&acirc;n thiện của th&agrave;nh phố.</p>\n\n<p>Đ&acirc;y l&agrave; nơi ho&agrave;n hảo. Bảo mật cao mọi l&uacute;c. Thẻ thường tr&uacute; để truy cập v&agrave;o t&ograve;a nh&agrave; v&agrave; thang m&aacute;y. Kh&oacute;a th&ocirc;ng minh với mật khẩu để truy cập v&agrave;o chỗ ở của ch&uacute;ng t&ocirc;i.</p>\n\n<p>Chỗ ở của ch&uacute;ng t&ocirc;i nằm tại t&ograve;a nh&agrave; GM2, với đầy đủ nội thất, ho&agrave;n to&agrave;n ri&ecirc;ng tư, y&ecirc;n tĩnh v&agrave; an to&agrave;n. C&oacute; thể chứa tới 6 người, l&yacute; tưởng cho kh&aacute;ch doanh nh&acirc;n, gia đ&igrave;nh (c&oacute; trẻ em v&agrave; người gi&agrave;) hoặc một nh&oacute;m bạn. Từ chỗ ở của ch&uacute;ng t&ocirc;i bạn chỉ mất 5 ph&uacute;t đến s&acirc;n bay v&agrave; 25 ph&uacute;t đến Quận 1.</p>\n\n<p>Tại sao phải Ở Đ&Acirc;Y?</p>\n\n<p>- PH&Ograve;NG NGỦ: 2 ph&ograve;ng ngủ c&oacute; giường cỡ Queen, khăn trải giường mới v&agrave; khăn tắm được cung cấp. K&eacute;t sắt v&agrave; b&agrave;n trang điểm vanity. Tủ quần &aacute;o v&agrave; m&oacute;c treo quần &aacute;o. Đặc biệt, 2 ph&ograve;ng ngủ c&oacute; một tầm nh&igrave;n tuyệt vời.<strong>&nbsp;Bạn c&oacute; thể xem m&aacute;y bay từ đ&acirc;y</strong>.</p>\n\n<p>- PH&Ograve;NG KH&Aacute;CH: TV LCD v&agrave; giường sofa với tầm nh&igrave;n rộng</p>\n\n<p>- PH&Ograve;NG TẮM: v&ograve;i hoa sen, nước n&oacute;ng, khăn tắm, giấy vệ sinh, x&agrave; ph&ograve;ng, x&agrave; ph&ograve;ng rửa tay, dầu gội v&agrave; bộ v&ograve;i sen đều được cung cấp</p>\n\n<p>- BẾP: tủ lạnh lớn, l&ograve; vi s&oacute;ng, bếp, ấm đun nước c&ugrave;ng với dụng cụ nấu ăn, bộ bữa tối đầy đủ v&agrave; ly</p>\n\n<p>- PH&Ograve;NG LAUNDRY: m&aacute;y giặt, m&aacute;y giặt v&agrave; gi&aacute; treo quần &aacute;o ngo&agrave;i trời</p>\n\n<p>- HỒ BƠI (c&oacute; sẵn từ b&acirc;y giờ) &amp; GYM (c&oacute; sẵn từ th&aacute;ng 6)</p>\n\n<p>- Ban c&ocirc;ng nh&igrave;n ra s&acirc;n bay. Xem m&aacute;y bay</p>\n\n<p>- Internet kh&ocirc;ng d&acirc;y tốc độ cao</p>\n\n<p>- C&aacute;p truyền h&igrave;nh Internet với hơn 100 k&ecirc;nh quốc tế v&agrave; địa phương</p>\n\n<p>- Điều h&ograve;a kh&ocirc;ng kh&iacute; cho to&agrave;n bộ ng&ocirc;i nh&agrave;</p>\n\n<p>- Dịch vụ Grab / Taxi tại cửa</p>\n\n<p>- Dịch vụ dọn dẹp v&agrave; giặt ủi nếu được y&ecirc;u cầu (trả tiền)</p>\n\n<p>- Truy cập t&ograve;a nh&agrave; v&agrave; 24/7</p>\n\n<p>- Ch&igrave;a kh&oacute;a th&ocirc;ng minh</p>\n\n<p>- Gia đ&igrave;nh / Trẻ em th&acirc;n thiện mọi thứ được thiết kế để gi&uacute;p bạn thư gi&atilde;n ngay từ khi bạn bước v&agrave;o</p>\n\n<p>H&atilde;y đến v&agrave; tận hưởng kỳ nghỉ của bạn, gi&uacute;p bạn cảm thấy chỗ ở của ch&uacute;ng t&ocirc;i như ng&ocirc;i nh&agrave; của bạn! Bạn được ch&agrave;o đ&oacute;n v&agrave; sử dụng c&aacute;c tiện &iacute;ch của t&ograve;a nh&agrave; bao gồm:</p>\n\n<p>-<strong>&nbsp;Hồ bơi &amp; ph&ograve;ng tập thể dục tr&ecirc;n tầng 2 (miễn ph&iacute;)</strong>. Giờ mở cửa: 6:00 AM-12: 00PM, 2:00 PM-22: 00PM</p>\n\n<p>- Ph&ograve;ng chờ ở tầng trệt (miễn ph&iacute;)</p>\n\n<p>- Khu vực đỗ xe tr&ecirc;n tầng hầm (trả tiền)</p>\n\n<p>- To&agrave;n quyền truy cập 24/7</p>\n\n<p>Ch&uacute;ng t&ocirc;i rất th&acirc;n thiện. Ch&uacute;ng t&ocirc;i rất vui khi được hỗ trợ bạn. Đừng ngần ngại cho ch&uacute;ng t&ocirc;i biết. Ch&uacute;ng t&ocirc;i sẽ cố gắng hết sức để hỗ trợ bạn v&agrave; gia đ&igrave;nh bạn.</p>\n\n<p>Tất cả những g&igrave; bạn cần như qu&aacute;n c&agrave; ph&ecirc;, cửa h&agrave;ng tiện lợi, spa, ng&acirc;n h&agrave;ng,...Đều ở tầng G, cạnh cửa tiếp t&acirc;n. Taxi c&oacute; sẵn 24/7. Dễ d&agrave;ng bắt trong 1 ph&uacute;t trước t&ograve;a nh&agrave;.</p>\n\n<p>- KIỂM TRA TỰ ĐỘNG: vui l&ograve;ng lấy thẻ thang m&aacute;y tại hộp thư v&agrave; sử dụng mật m&atilde; được cung cấp tr&ecirc;n Airbnb để v&agrave;o cửa</p>\n\n<p>- KIỂM TRA: vui l&ograve;ng để thẻ thang m&aacute;y tr&ecirc;n b&agrave;n, tắt tất cả điện v&agrave; đ&oacute;ng cửa</p>\n\n<p>- Nếu bạn c&oacute; bất kỳ nhu cầu n&agrave;o kh&aacute;c, xin vui l&ograve;ng li&ecirc;n hệ (nhắn tin / gọi điện) cho t&ocirc;i. Ch&uacute;ng t&ocirc;i rất vui được hỗ trợ bạn 24/7.</p>\n', '<p>- Kh&ocirc;ng mang theo th&uacute; cưng</p>\n\n<p>- Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng, c&oacute; thể h&uacute;t ngo&agrave;i ban c&ocirc;ng</p>\n', '14:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (67, 'Premier Room Next to Hoang Van Thu Park - HO 1331', 1, 'Phú Nhuận, Hồ Chí Minh, Vietnam', 25, 450000, 450000, 1, 1, 0, 0, 2, '<p><strong>RedDoorz Plus</strong>&nbsp;gần Ho&agrave;ng Văn Thụ Park 2 được tạo th&agrave;nh từ c&aacute;c ph&ograve;ng ấm &aacute;p, s&aacute;ng sủa v&agrave; đầy đủ tiện nghi. Chỗ ở chỉ c&aacute;ch s&acirc;n bay quốc tế T&acirc;n Sơn Nhất 5 ph&uacute;t l&aacute;i xe, l&agrave;m cho n&oacute; trở th&agrave;nh một lựa chọn lưu tr&uacute; si&ecirc;u thuận tiện cho du kh&aacute;ch. Chưa kể căn hộ của ch&uacute;ng t&ocirc;i nằm ở một trong những khu phố nhộn nhịp nhất của th&agrave;nh phố Hồ Ch&iacute; Minh - v&igrave; vậy đồ ăn thức uống v&agrave; giải tr&iacute; kh&ocirc;ng bao giờ l&agrave; vấn đề ở đ&acirc;y. Đơn giản v&agrave; hấp dẫn, c&aacute;c ph&ograve;ng của ch&uacute;ng t&ocirc;i c&oacute; giường thoải m&aacute;i đi k&egrave;m với khăn trải giường sạch sẽ v&agrave; tươi mới, cũng như gối mềm. Ngo&agrave;i ra, tất cả c&aacute;c ph&ograve;ng đều được trang bị đầy đủ tiện nghi, bao gồm Wi-Fi nhanh v&agrave; đ&aacute;ng tin cậy, truyền h&igrave;nh c&aacute;p, đồ vệ sinh ho&agrave;n chỉnh v&agrave; nước đ&oacute;ng chai, để gi&uacute;p kh&aacute;ch tận dụng tối đa thời gian lưu tr&uacute;. Quầy lễ t&acirc;n 24 giờ c&oacute; đội ngũ nh&acirc;n vi&ecirc;n lịch sự, được đ&agrave;o tạo b&agrave;i bản. nh&acirc;n vi&ecirc;n h&agrave;i l&ograve;ng v&agrave; mong muốn hỗ trợ với bất kỳ v&agrave; tất cả c&aacute;c y&ecirc;u cầu.</p>\n\n<p>B&atilde;i đậu xe c&oacute; sẵn cho kh&aacute;ch miễn ph&iacute; RedDoorz gần Ho&agrave;ng Văn Thu 2 nằm ngay tại trung t&acirc;m quận T&acirc;n B&igrave;nh - nơi cũng c&oacute; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất. Cho d&ugrave; b&acirc;y giờ bạn c&oacute; ấn tượng g&igrave; đi chăng nữa, khu vực n&agrave;y kh&ocirc;ng phải l&agrave; một khu vực bị c&ocirc; lập, vắng vẻ hoặc điếc tai. Kh&aacute;m ph&aacute; xung quanh quận T&acirc;n B&igrave;nh v&agrave; bạn sẽ t&igrave;m thấy rất nhiều trung t&acirc;m mua sắm, chợ, nh&agrave; h&agrave;ng sang trọng, qu&aacute;n ăn địa phương, v&agrave; kh&ocirc;ng đề cập đến số lượng lớn c&aacute;c cửa h&agrave;ng c&agrave; ph&ecirc; - từ cơ bản, trường học cũ, đến thiết kế đ&ocirc; thị v&agrave; phong c&aacute;ch! Mong đợi kh&ocirc;ng &iacute;t từ khu phố kh&aacute;ch sạn của ch&uacute;ng t&ocirc;i. C&oacute; v&ocirc; số lựa chọn thực phẩm v&agrave; đồ uống trong khu vực. Đi về hướng đường L&ecirc; Văn Sỹ, v&agrave; bạn sẽ thấy rất nhiều đồ ăn thức uống phục vụ tất cả c&aacute;c loại thực phẩm từ T&acirc;y đến Đ&ocirc;ng đến Việt Nam. Bo Le Ro, M&oacute;n Huế, Qu&aacute;n Ngon l&agrave; một số nh&agrave; h&agrave;ng Việt Nam đ&aacute;ng ch&uacute; &yacute;.</p>\n\n<p>May mắn l&agrave; c&ocirc;ng vi&ecirc;n Ho&agrave;ng Văn Thu chỉ c&aacute;ch đ&oacute; v&agrave;i ph&uacute;t, v&igrave; vậy bạn c&oacute; thể đi bộ ra ngo&agrave;i ăn tối. V&agrave; như một phần thưởng bổ sung, đường L&ecirc; Văn Sỹ cũng l&agrave; một trung t&acirc;m mua sắm y&ecirc;u th&iacute;ch của địa phương. C&oacute; rất nhiều cửa h&agrave;ng với một loạt c&aacute;c phong c&aacute;ch v&agrave; gi&aacute; cả cho bạn lựa chọn! Nếu bạn đang t&igrave;m c&aacute;ch kh&aacute;m ph&aacute; c&aacute;c khu vực trung t&acirc;m của th&agrave;nh phố Hồ Ch&iacute; Minh, điều tốt l&agrave; n&oacute; rất dễ d&agrave;ng để đi từ kh&aacute;ch sạn của ch&uacute;ng t&ocirc;i đến trung t&acirc;m th&agrave;nh phố. Bạn c&oacute; thể sử dụng xe bu&yacute;t c&ocirc;ng cộng, c&oacute; điểm dừng nằm ngay tr&ecirc;n đường Nguyễn Văn Trỗi. Tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i đặc biệt khuy&ecirc;n kh&aacute;ch của m&igrave;nh n&ecirc;n đi taxi (từ c&aacute;c dịch vụ taxi địa phương hoặc c&aacute;c ứng dụng đi xe) để đi du lịch xung quanh.</p>\n', '<p>Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ngủ</p>\n\n<p>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở tiệc trong ph&ograve;ng</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (68, 'The Avis Apartment - Villa Papa', 1, 'Vũng Tàu, Bà Rịa Vũng Tàu, Vietnam', 500, 5000000, 5000000, 9, 10, 0, 0, 16, '<p>Biệt thự tọa lạc trong khu Long Cung, thuộc khu du lịch v&agrave; b&atilde;i tắm Ch&iacute; Linh, c&oacute; view nh&igrave;n tho&aacute;ng đ&atilde;ng ra biển từ ph&ograve;ng ngủ, ph&ograve;ng kh&aacute;ch v&agrave; hồ bơi. Sức chứa từ 16 đến 20 kh&aacute;ch trong khu&ocirc;n vi&ecirc;n 500m2 của biệt thự gồm 8 ph&ograve;ng ngủ, trong đ&oacute; c&oacute; 2 ph&ograve;ng trang bị 2 giường, tất c&aacute; ph&ograve;ng ngủ đều được trang bị giường King size ti&ecirc;u chuẩn 1m8x2m c&oacute; ph&ograve;ng tắm vệ sinh ri&ecirc;ng trong ph&ograve;ng v&agrave; điều h&ograve;a nhiệt độ.</p>\n\n<ul>\n	<li>Chỉ cần 5 ph&uacute;t đi bộ để đến được b&atilde;i tắm Ch&iacute; Linh</li>\n	<li>Hồ bơi ri&ecirc;ng biệt v&agrave; thay nước thường xuy&ecirc;n cho mỗi kh&aacute;ch thu&ecirc;</li>\n	<li>C&oacute; b&atilde;i giữ xe &ocirc; t&ocirc; ri&ecirc;ng bảo đảm an to&agrave;n v&agrave; thuận ti&ecirc;n cho kh&aacute;ch thu&ecirc;</li>\n</ul>\n\n<p>Biệt thự trang bị đầy đủ tiện nghi: m&aacute;y điều h&ograve;a, tv giải tr&iacute;, wifi tốc độ cao, hồ bơi, tủ lạnh, sofa, m&aacute;y giặt, bếp rộng đủ dụng cụ v&agrave; trang thiết bị. Từ biệt thự qu&yacute; kh&aacute;ch c&oacute; thể di chuyển xe m&aacute;y/&ocirc; t&ocirc; đến khu du lịch Ch&iacute; Linh, tượng ch&uacute;a Giang Tay, quảng trường cột cờ, chợ Hải Sản chợ đ&ecirc;m, si&ecirc;u thị Lotte ...</p>\n\n<p>Ph&ugrave; hợp tổ chức team building, tiệc họp mặt hay xum họp gia đ&igrave;nh, bạn b&egrave;</p>\n', '<p>Kh&ocirc;ng sử dụng c&aacute;c chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở nhạc qu&aacute; 11 PM (23:00)</p>\n\n<p>Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ngủ</p>\n\n<p>Kh&ocirc;ng mở tiệc trong ph&ograve;ng</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '16:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (69, 'HS1 Luxury Pool Villa - Vung Tau city', 1, 'Vũng Tàu, Bà Rịa Vũng Tàu, Vietnam', 400, 8250000, 11350000, 5, 6, 0, 0, 10, '<ul>\n	<li>\n	<p>HS Luxury Villa l&agrave; villa ti&ecirc;u chuẩn 5* duy nhất tại Vũng T&agrave;u, phục vụ ăn s&aacute;ng miễn ph&iacute; tại villa.</p>\n	</li>\n	<li>\n	<p>Villa được thiết kế theo lối kiến tr&uacute;c mở, vừa h&agrave;i h&ograve;a th&acirc;n thiện với thi&ecirc;n nhi&ecirc;n, vừa sang trọng v&agrave; đẳng cấp.</p>\n	</li>\n	<li>\n	<p>Hồ bơi rộng, đẹp được trang bị sẵn ghế sunbath sẽ gi&uacute;p bạn c&oacute; những gi&acirc;y ph&uacute; thư giản, giải tỏa căng thẳng, x&oacute;a đi tất cả muộn phiền lo lắng của cuộc sống. Đặt biệt nước hồ bơi được xử l&yacute; bằng muối điện ph&acirc;n, kh&ocirc;ng d&ugrave;ng h&oacute;a chất n&ecirc;n an to&agrave;n cho da của bạn v&agrave; b&eacute;.</p>\n	</li>\n	<li>\n	<p>Villa được trang bị sẵn ph&ograve;ng Karaoke ri&ecirc;ng biệt gi&uacute;p bạn c&oacute; những gi&acirc;y ph&uacute;t giải tr&iacute; vui vẻ b&ecirc;n bạn b&egrave; v&agrave; người th&acirc;n ngay tại villa m&agrave; kh&ocirc;ng mất th&ecirc;m chi ph&iacute; n&agrave;o.</p>\n	</li>\n	<li>\n	<p>S&acirc;n vườn rộng, tho&aacute;ng m&aacute;t, trang bị sẵn b&agrave;n ghế để l&agrave;m tiệc BBQ ngo&agrave;i trời.</p>\n	</li>\n</ul>\n\n<p><strong>Tiện &iacute;ch:</strong></p>\n\n<ul>\n	<li>\n	<p>C&oacute; 05 ph&ograve;ng ngủ cao cấp ti&ecirc;u chuẩn 5*, c&aacute;c ph&ograve;ng đều c&oacute; toilet b&ecirc;n trong, trang bị đầy đủ m&aacute;y lạnh, smart TV, b&agrave;n l&agrave;m việc...</p>\n	</li>\n	<li>\n	<p>1 ph&ograve;ng kh&aacute;ch, 1 nh&agrave; bếp trang bị đầy đủ tiện nghi &ndash; dụng cụ nấu ăn, bếp nướng BBQ</p>\n	</li>\n	<li>\n	<p>1 ph&ograve;ng Karaoke cao cấp</p>\n	</li>\n	<li>\n	<p>Hồ bơi điện ph&acirc;n muối, kh&ocirc;ng d&ugrave;ng h&oacute;a chất</p>\n	</li>\n	<li>\n	<p>S&acirc;n vườn tiện &iacute;ch BBQ ngo&agrave;i trời</p>\n	</li>\n</ul>\n\n<p><strong>Dịch vụ đi k&egrave;m kh&ocirc;ng t&iacute;nh ph&iacute;:</strong></p>\n\n<p>&ndash; Miễn ph&iacute; ăn s&aacute;ng 10 kh&aacute;ch</p>\n\n<p>&ndash; Mi&ecirc;̃n phí phòng hát karaoke</p>\n\n<p>&ndash; Miễn ph&iacute; dụng cụ nấu ăn: nồi, xoong, chảo, ch&eacute;n, b&aacute;t, ly, .... Bếp nướng BBQ (than nướng v&agrave; gia vị kh&aacute;ch tự chuẩn bị)</p>\n\n<p><strong>Dịch vụ đi k&egrave;m c&oacute; t&iacute;nh ph&iacute;</strong></p>\n\n<p>Trong quá trình nghỉ dưỡng, quý khách c&acirc;̀n sử dụng các dịch vụ phát sinh tại bi&ecirc;̣t thự, sẽ có những khoản phụ phí sau:</p>\n\n<p>&ndash; Thu&ecirc; phao kh&ocirc;̉ng l&ocirc;̀</p>\n\n<p>&ndash; Thu&ecirc; đ&acirc;̀u b&ecirc;́p đi chợ, n&acirc;́u ăn</p>\n\n<p>&ndash; Phục vụ rửa chén, dọn dẹp</p>\n\n<p>&ndash; Trang trí sinh nh&acirc;̣t, đặt bánh kem,&hellip;</p>\n\n<p>Mức giá sử dụng dịch vụ sẽ được nh&acirc;n vi&ecirc;n tại bi&ecirc;̣t thự tư v&acirc;́n và h&ocirc;̃ trợ, tùy theo nhu c&acirc;̀u của khách hàng</p>\n', '<p>Kh&ocirc;ng h&uacute;t thuốc trong ph&ograve;ng ngủ</p>\n\n<p>Kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</p>\n\n<p>Kh&ocirc;ng mở tiệc trong nh&agrave;</p>\n\n<p>Vui l&ograve;ng tắt c&aacute;c thiết bị khi bạn ra khỏi ph&ograve;ng</p>\n', '12:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (70, 'Thị Trấn Nhỏ Homestay - Phòng nhà mộng mơ', 1, 'Đà Lạt, Lâm Đồng, Vietnam', 14, 315000, 315000, 1, 1, 0, 0, 2, '<p>C&aacute;ch trung t&acirc;m 4km, kh&ocirc;ng qu&aacute; xa nhưng đủ để cảm nhận kh&ocirc;ng gian y&ecirc;n tĩnh, tho&aacute;ng đ&atilde;ng, xa rời kh&oacute;i bụi của phố.</p>\n\n<p>Ph&ograve;ng 1 giường nhỏ xinh d&agrave;nh cho cặp đ&ocirc;i, c&oacute; wc nhỏ v&agrave; trang bị c&aacute;c vật dụng cơ bản (b&agrave;n chải, kem đ&aacute;nh răng, khăn mặt, nước uống...) Trong ph&ograve;ng kh&ocirc;ng trang bị tivi, tủ lạnh, tủ quần &aacute;o hay m&aacute;y điều h&ograve;a. Bếp chung lu&ocirc;n sẵn s&agrave;ng để bạn tự do nấu những m&oacute;n y&ecirc;u th&iacute;ch.</p>\n\n<p><strong>Với thiết kế đơn giản</strong>, ph&ograve;ng ốc nhỏ xinh, trang bị cơ bản, tuy kh&ocirc;ng rộng r&atilde;i v&agrave; tiện nghi như những nơi kh&aacute;c, nhưng Thị Trấn Nhỏ Homestay sẽ l&agrave; một nơi th&uacute; vị d&agrave;nh cho c&aacute;c bạn trẻ y&ecirc;u th&iacute;ch trải nghiệm những điều mới mẻ, y&ecirc;u th&iacute;ch thi&ecirc;n nhi&ecirc;n, kh&ocirc;ng gian y&ecirc;n tĩnh.</p>\n\n<p>B&ecirc;n cạnh đ&oacute;, t&ocirc;i cũng l&agrave; một người bản địa&nbsp;v&ocirc; c&ugrave;ng th&acirc;n thiện v&agrave; thoải m&aacute;i. Ch&iacute;nh v&igrave; vậy đừng ngại ngần m&agrave; chia sẻ với ch&uacute;ng t&ocirc;i những điều bạn đang thắc mắc hoặc những kh&oacute; khăn bạn gặp phải khi ở đ&acirc;y.</p>\n\n<p>Ch&uacute;ng t&ocirc;i cũng lu&ocirc;n mong muốn được c&ugrave;ng bạn kh&aacute;m ph&aacute; nhiều địa điểm tốt đẹp nhất tại đ&acirc;y.</p>\n', '<ul>\n	<li>Giờ checkin: 14:00, checkout 12:00 h&ocirc;m sau.</li>\n	<li>Kh&ocirc;ng cho ph&eacute;p vật nu&ocirc;i, th&uacute; cưng trong homestay</li>\n	<li>Giữ g&igrave;n vệ sinh chung, kh&ocirc;ng đem c&aacute;c vật dụng sử dụng chung v&agrave;o ph&ograve;ng ri&ecirc;ng.</li>\n	<li>Đảm bảo kh&ocirc;ng g&acirc;y mất trật tự, ồn &agrave;o trong khoảng thời gian từ 22:00 đến 6:00 h&ocirc;m sau.</li>\n	<li>Kh&ocirc;ng ph&ugrave; hợp với c&aacute;c kh&aacute;ch lớn tuổi, hoặc c&aacute;c kh&aacute;ch y&ecirc;u cầu ph&ograve;ng ốc đầy đủ tiện nghi.</li>\n	<li>Ph&ograve;ng ốc nhỏ xinh n&ecirc;n sẽ kh&ocirc;ng ph&ugrave; hợp với kh&aacute;ch nước ngo&agrave;i.</li>\n	<li>Kh&ocirc;ng h&uacute;t thuốc l&aacute; trong ph&ograve;ng.</li>\n	<li>Giờ giấc tự do.&copy;</li>\n</ul>\n', '14:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (71, 'Eco Apartment - căn hộ mini đầy đủ tiện nghi, gần Hồ Xuân Hương (2)', 1, 'Đà Lạt, Lâm Đồng, Vietnam', 60, 515000, 550000, 1, 1, 0, 0, 4, '<p><strong>Eco Apartment&nbsp;</strong>c&aacute;ch hồ Xu&acirc;n hHương chỉ 300m, s&acirc;n vườn rộng r&atilde;i, vườn c&oacute; nhiều loại rau sạch được d&ugrave;ng miễn ph&iacute;, thoải m&aacute;i để tổ chức tiệc BBQ ngo&agrave;i trời.</p>\n\n<p>Căn hộ nằm ở khu vực c&oacute; nhiều c&acirc;y xanh tho&aacute;ng m&aacute;t, kh&ocirc;ng kh&iacute; trong l&agrave;nh.</p>\n\n<ul>\n	<li>Vị tr&iacute; nằm gần trung t&acirc;m</li>\n	<li>60 m2 tiện nghi ph&ograve;ng hiện đại, đầy đủ vật dụng cần thiết.</li>\n	<li>Kiến tr&uacute;c nh&agrave; đơn giản nhưng mang lại sự ấm &aacute;p như ở nh&agrave; của bạn</li>\n	<li>C&oacute; bếp v&agrave; ph&ograve;ng kh&aacute;ch, s&acirc;n để tổ chức c&aacute;c buổi BBQ ấm &aacute;p v&oacute;i gia đ&igrave;nh v&agrave; bạn b&egrave;</li>\n</ul>\n\n<p>Ch&uacute;ng t&ocirc;i l&agrave; những người bản địa v&ocirc; c&ugrave;ng th&acirc;n thiện v&agrave; thoải m&aacute;i. Ch&iacute;nh v&igrave; vậy đừng ngại ngần m&agrave; chia sẻ với ch&uacute;ng t&ocirc;i những điều bạn đang thắc mắc hoặc những kh&oacute; khăn bạn gặp phải khi ở đ&acirc;y.</p>\n\n<p>B&ecirc;n cạnh đ&oacute; ch&uacute;ng t&ocirc;i cũng lu&ocirc;n mong muốn được c&ugrave;ng bạn kh&aacute;m ph&aacute; nhiều địa điểm tốt đẹp nhất tại đ&acirc;y.</p>\n\n<p>Ch&agrave;o mừng bạn đến với&nbsp;<strong>Eco Apartment !</strong></p>\n', '<p>- Kh&ocirc;ng h&uacute;t thuốc, kh&ocirc;ng sử dụng chất k&iacute;ch th&iacute;ch</p>\n\n<p>- Vui l&ograve;ng giữ trật tự sau 22h tr&aacute;nh g&acirc;y ảnh hưởng đến c&aacute;c du kh&aacute;ch kh&aacute;c</p>\n\n<p>- Hạn chế mang theo vật nu&ocirc;i</p>\n', '13:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (72, 'The Town Dalat - Dorm 3 giường đơn - 1 đôi', 1, 'Đà Lạt, Lâm Đồng, Vietnam', 18, 400000, 450000, 1, 2, 0, 0, 4, '<p>C&oacute; v&aacute;ch ngăn ri&ecirc;ng v&agrave; r&egrave;m che ri&ecirc;ng biệt, kh&ocirc;ng ngột ngạt</p>\n\n<p>Khu&ocirc;n vi&ecirc;n rộng với nhiều m&ocirc; h&igrave;nh nh&agrave; ở tạo kh&ocirc;ng kh&iacute; nhộn nhịp trong khu&ocirc;n vi&ecirc;n</p>\n\n<p>Ph&ograve;ng gỗ rộng 18m2 cho team</p>\n\n<p>Ph&ograve;ng trong nh&agrave; gỗ</p>\n\n<p>Khu&ocirc;n vi&ecirc;n rộng với nhiều m&ocirc; h&igrave;nh nh&agrave; ở tạo kh&ocirc;ng kh&iacute; nhộn nhịp trong khu&ocirc;n vi&ecirc;n</p>\n\n<p>Dorm thoải m&aacute;i &iacute;t người..Nh&agrave; c&oacute; 2 wc bếp tự phục vụ</p>\n', '<p>- Kh&ocirc;ng ở dơ</p>\n', '15:00:00', '12:00:00', NULL, 1, 1);
INSERT INTO `phong` VALUES (73, 'An garden - View thành phố - Sân Vườn', 1, 'Đà Lạt, Lâm Đồng, Vietnam', 21, 450000, 470000, 1, 1, 500000, -2, 2, '<p>An Garden Dalat</p>\n\n<p>An Garden Dalat được nằm gần vị tr&iacute; trung t&acirc;m th&agrave;nh phố c&aacute;ch 1.6km , nơi con đường được xem c&oacute; view đẹp nhất trung t&acirc;m th&agrave;nh phố , với nhiều t&ograve;a nh&agrave; biệt thự mọc l&ecirc;n , l&agrave;m t&ocirc; đẹp cho vẻ đẹp sang trong của cung đường phố .</p>\n\n<p>An Garden Đalat l&agrave; nơi l&yacute; tưởng để cho c&aacute;c bạn để c&oacute; k&igrave; nghĩ thoải m&aacute;i b&ecirc;n người th&acirc;n gia đ&igrave;nh v&agrave; bạn b&egrave; . Với khu&ocirc;n vi&ecirc;n 1000 m2 , s&acirc;n vườn với nhiều thảm cỏ xanh tốt , hoa 4 m&ugrave;a xung quanh , ao hồ , gi&uacute;p c&aacute;c bạn c&oacute; đầy đủ sự y&ecirc;ntĩnh kh&ocirc;ng gian để nghĩ ngơi .</p>\n\n<p>Tất cả c&aacute;c Ph&ograve;ng của b&ecirc;n An Garden Dalat đều nằm vị tr&iacute; tr&ecirc;n cao , với tầm view nh&igrave;n rộng to&agrave;n cảnh th&agrave;nh phố đ&agrave; lạt , tạo ra kh&ocirc;ng gian tho&aacute;ng đ&atilde;ng d&agrave;nh cho c&aacute;c bạn .</p>\n\n<p>Đến với An Garden Dalat bạn nhận được g&igrave; ?</p>\n\n<p>- Căn ph&ograve;ng tuyệt đẹp cho bạn .</p>\n\n<p>- Bữa s&aacute;ng với nhiều m&oacute;n ngon</p>\n\n<p>- Kh&ocirc;ng gian y&ecirc;n tĩnh cho k&igrave; nghĩ</p>\n\n<p>- Tầm view tuyệt đẹp to&agrave;n cảnh th&agrave;nh phố</p>\n\n<p>- Tổ chức nướng BBQ s&acirc;n vườn</p>\n\n<p>- V&agrave; một số hoạt động theo y&ecirc;u cầu</p>\n\n<p>An Garden Dalat .</p>\n\n<p>H&atilde;y đến v&agrave; cảm nhận c&ugrave;ng An Garden Dalat !!!</p>\n', '<p>- Giờ check in: Sau 12:00 -14: 00 PM</p>\n\n<p>- Giờ check out: Trước 11:00 PM</p>\n\n<p>- Kh&ocirc;ng cho ph&eacute;p vật nu&ocirc;i</p>\n\n<p>- Hạn chế tiếng ồn sau 21:30</p>\n\n<p>- Quy định nhận ph&ograve;ng: Qu&yacute; kh&aacute;ch vui l&ograve;ng mang theo CMND (ID) hoặc Hộ Chiếu (Passport) (đối với người nước ngo&agrave;i) hoặc Thẻ tạm tr&uacute; (đối với kh&aacute;ch nước ngo&agrave;i đi c&ocirc;ng t&aacute;c)</p>\n', '14:00:00', '12:00:00', NULL, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tiennghicuaphong` VALUES (28, 1);
INSERT INTO `tiennghicuaphong` VALUES (29, 1);
INSERT INTO `tiennghicuaphong` VALUES (30, 1);
INSERT INTO `tiennghicuaphong` VALUES (31, 1);
INSERT INTO `tiennghicuaphong` VALUES (32, 1);
INSERT INTO `tiennghicuaphong` VALUES (33, 1);
INSERT INTO `tiennghicuaphong` VALUES (34, 1);
INSERT INTO `tiennghicuaphong` VALUES (35, 1);
INSERT INTO `tiennghicuaphong` VALUES (36, 1);
INSERT INTO `tiennghicuaphong` VALUES (37, 1);
INSERT INTO `tiennghicuaphong` VALUES (38, 1);
INSERT INTO `tiennghicuaphong` VALUES (49, 1);
INSERT INTO `tiennghicuaphong` VALUES (50, 1);
INSERT INTO `tiennghicuaphong` VALUES (56, 1);
INSERT INTO `tiennghicuaphong` VALUES (57, 1);
INSERT INTO `tiennghicuaphong` VALUES (58, 1);
INSERT INTO `tiennghicuaphong` VALUES (59, 1);
INSERT INTO `tiennghicuaphong` VALUES (60, 1);
INSERT INTO `tiennghicuaphong` VALUES (61, 1);
INSERT INTO `tiennghicuaphong` VALUES (62, 1);
INSERT INTO `tiennghicuaphong` VALUES (63, 1);
INSERT INTO `tiennghicuaphong` VALUES (64, 1);
INSERT INTO `tiennghicuaphong` VALUES (65, 1);
INSERT INTO `tiennghicuaphong` VALUES (66, 1);
INSERT INTO `tiennghicuaphong` VALUES (67, 1);
INSERT INTO `tiennghicuaphong` VALUES (68, 1);
INSERT INTO `tiennghicuaphong` VALUES (69, 1);
INSERT INTO `tiennghicuaphong` VALUES (70, 1);
INSERT INTO `tiennghicuaphong` VALUES (71, 1);
INSERT INTO `tiennghicuaphong` VALUES (72, 1);
INSERT INTO `tiennghicuaphong` VALUES (73, 1);
INSERT INTO `tiennghicuaphong` VALUES (1, 2);
INSERT INTO `tiennghicuaphong` VALUES (28, 2);
INSERT INTO `tiennghicuaphong` VALUES (29, 2);
INSERT INTO `tiennghicuaphong` VALUES (30, 2);
INSERT INTO `tiennghicuaphong` VALUES (31, 2);
INSERT INTO `tiennghicuaphong` VALUES (32, 2);
INSERT INTO `tiennghicuaphong` VALUES (33, 2);
INSERT INTO `tiennghicuaphong` VALUES (34, 2);
INSERT INTO `tiennghicuaphong` VALUES (35, 2);
INSERT INTO `tiennghicuaphong` VALUES (36, 2);
INSERT INTO `tiennghicuaphong` VALUES (37, 2);
INSERT INTO `tiennghicuaphong` VALUES (38, 2);
INSERT INTO `tiennghicuaphong` VALUES (49, 2);
INSERT INTO `tiennghicuaphong` VALUES (50, 2);
INSERT INTO `tiennghicuaphong` VALUES (56, 2);
INSERT INTO `tiennghicuaphong` VALUES (57, 2);
INSERT INTO `tiennghicuaphong` VALUES (58, 2);
INSERT INTO `tiennghicuaphong` VALUES (59, 2);
INSERT INTO `tiennghicuaphong` VALUES (60, 2);
INSERT INTO `tiennghicuaphong` VALUES (61, 2);
INSERT INTO `tiennghicuaphong` VALUES (62, 2);
INSERT INTO `tiennghicuaphong` VALUES (63, 2);
INSERT INTO `tiennghicuaphong` VALUES (64, 2);
INSERT INTO `tiennghicuaphong` VALUES (65, 2);
INSERT INTO `tiennghicuaphong` VALUES (67, 2);
INSERT INTO `tiennghicuaphong` VALUES (68, 2);
INSERT INTO `tiennghicuaphong` VALUES (69, 2);
INSERT INTO `tiennghicuaphong` VALUES (71, 2);
INSERT INTO `tiennghicuaphong` VALUES (72, 2);
INSERT INTO `tiennghicuaphong` VALUES (73, 2);
INSERT INTO `tiennghicuaphong` VALUES (1, 3);
INSERT INTO `tiennghicuaphong` VALUES (28, 3);
INSERT INTO `tiennghicuaphong` VALUES (29, 3);
INSERT INTO `tiennghicuaphong` VALUES (30, 3);
INSERT INTO `tiennghicuaphong` VALUES (31, 3);
INSERT INTO `tiennghicuaphong` VALUES (32, 3);
INSERT INTO `tiennghicuaphong` VALUES (33, 3);
INSERT INTO `tiennghicuaphong` VALUES (34, 3);
INSERT INTO `tiennghicuaphong` VALUES (35, 3);
INSERT INTO `tiennghicuaphong` VALUES (36, 3);
INSERT INTO `tiennghicuaphong` VALUES (37, 3);
INSERT INTO `tiennghicuaphong` VALUES (38, 3);
INSERT INTO `tiennghicuaphong` VALUES (49, 3);
INSERT INTO `tiennghicuaphong` VALUES (50, 3);
INSERT INTO `tiennghicuaphong` VALUES (57, 3);
INSERT INTO `tiennghicuaphong` VALUES (59, 3);
INSERT INTO `tiennghicuaphong` VALUES (60, 3);
INSERT INTO `tiennghicuaphong` VALUES (61, 3);
INSERT INTO `tiennghicuaphong` VALUES (62, 3);
INSERT INTO `tiennghicuaphong` VALUES (64, 3);
INSERT INTO `tiennghicuaphong` VALUES (65, 3);
INSERT INTO `tiennghicuaphong` VALUES (66, 3);
INSERT INTO `tiennghicuaphong` VALUES (67, 3);
INSERT INTO `tiennghicuaphong` VALUES (69, 3);
INSERT INTO `tiennghicuaphong` VALUES (70, 3);
INSERT INTO `tiennghicuaphong` VALUES (71, 3);
INSERT INTO `tiennghicuaphong` VALUES (72, 3);
INSERT INTO `tiennghicuaphong` VALUES (73, 3);
INSERT INTO `tiennghicuaphong` VALUES (1, 4);
INSERT INTO `tiennghicuaphong` VALUES (2, 4);
INSERT INTO `tiennghicuaphong` VALUES (28, 4);
INSERT INTO `tiennghicuaphong` VALUES (29, 4);
INSERT INTO `tiennghicuaphong` VALUES (30, 4);
INSERT INTO `tiennghicuaphong` VALUES (31, 4);
INSERT INTO `tiennghicuaphong` VALUES (32, 4);
INSERT INTO `tiennghicuaphong` VALUES (33, 4);
INSERT INTO `tiennghicuaphong` VALUES (34, 4);
INSERT INTO `tiennghicuaphong` VALUES (35, 4);
INSERT INTO `tiennghicuaphong` VALUES (36, 4);
INSERT INTO `tiennghicuaphong` VALUES (37, 4);
INSERT INTO `tiennghicuaphong` VALUES (49, 4);
INSERT INTO `tiennghicuaphong` VALUES (50, 4);
INSERT INTO `tiennghicuaphong` VALUES (56, 4);
INSERT INTO `tiennghicuaphong` VALUES (57, 4);
INSERT INTO `tiennghicuaphong` VALUES (58, 4);
INSERT INTO `tiennghicuaphong` VALUES (59, 4);
INSERT INTO `tiennghicuaphong` VALUES (61, 4);
INSERT INTO `tiennghicuaphong` VALUES (62, 4);
INSERT INTO `tiennghicuaphong` VALUES (63, 4);
INSERT INTO `tiennghicuaphong` VALUES (64, 4);
INSERT INTO `tiennghicuaphong` VALUES (65, 4);
INSERT INTO `tiennghicuaphong` VALUES (66, 4);
INSERT INTO `tiennghicuaphong` VALUES (67, 4);
INSERT INTO `tiennghicuaphong` VALUES (68, 4);
INSERT INTO `tiennghicuaphong` VALUES (69, 4);
INSERT INTO `tiennghicuaphong` VALUES (71, 4);
INSERT INTO `tiennghicuaphong` VALUES (72, 4);
INSERT INTO `tiennghicuaphong` VALUES (73, 4);
INSERT INTO `tiennghicuaphong` VALUES (1, 5);
INSERT INTO `tiennghicuaphong` VALUES (28, 5);
INSERT INTO `tiennghicuaphong` VALUES (29, 5);
INSERT INTO `tiennghicuaphong` VALUES (30, 5);
INSERT INTO `tiennghicuaphong` VALUES (31, 5);
INSERT INTO `tiennghicuaphong` VALUES (32, 5);
INSERT INTO `tiennghicuaphong` VALUES (33, 5);
INSERT INTO `tiennghicuaphong` VALUES (34, 5);
INSERT INTO `tiennghicuaphong` VALUES (35, 5);
INSERT INTO `tiennghicuaphong` VALUES (36, 5);
INSERT INTO `tiennghicuaphong` VALUES (37, 5);
INSERT INTO `tiennghicuaphong` VALUES (38, 5);
INSERT INTO `tiennghicuaphong` VALUES (49, 5);
INSERT INTO `tiennghicuaphong` VALUES (50, 5);
INSERT INTO `tiennghicuaphong` VALUES (56, 5);
INSERT INTO `tiennghicuaphong` VALUES (57, 5);
INSERT INTO `tiennghicuaphong` VALUES (59, 5);
INSERT INTO `tiennghicuaphong` VALUES (61, 5);
INSERT INTO `tiennghicuaphong` VALUES (63, 5);
INSERT INTO `tiennghicuaphong` VALUES (64, 5);
INSERT INTO `tiennghicuaphong` VALUES (65, 5);
INSERT INTO `tiennghicuaphong` VALUES (66, 5);
INSERT INTO `tiennghicuaphong` VALUES (67, 5);
INSERT INTO `tiennghicuaphong` VALUES (68, 5);
INSERT INTO `tiennghicuaphong` VALUES (69, 5);
INSERT INTO `tiennghicuaphong` VALUES (70, 5);
INSERT INTO `tiennghicuaphong` VALUES (71, 5);
INSERT INTO `tiennghicuaphong` VALUES (72, 5);
INSERT INTO `tiennghicuaphong` VALUES (73, 5);
INSERT INTO `tiennghicuaphong` VALUES (1, 6);
INSERT INTO `tiennghicuaphong` VALUES (28, 6);
INSERT INTO `tiennghicuaphong` VALUES (29, 6);
INSERT INTO `tiennghicuaphong` VALUES (30, 6);
INSERT INTO `tiennghicuaphong` VALUES (31, 6);
INSERT INTO `tiennghicuaphong` VALUES (32, 6);
INSERT INTO `tiennghicuaphong` VALUES (33, 6);
INSERT INTO `tiennghicuaphong` VALUES (35, 6);
INSERT INTO `tiennghicuaphong` VALUES (36, 6);
INSERT INTO `tiennghicuaphong` VALUES (37, 6);
INSERT INTO `tiennghicuaphong` VALUES (38, 6);
INSERT INTO `tiennghicuaphong` VALUES (49, 6);
INSERT INTO `tiennghicuaphong` VALUES (50, 6);
INSERT INTO `tiennghicuaphong` VALUES (56, 6);
INSERT INTO `tiennghicuaphong` VALUES (57, 6);
INSERT INTO `tiennghicuaphong` VALUES (58, 6);
INSERT INTO `tiennghicuaphong` VALUES (60, 6);
INSERT INTO `tiennghicuaphong` VALUES (61, 6);
INSERT INTO `tiennghicuaphong` VALUES (62, 6);
INSERT INTO `tiennghicuaphong` VALUES (63, 6);
INSERT INTO `tiennghicuaphong` VALUES (64, 6);
INSERT INTO `tiennghicuaphong` VALUES (65, 6);
INSERT INTO `tiennghicuaphong` VALUES (66, 6);
INSERT INTO `tiennghicuaphong` VALUES (67, 6);
INSERT INTO `tiennghicuaphong` VALUES (68, 6);
INSERT INTO `tiennghicuaphong` VALUES (69, 6);
INSERT INTO `tiennghicuaphong` VALUES (70, 6);
INSERT INTO `tiennghicuaphong` VALUES (71, 6);
INSERT INTO `tiennghicuaphong` VALUES (72, 6);
INSERT INTO `tiennghicuaphong` VALUES (73, 6);
INSERT INTO `tiennghicuaphong` VALUES (1, 7);
INSERT INTO `tiennghicuaphong` VALUES (2, 7);
INSERT INTO `tiennghicuaphong` VALUES (28, 7);
INSERT INTO `tiennghicuaphong` VALUES (31, 7);
INSERT INTO `tiennghicuaphong` VALUES (32, 7);
INSERT INTO `tiennghicuaphong` VALUES (33, 7);
INSERT INTO `tiennghicuaphong` VALUES (35, 7);
INSERT INTO `tiennghicuaphong` VALUES (36, 7);
INSERT INTO `tiennghicuaphong` VALUES (37, 7);
INSERT INTO `tiennghicuaphong` VALUES (38, 7);
INSERT INTO `tiennghicuaphong` VALUES (49, 7);
INSERT INTO `tiennghicuaphong` VALUES (56, 7);
INSERT INTO `tiennghicuaphong` VALUES (57, 7);
INSERT INTO `tiennghicuaphong` VALUES (58, 7);
INSERT INTO `tiennghicuaphong` VALUES (59, 7);
INSERT INTO `tiennghicuaphong` VALUES (61, 7);
INSERT INTO `tiennghicuaphong` VALUES (62, 7);
INSERT INTO `tiennghicuaphong` VALUES (63, 7);
INSERT INTO `tiennghicuaphong` VALUES (64, 7);
INSERT INTO `tiennghicuaphong` VALUES (65, 7);
INSERT INTO `tiennghicuaphong` VALUES (66, 7);
INSERT INTO `tiennghicuaphong` VALUES (67, 7);
INSERT INTO `tiennghicuaphong` VALUES (68, 7);
INSERT INTO `tiennghicuaphong` VALUES (69, 7);
INSERT INTO `tiennghicuaphong` VALUES (70, 7);
INSERT INTO `tiennghicuaphong` VALUES (71, 7);
INSERT INTO `tiennghicuaphong` VALUES (72, 7);
INSERT INTO `tiennghicuaphong` VALUES (73, 7);
INSERT INTO `tiennghicuaphong` VALUES (1, 8);
INSERT INTO `tiennghicuaphong` VALUES (2, 8);
INSERT INTO `tiennghicuaphong` VALUES (28, 8);
INSERT INTO `tiennghicuaphong` VALUES (29, 8);
INSERT INTO `tiennghicuaphong` VALUES (30, 8);
INSERT INTO `tiennghicuaphong` VALUES (31, 8);
INSERT INTO `tiennghicuaphong` VALUES (32, 8);
INSERT INTO `tiennghicuaphong` VALUES (33, 8);
INSERT INTO `tiennghicuaphong` VALUES (35, 8);
INSERT INTO `tiennghicuaphong` VALUES (36, 8);
INSERT INTO `tiennghicuaphong` VALUES (37, 8);
INSERT INTO `tiennghicuaphong` VALUES (38, 8);
INSERT INTO `tiennghicuaphong` VALUES (49, 8);
INSERT INTO `tiennghicuaphong` VALUES (56, 8);
INSERT INTO `tiennghicuaphong` VALUES (59, 8);
INSERT INTO `tiennghicuaphong` VALUES (60, 8);
INSERT INTO `tiennghicuaphong` VALUES (61, 8);
INSERT INTO `tiennghicuaphong` VALUES (62, 8);
INSERT INTO `tiennghicuaphong` VALUES (63, 8);
INSERT INTO `tiennghicuaphong` VALUES (66, 8);
INSERT INTO `tiennghicuaphong` VALUES (68, 8);
INSERT INTO `tiennghicuaphong` VALUES (69, 8);
INSERT INTO `tiennghicuaphong` VALUES (70, 8);
INSERT INTO `tiennghicuaphong` VALUES (71, 8);
INSERT INTO `tiennghicuaphong` VALUES (72, 8);
INSERT INTO `tiennghicuaphong` VALUES (73, 8);
INSERT INTO `tiennghicuaphong` VALUES (1, 9);
INSERT INTO `tiennghicuaphong` VALUES (28, 9);
INSERT INTO `tiennghicuaphong` VALUES (29, 9);
INSERT INTO `tiennghicuaphong` VALUES (31, 9);
INSERT INTO `tiennghicuaphong` VALUES (32, 9);
INSERT INTO `tiennghicuaphong` VALUES (33, 9);
INSERT INTO `tiennghicuaphong` VALUES (35, 9);
INSERT INTO `tiennghicuaphong` VALUES (36, 9);
INSERT INTO `tiennghicuaphong` VALUES (37, 9);
INSERT INTO `tiennghicuaphong` VALUES (49, 9);
INSERT INTO `tiennghicuaphong` VALUES (50, 9);
INSERT INTO `tiennghicuaphong` VALUES (56, 9);
INSERT INTO `tiennghicuaphong` VALUES (57, 9);
INSERT INTO `tiennghicuaphong` VALUES (58, 9);
INSERT INTO `tiennghicuaphong` VALUES (59, 9);
INSERT INTO `tiennghicuaphong` VALUES (61, 9);
INSERT INTO `tiennghicuaphong` VALUES (62, 9);
INSERT INTO `tiennghicuaphong` VALUES (63, 9);
INSERT INTO `tiennghicuaphong` VALUES (64, 9);
INSERT INTO `tiennghicuaphong` VALUES (65, 9);
INSERT INTO `tiennghicuaphong` VALUES (67, 9);
INSERT INTO `tiennghicuaphong` VALUES (68, 9);
INSERT INTO `tiennghicuaphong` VALUES (69, 9);
INSERT INTO `tiennghicuaphong` VALUES (70, 9);
INSERT INTO `tiennghicuaphong` VALUES (71, 9);
INSERT INTO `tiennghicuaphong` VALUES (72, 9);
INSERT INTO `tiennghicuaphong` VALUES (73, 9);
INSERT INTO `tiennghicuaphong` VALUES (1, 10);
INSERT INTO `tiennghicuaphong` VALUES (2, 10);
INSERT INTO `tiennghicuaphong` VALUES (28, 10);
INSERT INTO `tiennghicuaphong` VALUES (29, 10);
INSERT INTO `tiennghicuaphong` VALUES (31, 10);
INSERT INTO `tiennghicuaphong` VALUES (38, 10);
INSERT INTO `tiennghicuaphong` VALUES (49, 10);
INSERT INTO `tiennghicuaphong` VALUES (50, 10);
INSERT INTO `tiennghicuaphong` VALUES (56, 10);
INSERT INTO `tiennghicuaphong` VALUES (57, 10);
INSERT INTO `tiennghicuaphong` VALUES (58, 10);
INSERT INTO `tiennghicuaphong` VALUES (59, 10);
INSERT INTO `tiennghicuaphong` VALUES (60, 10);
INSERT INTO `tiennghicuaphong` VALUES (61, 10);
INSERT INTO `tiennghicuaphong` VALUES (63, 10);
INSERT INTO `tiennghicuaphong` VALUES (64, 10);
INSERT INTO `tiennghicuaphong` VALUES (65, 10);
INSERT INTO `tiennghicuaphong` VALUES (66, 10);
INSERT INTO `tiennghicuaphong` VALUES (67, 10);
INSERT INTO `tiennghicuaphong` VALUES (69, 10);
INSERT INTO `tiennghicuaphong` VALUES (70, 10);
INSERT INTO `tiennghicuaphong` VALUES (71, 10);
INSERT INTO `tiennghicuaphong` VALUES (72, 10);
INSERT INTO `tiennghicuaphong` VALUES (73, 10);
INSERT INTO `tiennghicuaphong` VALUES (1, 11);
INSERT INTO `tiennghicuaphong` VALUES (2, 11);
INSERT INTO `tiennghicuaphong` VALUES (29, 11);
INSERT INTO `tiennghicuaphong` VALUES (30, 11);
INSERT INTO `tiennghicuaphong` VALUES (31, 11);
INSERT INTO `tiennghicuaphong` VALUES (34, 11);
INSERT INTO `tiennghicuaphong` VALUES (36, 11);
INSERT INTO `tiennghicuaphong` VALUES (37, 11);
INSERT INTO `tiennghicuaphong` VALUES (49, 11);
INSERT INTO `tiennghicuaphong` VALUES (50, 11);
INSERT INTO `tiennghicuaphong` VALUES (58, 11);
INSERT INTO `tiennghicuaphong` VALUES (60, 11);
INSERT INTO `tiennghicuaphong` VALUES (61, 11);
INSERT INTO `tiennghicuaphong` VALUES (62, 11);
INSERT INTO `tiennghicuaphong` VALUES (63, 11);
INSERT INTO `tiennghicuaphong` VALUES (64, 11);
INSERT INTO `tiennghicuaphong` VALUES (65, 11);
INSERT INTO `tiennghicuaphong` VALUES (66, 11);
INSERT INTO `tiennghicuaphong` VALUES (67, 11);
INSERT INTO `tiennghicuaphong` VALUES (69, 11);
INSERT INTO `tiennghicuaphong` VALUES (71, 11);
INSERT INTO `tiennghicuaphong` VALUES (72, 11);
INSERT INTO `tiennghicuaphong` VALUES (73, 11);
INSERT INTO `tiennghicuaphong` VALUES (1, 12);
INSERT INTO `tiennghicuaphong` VALUES (2, 12);
INSERT INTO `tiennghicuaphong` VALUES (30, 12);
INSERT INTO `tiennghicuaphong` VALUES (31, 12);
INSERT INTO `tiennghicuaphong` VALUES (34, 12);
INSERT INTO `tiennghicuaphong` VALUES (38, 12);
INSERT INTO `tiennghicuaphong` VALUES (49, 12);
INSERT INTO `tiennghicuaphong` VALUES (50, 12);
INSERT INTO `tiennghicuaphong` VALUES (58, 12);
INSERT INTO `tiennghicuaphong` VALUES (60, 12);
INSERT INTO `tiennghicuaphong` VALUES (61, 12);
INSERT INTO `tiennghicuaphong` VALUES (62, 12);
INSERT INTO `tiennghicuaphong` VALUES (63, 12);
INSERT INTO `tiennghicuaphong` VALUES (64, 12);
INSERT INTO `tiennghicuaphong` VALUES (65, 12);
INSERT INTO `tiennghicuaphong` VALUES (66, 12);
INSERT INTO `tiennghicuaphong` VALUES (67, 12);
INSERT INTO `tiennghicuaphong` VALUES (68, 12);
INSERT INTO `tiennghicuaphong` VALUES (69, 12);
INSERT INTO `tiennghicuaphong` VALUES (71, 12);
INSERT INTO `tiennghicuaphong` VALUES (72, 12);
INSERT INTO `tiennghicuaphong` VALUES (1, 13);
INSERT INTO `tiennghicuaphong` VALUES (2, 13);
INSERT INTO `tiennghicuaphong` VALUES (28, 13);
INSERT INTO `tiennghicuaphong` VALUES (29, 13);
INSERT INTO `tiennghicuaphong` VALUES (31, 13);
INSERT INTO `tiennghicuaphong` VALUES (34, 13);
INSERT INTO `tiennghicuaphong` VALUES (36, 13);
INSERT INTO `tiennghicuaphong` VALUES (37, 13);
INSERT INTO `tiennghicuaphong` VALUES (49, 13);
INSERT INTO `tiennghicuaphong` VALUES (50, 13);
INSERT INTO `tiennghicuaphong` VALUES (56, 13);
INSERT INTO `tiennghicuaphong` VALUES (57, 13);
INSERT INTO `tiennghicuaphong` VALUES (59, 13);
INSERT INTO `tiennghicuaphong` VALUES (60, 13);
INSERT INTO `tiennghicuaphong` VALUES (61, 13);
INSERT INTO `tiennghicuaphong` VALUES (62, 13);
INSERT INTO `tiennghicuaphong` VALUES (63, 13);
INSERT INTO `tiennghicuaphong` VALUES (64, 13);
INSERT INTO `tiennghicuaphong` VALUES (65, 13);
INSERT INTO `tiennghicuaphong` VALUES (67, 13);
INSERT INTO `tiennghicuaphong` VALUES (68, 13);
INSERT INTO `tiennghicuaphong` VALUES (69, 13);
INSERT INTO `tiennghicuaphong` VALUES (71, 13);
INSERT INTO `tiennghicuaphong` VALUES (72, 13);
INSERT INTO `tiennghicuaphong` VALUES (73, 13);
INSERT INTO `tiennghicuaphong` VALUES (1, 14);
INSERT INTO `tiennghicuaphong` VALUES (2, 14);
INSERT INTO `tiennghicuaphong` VALUES (28, 14);
INSERT INTO `tiennghicuaphong` VALUES (29, 14);
INSERT INTO `tiennghicuaphong` VALUES (35, 14);
INSERT INTO `tiennghicuaphong` VALUES (37, 14);
INSERT INTO `tiennghicuaphong` VALUES (49, 14);
INSERT INTO `tiennghicuaphong` VALUES (50, 14);
INSERT INTO `tiennghicuaphong` VALUES (57, 14);
INSERT INTO `tiennghicuaphong` VALUES (59, 14);
INSERT INTO `tiennghicuaphong` VALUES (60, 14);
INSERT INTO `tiennghicuaphong` VALUES (61, 14);
INSERT INTO `tiennghicuaphong` VALUES (62, 14);
INSERT INTO `tiennghicuaphong` VALUES (63, 14);
INSERT INTO `tiennghicuaphong` VALUES (64, 14);
INSERT INTO `tiennghicuaphong` VALUES (65, 14);
INSERT INTO `tiennghicuaphong` VALUES (66, 14);
INSERT INTO `tiennghicuaphong` VALUES (67, 14);
INSERT INTO `tiennghicuaphong` VALUES (68, 14);
INSERT INTO `tiennghicuaphong` VALUES (69, 14);
INSERT INTO `tiennghicuaphong` VALUES (71, 14);
INSERT INTO `tiennghicuaphong` VALUES (72, 14);
INSERT INTO `tiennghicuaphong` VALUES (73, 14);
INSERT INTO `tiennghicuaphong` VALUES (1, 15);
INSERT INTO `tiennghicuaphong` VALUES (28, 15);
INSERT INTO `tiennghicuaphong` VALUES (30, 15);
INSERT INTO `tiennghicuaphong` VALUES (31, 15);
INSERT INTO `tiennghicuaphong` VALUES (35, 15);
INSERT INTO `tiennghicuaphong` VALUES (37, 15);
INSERT INTO `tiennghicuaphong` VALUES (38, 15);
INSERT INTO `tiennghicuaphong` VALUES (49, 15);
INSERT INTO `tiennghicuaphong` VALUES (56, 15);
INSERT INTO `tiennghicuaphong` VALUES (57, 15);
INSERT INTO `tiennghicuaphong` VALUES (58, 15);
INSERT INTO `tiennghicuaphong` VALUES (59, 15);
INSERT INTO `tiennghicuaphong` VALUES (60, 15);
INSERT INTO `tiennghicuaphong` VALUES (61, 15);
INSERT INTO `tiennghicuaphong` VALUES (62, 15);
INSERT INTO `tiennghicuaphong` VALUES (63, 15);
INSERT INTO `tiennghicuaphong` VALUES (64, 15);
INSERT INTO `tiennghicuaphong` VALUES (65, 15);
INSERT INTO `tiennghicuaphong` VALUES (66, 15);
INSERT INTO `tiennghicuaphong` VALUES (68, 15);
INSERT INTO `tiennghicuaphong` VALUES (69, 15);
INSERT INTO `tiennghicuaphong` VALUES (70, 15);
INSERT INTO `tiennghicuaphong` VALUES (71, 15);
INSERT INTO `tiennghicuaphong` VALUES (72, 15);
INSERT INTO `tiennghicuaphong` VALUES (73, 15);
INSERT INTO `tiennghicuaphong` VALUES (1, 16);
INSERT INTO `tiennghicuaphong` VALUES (2, 16);
INSERT INTO `tiennghicuaphong` VALUES (28, 16);
INSERT INTO `tiennghicuaphong` VALUES (29, 16);
INSERT INTO `tiennghicuaphong` VALUES (35, 16);
INSERT INTO `tiennghicuaphong` VALUES (37, 16);
INSERT INTO `tiennghicuaphong` VALUES (38, 16);
INSERT INTO `tiennghicuaphong` VALUES (49, 16);
INSERT INTO `tiennghicuaphong` VALUES (50, 16);
INSERT INTO `tiennghicuaphong` VALUES (56, 16);
INSERT INTO `tiennghicuaphong` VALUES (57, 16);
INSERT INTO `tiennghicuaphong` VALUES (58, 16);
INSERT INTO `tiennghicuaphong` VALUES (59, 16);
INSERT INTO `tiennghicuaphong` VALUES (61, 16);
INSERT INTO `tiennghicuaphong` VALUES (63, 16);
INSERT INTO `tiennghicuaphong` VALUES (64, 16);
INSERT INTO `tiennghicuaphong` VALUES (66, 16);
INSERT INTO `tiennghicuaphong` VALUES (67, 16);
INSERT INTO `tiennghicuaphong` VALUES (68, 16);
INSERT INTO `tiennghicuaphong` VALUES (69, 16);
INSERT INTO `tiennghicuaphong` VALUES (70, 16);
INSERT INTO `tiennghicuaphong` VALUES (71, 16);
INSERT INTO `tiennghicuaphong` VALUES (72, 16);
INSERT INTO `tiennghicuaphong` VALUES (73, 16);
INSERT INTO `tiennghicuaphong` VALUES (1, 17);
INSERT INTO `tiennghicuaphong` VALUES (2, 17);
INSERT INTO `tiennghicuaphong` VALUES (28, 17);
INSERT INTO `tiennghicuaphong` VALUES (29, 17);
INSERT INTO `tiennghicuaphong` VALUES (30, 17);
INSERT INTO `tiennghicuaphong` VALUES (31, 17);
INSERT INTO `tiennghicuaphong` VALUES (34, 17);
INSERT INTO `tiennghicuaphong` VALUES (35, 17);
INSERT INTO `tiennghicuaphong` VALUES (38, 17);
INSERT INTO `tiennghicuaphong` VALUES (49, 17);
INSERT INTO `tiennghicuaphong` VALUES (50, 17);
INSERT INTO `tiennghicuaphong` VALUES (56, 17);
INSERT INTO `tiennghicuaphong` VALUES (57, 17);
INSERT INTO `tiennghicuaphong` VALUES (58, 17);
INSERT INTO `tiennghicuaphong` VALUES (59, 17);
INSERT INTO `tiennghicuaphong` VALUES (60, 17);
INSERT INTO `tiennghicuaphong` VALUES (61, 17);
INSERT INTO `tiennghicuaphong` VALUES (62, 17);
INSERT INTO `tiennghicuaphong` VALUES (63, 17);
INSERT INTO `tiennghicuaphong` VALUES (64, 17);
INSERT INTO `tiennghicuaphong` VALUES (65, 17);
INSERT INTO `tiennghicuaphong` VALUES (66, 17);
INSERT INTO `tiennghicuaphong` VALUES (67, 17);
INSERT INTO `tiennghicuaphong` VALUES (68, 17);
INSERT INTO `tiennghicuaphong` VALUES (69, 17);
INSERT INTO `tiennghicuaphong` VALUES (70, 17);
INSERT INTO `tiennghicuaphong` VALUES (71, 17);
INSERT INTO `tiennghicuaphong` VALUES (72, 17);
INSERT INTO `tiennghicuaphong` VALUES (73, 17);
INSERT INTO `tiennghicuaphong` VALUES (1, 18);
INSERT INTO `tiennghicuaphong` VALUES (28, 18);
INSERT INTO `tiennghicuaphong` VALUES (29, 18);
INSERT INTO `tiennghicuaphong` VALUES (30, 18);
INSERT INTO `tiennghicuaphong` VALUES (31, 18);
INSERT INTO `tiennghicuaphong` VALUES (34, 18);
INSERT INTO `tiennghicuaphong` VALUES (35, 18);
INSERT INTO `tiennghicuaphong` VALUES (37, 18);
INSERT INTO `tiennghicuaphong` VALUES (38, 18);
INSERT INTO `tiennghicuaphong` VALUES (49, 18);
INSERT INTO `tiennghicuaphong` VALUES (50, 18);
INSERT INTO `tiennghicuaphong` VALUES (57, 18);
INSERT INTO `tiennghicuaphong` VALUES (59, 18);
INSERT INTO `tiennghicuaphong` VALUES (60, 18);
INSERT INTO `tiennghicuaphong` VALUES (62, 18);
INSERT INTO `tiennghicuaphong` VALUES (63, 18);
INSERT INTO `tiennghicuaphong` VALUES (64, 18);
INSERT INTO `tiennghicuaphong` VALUES (65, 18);
INSERT INTO `tiennghicuaphong` VALUES (66, 18);
INSERT INTO `tiennghicuaphong` VALUES (67, 18);
INSERT INTO `tiennghicuaphong` VALUES (68, 18);
INSERT INTO `tiennghicuaphong` VALUES (69, 18);
INSERT INTO `tiennghicuaphong` VALUES (70, 18);
INSERT INTO `tiennghicuaphong` VALUES (71, 18);
INSERT INTO `tiennghicuaphong` VALUES (72, 18);
INSERT INTO `tiennghicuaphong` VALUES (73, 18);
INSERT INTO `tiennghicuaphong` VALUES (1, 19);
INSERT INTO `tiennghicuaphong` VALUES (2, 19);
INSERT INTO `tiennghicuaphong` VALUES (28, 19);
INSERT INTO `tiennghicuaphong` VALUES (29, 19);
INSERT INTO `tiennghicuaphong` VALUES (30, 19);
INSERT INTO `tiennghicuaphong` VALUES (31, 19);
INSERT INTO `tiennghicuaphong` VALUES (34, 19);
INSERT INTO `tiennghicuaphong` VALUES (35, 19);
INSERT INTO `tiennghicuaphong` VALUES (38, 19);
INSERT INTO `tiennghicuaphong` VALUES (49, 19);
INSERT INTO `tiennghicuaphong` VALUES (50, 19);
INSERT INTO `tiennghicuaphong` VALUES (56, 19);
INSERT INTO `tiennghicuaphong` VALUES (57, 19);
INSERT INTO `tiennghicuaphong` VALUES (58, 19);
INSERT INTO `tiennghicuaphong` VALUES (60, 19);
INSERT INTO `tiennghicuaphong` VALUES (61, 19);
INSERT INTO `tiennghicuaphong` VALUES (62, 19);
INSERT INTO `tiennghicuaphong` VALUES (64, 19);
INSERT INTO `tiennghicuaphong` VALUES (65, 19);
INSERT INTO `tiennghicuaphong` VALUES (66, 19);
INSERT INTO `tiennghicuaphong` VALUES (68, 19);
INSERT INTO `tiennghicuaphong` VALUES (69, 19);

SET FOREIGN_KEY_CHECKS = 1;
