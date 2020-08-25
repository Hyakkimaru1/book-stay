const db = require("../../utils/db");

module.exports = {
  all: () => db.load("select * from nguoidung"),
  single: async (id) => {
    const rows = await db.load(`select * from nguoidung where id = ${id}`);
    if (rows.length === 0) {
      return null;
    }
    return rows[0];
  },
  regHost: async (id) => {
    const condition = { id: id };
    const entity = { upHost: 1 };
    return db.patch("nguoidung", entity, condition);
  },
  singleUsername: async (username) => {
    const rows = await db.load(
      `select * from nguoidung where email = "${username}"`,
    );
    if (rows.length === 0) {
      return null;
    }
    return rows[0];
  },
  updateUser: (entity, condition) =>
    db.patch("nguoidung", entity, { id: condition }),
  getUserByEmail: async (email) => {
    const rows = await db.load(
      `select * from nguoidung where email = '${email}'`,
    );
    if (rows.length === 0) {
      return null;
    }
    return rows[0];
  },
  addRecoveryKey: (entity) => db.add("recoverykey", entity),
  removeRecoveryKey: (condition) => db.del("recoverykey", condition),
  getRecoveryKey: (id, key) =>
    db.load(
      `select * from recoverykey where user = '${id}' and keyRecovery = ${key}`,
    ),
  addUser: (entity) => db.add("nguoidung", entity),

  patchByEmail: (entity) => {
    const condition = { email: entity.email };
    delete entity.email;
    return db.patch("nguoidung", entity, condition);
  },
  allBooking: (id) =>
    db.load(
      `SELECT d.*,p.trangThai as trangthaiphong,p.ten,p.diaChi FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}" ORDER BY id DESC`,
    ),
  allBookingRange: (id, ngaycheckin, ngaycheckout) =>
    db.load(
      `SELECT d.*,p.trangThai as trangthaiphong,p.ten,p.diaChi FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}"  and '${ngaycheckin}' <= d.ngaycheckin and '${ngaycheckout}' >= ngaycheckin ORDER BY id DESC`,
    ),
  allBookingTrangThai: (id, trangthai) =>
    db.load(
      `SELECT d.*,p.trangThai as trangthaiphong,p.ten,p.diaChi FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}" and d.trangthai = ${trangthai} ORDER BY id DESC`,
    ),
  allBookingTrangThaiValid: (id, trangthai) =>
    db.load(
      `SELECT d.*,p.trangThai as trangthaiphong,p.ten,p.diaChi FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}" and d.trangthai = ${trangthai} and CURRENT_DATE() < ngaycheckin ORDER BY id DESC`,
    ),
  allBookingTrangThaiRange: (id, trangthai, ngaycheckin, ngaycheckout) =>
    db.load(
      `SELECT d.*,p.trangThai as trangthaiphong,p.ten,p.diaChi FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}" and d.trangthai = ${trangthai} and '${ngaycheckin}' <= d.ngaycheckin and '${ngaycheckout}' >= ngaycheckin ORDER BY id DESC`,
    ),
  allBookingTrangThaiValidRange: (id, trangthai, ngaycheckin, ngaycheckout) =>
    db.load(
      `SELECT d.*,p.trangThai as trangthaiphong,p.ten,p.diaChi FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}" and d.trangthai = ${trangthai} and CURRENT_DATE() < ngaycheckin and '${ngaycheckin}' <= d.ngaycheckin and '${ngaycheckout}' >= d.ngaycheckin ORDER BY id DESC`,
    ),
  sendFeedback: (entity) => db.add("danhgia", entity),
  updateUser: (entity, condition) =>
    db.patch("nguoidung", entity, { id: condition }),
  getDetailCancel: (id) =>
    db.load(
      `SELECT * FROM danhsachdatphong WHERE id = ${id} and trangthai = 1 and ngaycheckin > CURRENT_DATE`,
    ),
  checkComment: (id) =>
    db.load(`SELECT * from danhgia where dondatphong = ${id}`),

  getRoomsSearch: (title_like, paginate, offset) => {
    const key = "%" + title_like + "%";
    const row = db.load(`SELECT p.*, i.img , ROUND(AVG(d.danhGia)) as rate
    FROM (phong p LEFT JOIN img i ON p.id = i.phong) LEFT JOIN danhgia d
     ON p.id = d.phong 
		 WHERE p.trangthai = 1 and (CONCAT(p.ten, p.diaChi) LIKE "${key}")
    GROUP BY p.id
    LIMIT ${paginate} 
    OFFSET ${offset}`);
    if (row.length === 0) {
      return null;
    }
    return row;
  },
  getNumRoomsSearch: (title_like) => {
    const key = "%" + title_like + "%";
    const row = db.load(`SELECT COUNT(*) as total
      FROM phong 
      WHERE phong.trangthai = 1 and (CONCAT(phong.ten, phong.diaChi) LIKE "${key}")
      `);

    if (row.length === 0) {
      return null;
    }
    return row;
  },
  getUsersSearch: (title_like) => {
    const key = "%" + title_like + "%";
    const row = db.load(`SELECT *
      FROM nguoidung 
      WHERE (CONCAT(nguoidung.ten, nguoidung.email) LIKE "${key}")
     `);
    if (row.length === 0) {
      return null;
    }
    return row;
  },
};

//
