const db = require('../../utils/db');

module.exports = {
  all: () => db.load('select * from phong'),
  single: async id =>{
    const rows = await db.load(`select * from phong where id = ${id}`);
    if (rows.length === 0)
      return null;
    return rows[0];
  } ,
  getTienNghiPhong: id => db.load(`SELECT tenTienNghi,icon,tenDanhMuc
  FROM tiennghicuaphong tncp JOIN tiennghi tn ON tncp.tiennghi = tn.id, tiennghicategory ct
  WHERE tn.tiennghicategory = ct.id and tncp.phong = ${id} `), 
  getTienNghi: _ => db.load(`SELECT tenTienNghi,icon,tenDanhMuc
  FROM tiennghi tn , tiennghicategory ct
  WHERE tn.tiennghicategory = ct.id`),
  getComment: id => db.load(`SELECT danhGia,\`comment\`,id,ten,avatar
  FROM danhgia dg JOIN nguoidung nd ON dg.nguoiDung = nd.id
  WHERE dg.phong = ${id}`),
  checkIsRoom: id => db.load(`SELECT * FROM phong WHERE id=${id} and trangThai = 1`),
  checkRoomInvalid: (id,date1,date2) => db.load(`SELECT * FROM hetphong WHERE phong=${id} AND ngayHetPhong >= '${date1}' AND ngayHetPhong < '${date2}' AND ( sophongconlai = 0 OR permission = 1)`),
  checkRoomInvalidNow: (id,date1) => db.load(`SELECT * FROM hetphong WHERE phong=${id} AND ngayHetPhong >= ${date1} AND ( sophongconlai = 0 OR permission = 1)`),
  getImg: id => db.load(`SELECT img FROM img WHERE phong = ${id}`),
  getOwner: id => db.load(`SELECT nguoidung.id, nguoidung.ten, nguoidung.avatar,nguoidung.timeCreate
  FROM phong JOIN nguoidung on phong.nguoiDang = nguoidung.id
  WHERE phong.id = ${id}`),
  getLengthCmt: id => db.load(`SELECT COUNT(*) as length FROM danhgia WHERE phong = ${id}`),
  addTienNghiCuaPhong: entity => db.add('tiennghicuaphong',entity),
  getRoomValid: id => db.load(`SELECT * FROM phong JOIN img ON phong.id = img.phong WHERE phong.id = ${id}`),
  // nguoidatphong
  addNguoiDatPhong: entity => db.add('danhsachdatphong',entity),
  getNguoiDatPhong: id => db.load(`select * from danhsachdatphong where id = ${id}`),
  updateNguoiDatPhong: (entity,condition) => db.patch('danhsachdatphong',entity,{id:condition}),
  searchPhongDaDat: entity => db.load(`select * from danhsachdatphong where phong = ${entity.phong} 
  and nguoidat = ${entity.nguoidat} and ngaycheckin='${entity.ngaycheckin}' and ngaycheckout = '${entity.ngaycheckout}' and sokhach = ${entity.sokhach}`),
  
  updateRoom: (entity, condition) => db.patch('phong',entity,{id:condition}),
  updateOutOfRoom: (entity, condition) => db.patch('hetphong',entity,{id:condition}),
  removeAllTienNghi: condition => db.del('tiennghicuaphong',{phong:condition}),
  getImg: id => db.load(`SELECT * FROM img WHERE phong = ${id}`),
  delImg: condition => db.del('img',{phong:condition}),
  removeOutOfRoom: condition => db.del('hetphong',condition),
  addOutOfRoom: entity => db.add('hetphong',entity),
  getTheMostBook: _ => db.load('SELECT pg.id,pg.ten,pg.diaChi,pg.soKhachToiDa,pg.giaNgayThuong,pg.soPhong,pg.soGiuong, COUNT(pg.id) AS list FROM `danhsachdatphong` ds JOIN phong pg ON  pg.id=ds.phong where pg.trangThai=1 and ds.trangthai = 1 GROUP BY pg.id,pg.ten,pg.diaChi,pg.soKhachToiDa,pg.giaNgayThuong,pg.soPhong,pg.soGiuong Order By list DESC LIMIT 4'),
  getJustBook: _ => db.load('SELECT DISTINCT pg.id,pg.ten,pg.diaChi,pg.soKhachToiDa,pg.giaNgayThuong,pg.soPhong,pg.soGiuong FROM `danhsachdatphong` ds JOIN phong pg ON  pg.id=ds.phong where pg.trangThai=1 and ds.trangthai = 1 LIMIT 4'),
  getImgRoom: (id) => db.load(`SELECT img.img FROM img JOIN phong WHERE  img.phong = phong.id and phong.id = ${id} GROUP BY img.phong`),
  getRoomInHCM: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Ho Chi minh' IN NATURAL LANGUAGE MODE)`),
  getRoomInHN: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Hà Nội' IN NATURAL LANGUAGE MODE)`),
  getRoomInVT: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Vũng tàu' IN NATURAL LANGUAGE MODE)`),
  getRoomInHA: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Hội An' IN NATURAL LANGUAGE MODE)`),
  getRoomInDN: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Đà Nẵng' IN NATURAL LANGUAGE MODE)`),
  getRoomInNT: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Nha Trang' IN NATURAL LANGUAGE MODE)`),
  getRoomInDL: () => db.load(`SELECT count(*) as rooms FROM phong WHERE trangThai=1 and MATCH (diaChi) AGAINST ('Đà Lạt' IN NATURAL LANGUAGE MODE)`),
  getOutOffRoom: (phong,ngayHetPhong) => db.load(`SELECT * FROM hetphong WHERE phong = ${phong} and ngayHetPhong = '${ngayHetPhong}'`),
  getOutOffRoomId: (id) => db.load(`SELECT * FROM hetphong WHERE id = ${id}`),
};