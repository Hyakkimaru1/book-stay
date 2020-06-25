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
  checkIsRoom: id => db.load(`SELECT * FROM phong WHERE id=${id}`),
  checkRoomInvalid: (id,date1,date2) => db.load(`SELECT * FROM hetphong WHERE phong=${id} AND ngayHetPhong >= '${date1}' AND ngayHetPhong < '${date2}'`),
  checkRoomInvalidNow: (id,date1) => db.load(`SELECT * FROM hetphong WHERE phong=${id} AND ngayHetPhong >= ${date1}`),
  getImg: id => db.load(`SELECT img FROM img WHERE phong = ${id}`),
  getOwner: id => db.load(`SELECT nguoidung.id, nguoidung.ten, nguoidung.avatar,nguoidung.timeCreate
  FROM phong JOIN nguoidung on phong.nguoiDang = nguoidung.id
  WHERE phong.id = ${id}`),
  getLengthCmt: id => db.load(`SELECT COUNT(*) as length FROM danhgia WHERE phong = ${id}`),
  addTienNghiCuaPhong: entity => db.add('tiennghicuaphong',entity),
  getRoomValid: id => db.load(`SELECT * FROM phong JOIN img ON phong.id = img.id WHERE phong.id = ${id}`),
  addNguoiDatPhong: entity => db.add('danhsachdatphong',entity),
  searchPhongDaDat: entity => db.load(`select * from danhsachdatphong where phong = ${entity.phong} 
  and nguoidat = ${entity.nguoidat} and ngaycheckin='${entity.ngaycheckin}' and ngaycheckout = '${entity.ngaycheckout}' and sokhach = ${entity.sokhach}`),
};