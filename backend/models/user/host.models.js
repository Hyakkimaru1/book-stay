const db = require('../../utils/db');

module.exports = {
  all: () => db.load('select * from nguoidung'),
  single: async id =>{
    const rows = await db.load(`select * from nguoidung where id = ${id}`);
    if (rows.length === 0)
      return null;
    return rows[0];
  } ,
  addRoom: entity =>db.add('phong',entity),
  addImgRoom: entity =>db.add('img',entity),
  getHost: id => db.load(`SELECT ten,gioiThieu,avatar,timeCreate FROM nguoidung WHERE id=${id} and upHost=2 `),
  getRoomByHost: id => db.load(`
  SELECT phong.*,img.img 
  FROM phong JOIN img on img.phong = phong.id 
  WHERE nguoiDang = ${id} AND trangThai=1
  GROUP BY phong.id`),
  getVoteInRoom: (id,idRoom) => db.load(`SELECT danhGia FROM phong JOIN danhgia ON phong.id = danhgia.phong WHERE nguoiDang = ${id} AND phong = ${idRoom}`),
  //need to check the status that user paid or not `danhsachdatphong.trangthai = 0` 
  getWhoBookTheRoomD: (id,idHost) => db.load(`SELECT phong.diaChi, phong.id as idphong,phong.ten as tenphong, img.img, nguoidung.ten as tennguoidat, nguoidung.sdt as sdtnguoidat, nguoidung.email as emailnguoidat, danhsachdatphong.*,COUNT(*) 
  FROM danhsachdatphong JOIN phong ON danhsachdatphong.phong = phong.id JOIN nguoidung ON nguoidung.id = danhsachdatphong.nguoidat JOIN img ON phong.id = img.phong
  WHERE phong.nguoiDang = ${idHost} AND danhsachdatphong.id=${id} AND danhsachdatphong.trangthai=1
  GROUP BY danhsachdatphong.id`),
  getWhoBookTheRoomSearch: (idHost,filter,title_like,paginate,offset) => db.load(`SELECT phong.diaChi, phong.id as idphong,phong.ten as tenphong, img.img, nguoidung.ten as tennguoidat, nguoidung.sdt as sdtnguoidat, nguoidung.email as emailnguoidat, danhsachdatphong.*
  FROM danhsachdatphong JOIN phong ON danhsachdatphong.phong = phong.id JOIN nguoidung ON nguoidung.id = danhsachdatphong.nguoidat JOIN img ON phong.id = img.phong
  WHERE ${filter} phong.nguoiDang = ${idHost} AND danhsachdatphong.trangthai=1 AND MATCH(danhsachdatphong.ten, danhsachdatphong.email,danhsachdatphong.sdt)
  AGAINST ('${title_like}' IN NATURAL LANGUAGE MODE)	
  GROUP BY danhsachdatphong.id
  LIMIT ${paginate} 
  OFFSET ${offset}`),
  getNumPageSearch: (idHost,filter,title_like) => db.load(`SELECT COUNT(*) as num_page
  FROM danhsachdatphong JOIN phong ON danhsachdatphong.phong = phong.id 
  WHERE ${filter} phong.nguoiDang = ${idHost} AND danhsachdatphong.trangthai=1 AND MATCH(danhsachdatphong.ten, danhsachdatphong.email,danhsachdatphong.sdt)
  AGAINST ('${title_like}' IN NATURAL LANGUAGE MODE)`),
  getWhoBookTheRoom: (idHost,filter,paginate,offset) => db.load(`SELECT phong.diaChi, phong.id as idphong,phong.ten as tenphong, img.img, nguoidung.ten as tennguoidat, nguoidung.sdt as sdtnguoidat, nguoidung.email as emailnguoidat, danhsachdatphong.*
  FROM danhsachdatphong JOIN phong ON danhsachdatphong.phong = phong.id JOIN nguoidung ON nguoidung.id = danhsachdatphong.nguoidat JOIN img ON phong.id = img.phong
  WHERE ${filter} phong.nguoiDang = ${idHost} AND danhsachdatphong.trangthai=1
  GROUP BY danhsachdatphong.id
  LIMIT ${paginate} 
  OFFSET ${offset}`),
  getNumPage: (idHost,filter) => db.load(`SELECT COUNT(*) as num_page
  FROM danhsachdatphong JOIN phong ON danhsachdatphong.phong = phong.id 
  WHERE ${filter} phong.nguoiDang = ${idHost} AND danhsachdatphong.trangthai=1`)
};